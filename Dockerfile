FROM node:16.19.1 as base
# ARG env

# FROM base AS builder

RUN mkdir /webapps
WORKDIR /webapps
COPY package.json /webapps
RUN yarn install
ADD . .
# RUN yarn build:$env
RUN npx browserslist@latest --update-db
RUN yarn build

# FROM base AS runner
# WORKDIR /webapps
# COPY --from=builder /webapps .
