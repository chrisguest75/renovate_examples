# syntax=docker/dockerfile:1.4@sha256:9ba7531bd80fb0a858632727cf7a112fbfd19b17e94c4e84ced81e24ef1a0dbc
FROM node:20.19.6-bullseye@sha256:3bf1bf603e3e282c84c627e89a310b9bc9a9cb16871960bf11f522067c6a6014 AS BUILDER
LABEL dockerfile.baseimage="node:20.11.1-bullseye" dockerfile.description="01_test_node20" dockerfile.stage="BUILDER"

WORKDIR /scratch

RUN curl -sf -o /bin/node-prune https://gobinaries.com/tj/node-prune && chmod +x /bin/node-prune && /bin/node-prune

COPY package.json package-lock.json ./
# https://docs.npmjs.com/cli/v7/commands/npm-ci
RUN npm ci

COPY tsconfig.json .prettierrc jest.config.cjs .eslintrc ./
COPY src ./src
COPY tests ./tests
RUN npm run lint
#RUN npm run test:coverage
RUN npm run build
RUN npm run audit:production
RUN npm ci --only=production && npm cache clean --force

# prune the node_modules
RUN /usr/local/bin/node-prune --verbose ./node_modules

FROM gcr.io/distroless/nodejs20-debian11:debug@sha256:565c9cca015cc2eae5d0ed9d1f52af60d26570123ac19445bff0a6ecfde65007 AS PRODUCTION
LABEL dockerfile.baseimage="gcr.io/distroless/nodejs:20" dockerfile.description="01_test_node20" dockerfile.stage="PRODUCTION"

ENV NODE_ENV production

WORKDIR /work
COPY --from=BUILDER /scratch/package.json /scratch/package-lock.json ./
COPY --from=BUILDER /scratch/node_modules ./node_modules
COPY --from=BUILDER /scratch/build ./

CMD ["/work/src/index.js"]