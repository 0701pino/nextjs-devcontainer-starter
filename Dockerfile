FROM node:20-bullseye-slim AS base

FROM base AS builder

WORKDIR /workspace/next_app

RUN apt-get update && apt-get upgrade -y
COPY next_app/package.json next_app/yarn.lock* ./

COPY next_app/src ./src
COPY next_app/public ./public
COPY next_app/tsconfig.json next_app/*.js ./

RUN yarn --frozen-lockfile

# Next.jsによってテレメトリデータを収集するのを無効にする
ARG NEXT_TELEMETRY_DISABLED=1
ENV NEXT_TELEMETRY_DISABLED=$NEXT_TELEMETRY_DISABLED

RUN  yarn build

FROM base AS runner

WORKDIR /workspace/next_app

USER node

COPY --from=builder /workspace/next_app/public ./public

# 自動的に出力トレースを活用することで、イメージサイズを削減する
# https://nextjs.org/docs/advanced-features/output-file-tracing
COPY --from=builder --chown=node:node /workspace/next_app/.next/standalone ./
COPY --from=builder --chown=node:node /workspace/next_app/.next/static ./.next/static

# Next.jsによってテレメトリデータを収集するのを無効にする
ENV NEXT_TELEMETRY_DISABLED=$NEXT_TELEMETRY_DISABLED

# 注意: ポートのマッピングはdocker-composeで行うため、設定しない

CMD ["node", "server.js"]
