# Use the barebones version of Ruby 2.2.3.
FROM ruby:2.6.0-slim

# Install dependencies:
# - build-essential: To ensure certain gems can be compiled
# - nodejs: Compile assets
# - libpq-dev: Communicate with postgres through the postgres gem
# - postgresql-client-9.4: In case you want to talk directly to postgres
WORKDIR /usr/src/wic-api

RUN apt-get update && apt-get install -qq -y build-essential nodejs libpq-dev --fix-missing --no-install-recommends

# This sets the context of where commands will be ran in and is documented
# on Docker's website extensively.
# Ensure gems are cached and only get updated when they change. This will
# drastically increase build times when your gems do not change.
COPY Gemfile ./

RUN gem install bundler
RUN bundle install

# Copy in the application code from your work station at the current directory
# over to the working directory.
COPY . .

# The default command that gets ran will be to start the Unicorn server.
CMD ["bundle", "exec", "puma"]