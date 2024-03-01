# Use an official Ruby image as the base image
FROM ruby:3.1.0

# Set the working directory to /app
WORKDIR /app

# Copy the Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install the Gemfile and its dependencies
RUN bundle install

# Copy the application code
COPY . .

# Expose the port that the app will run on
EXPOSE 3000

# Start the app
CMD ["rails", "server", "-b", "0.0.0.0"]



tkn pipeline start ruby-postgres-pipeline \
  --param git-url=https://github.com/vinutha18-m/argoCD.git \
  --param git-revision=<your-git-revision> \
  --param docker-hub-username=vinutha 18 \
  --param image-name=postgres \
  --param tag=latest