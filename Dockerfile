# syntax=docker/dockerfile:1

# Documentation site only. Build from the repository root:
#   docker build -t skygenesisenterprise/docs .
#   docker run --rm -p 3000:3000 skygenesisenterprise/docs

FROM node:24.4-alpine AS base
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN npm install -g pnpm@12.16.1

FROM base AS build
WORKDIR /app

# Copy the application before installing: the postinstall hook runs
# `fumadocs-mdx`, which reads source.config.ts and the content tree.
COPY . .

RUN --mount=type=cache,id=pnpm,target=/pnpm/store \
	pnpm install --frozen-lockfile

# Regenerate the API reference from public/openapi.json.
RUN pnpm build:docs

ENV NODE_ENV=production
RUN pnpm build

FROM base AS runner
WORKDIR /app

ENV NODE_ENV=production
ENV HOSTNAME=0.0.0.0
ENV PORT=3000

RUN addgroup --system --gid 1001 nodejs \
	&& adduser --system --uid 1001 nextjs

# The standalone output contains the traced server and its dependencies.
COPY --from=build --chown=nextjs:nodejs /app/.next/standalone ./
COPY --from=build --chown=nextjs:nodejs /app/.next/static ./.next/static
COPY --from=build --chown=nextjs:nodejs /app/public ./public

USER nextjs

EXPOSE 3000

CMD ["node", "server.js"]
