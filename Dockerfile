# Use docker ruby image
FROM ruby:alpine

# Create directory for ruby app
RUN mkdir -p /usr/src/app/exoplanet

# Install our application source files
ADD . /usr/src/app/exoplanet

# Specify working directory in container
WORKDIR /usr/src/app/exoplanet

# Defaut run command
CMD ["ruby", "planet_start.rb"]
