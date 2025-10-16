# gpg-keygen
GPG Key Generator Dockerfile

## Usage

### Basic Usage
Display GPG help:
```bash
docker run jnovent/gpg-keygen
```

### Generate GPG Key with Volume
To generate a GPG key and save it to your local machine, use a volume mount:

```bash
# Create a local directory for GPG keys
mkdir -p ~/.gnupg-docker

# Generate a new GPG key (interactive)
docker run -it -v ~/.gnupg-docker:/root/.gnupg jnovent/gpg-keygen --full-generate-key

# List keys in your local volume
docker run -v ~/.gnupg-docker:/root/.gnupg jnovent/gpg-keygen --list-keys

# Export a public key to your local machine
docker run -v ~/.gnupg-docker:/root/.gnupg jnovent/gpg-keygen --armor --export user@example.com > ~/my-public-key.asc

# Export a private key to your local machine
docker run -v ~/.gnupg-docker:/root/.gnupg jnovent/gpg-keygen --armor --export-secret-keys user@example.com > ~/my-private-key.asc
```

### Important Notes
- The `-v ~/.gnupg-docker:/root/.gnupg` flag mounts a local directory to the container's GPG home directory
- All keys generated in the container will be persisted in your local `~/.gnupg-docker` directory
- You can access and manage these keys even after the container exits
- Use `-it` flag for interactive commands like `--full-generate-key`

### Advanced Examples

Generate a key with specific parameters:
```bash
docker run -it -v ~/.gnupg-docker:/root/.gnupg jnovent/gpg-keygen --gen-key
```

Sign a file (mount both GPG directory and the file):
```bash
docker run -v ~/.gnupg-docker:/root/.gnupg -v $(pwd):/work -w /work jnovent/gpg-keygen --sign myfile.txt
```

Verify a signature:
```bash
docker run -v ~/.gnupg-docker:/root/.gnupg -v $(pwd):/work -w /work jnovent/gpg-keygen --verify myfile.txt.gpg
```
