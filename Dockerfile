# Use the latest Alpine Linux as base for smallest image
FROM alpine:latest

# Update package index and install GnuPG
RUN apk update && apk add --no-cache gnupg

# Set GPG as the entrypoint
ENTRYPOINT ["gpg"]

# Default command to show help
CMD ["--help"]
