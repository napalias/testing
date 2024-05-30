# syntax = docker/dockerfile:1

# Adjust NODE_VERSION as desired
ARG NODE_VERSION=20.10.0
FROM node:${NODE_VERSION}-slim as base

LABEL fly_launch_runtime="Remix"

# NodeJS app lives here
WORKDIR /

# Set development environment
ENV NODE_ENV=production

# Setup pnpm
#RUN npm install -g pnpm


# Throw-away build stage to reduce size of final image
FROM base as build

# Install packages needed to build node modules
RUN apt-get update -qq && \
    apt-get install -y python-is-python3 pkg-config build-essential

# Copy application code
#COPY --link . .

# Install node modules
#RUN pnpm install --production=false

# Build application
#RUN pnpm turbo --filter @bnsn/app build

# Remove development dependencies
#RUN pnpm prune --production


# Final stage for app image
#FROM base

# Copy built application
#COPY --from=build /app /app
#RUN ls -la /app
#WORKDIR /app/apps/bnsn-api

# Start the server by default, this can be overwritten at runtime
#CMD [ "pnpm", "run", "start" ]
CMD [ "ls" ]