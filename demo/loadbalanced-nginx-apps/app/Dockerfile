FROM nginx:alpine

# Set metadata
LABEL maintainer="Thomas Bendler <project@bendler-net.de>"
LABEL version="1.0"
LABEL description="Creates a nginx Alpine latest container"

# Set environment
ENV LANG en_US.UTF-8
ENV TERM xterm

# Remove nginx standard configuration
RUN rm /etc/nginx/conf.d/*

# Copy local nginx configuration to container
COPY default.conf /etc/nginx/conf.d/

# Copy local index file to container
COPY index.html /usr/share/nginx/html
