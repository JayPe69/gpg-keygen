# Use the latest Alpine Linux as base for smallest image
FROM alpine:latest

# Install GnuPG
RUN apk add --no-cache gnupg

# Set GPG as the entrypoint
ENTRYPOINT ["gpg"]

# Default command to show help
CMD ["--help"]
