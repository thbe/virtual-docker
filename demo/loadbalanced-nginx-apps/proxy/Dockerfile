FROM nginx:alpine

# Set metadata
LABEL maintainer="Thomas Bendler <project@bendler-net.de>"
LABEL version="1.0"
LABEL description="Creates a nginx proxy Alpine latest container"

# Set environment
ENV LANG en_US.UTF-8
ENV TERM xterm

# Remove nginx standard configuration
RUN rm /etc/nginx/conf.d/*

# Copy local proxy configuration to container
COPY proxy.conf /etc/nginx/conf.d/
