# Bun multi-stage build (official pattern), adjusted for Nuxt
FROM oven/bun:1.3.3-slim AS base
WORKDIR /usr/src/app

# Install dev dependencies (cacheable)
FROM base AS install
RUN mkdir -p /temp/dev
COPY package.json bun.lock /temp/dev/
RUN cd /temp/dev && bun install --frozen-lockfile --no-progress

# Install production-only dependencies
RUN mkdir -p /temp/prod
COPY package.json bun.lock /temp/prod/
RUN cd /temp/prod && bun install --frozen-lockfile --production --no-progress

# Build stage
FROM base AS build
COPY --from=install /temp/dev/node_modules node_modules
COPY . .
ENV NODE_ENV=production
RUN bun x nuxt prepare && bun run build

# Final runtime image
FROM base AS release
ENV NODE_ENV=production
ENV NITRO_HOST=0.0.0.0

# Bring in production deps and built output
COPY --from=install /temp/prod/node_modules node_modules
COPY --from=build /usr/src/app/.output .output
COPY --from=build /usr/src/app/package.json package.json

USER bun
EXPOSE 3000

# Health check using Bun's fetch (uses PORT env var at runtime)
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD bun -e "const res = await fetch('http://localhost:' + (process.env.PORT || 3000) + '/'); Bun.exit(res.ok ? 0 : 1);"

# Use shell form to read PORT at runtime, fallback to 3000
CMD sh -c "NITRO_PORT=\${PORT:-3000} bun .output/server/index.mjs"