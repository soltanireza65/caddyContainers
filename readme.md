# Make sure to have
- sudo access
- Your public ssh keys added to the github

# Getting started
- List your apps in `deploy.sh` to clone and pull to latest changes
- Include the app in `docker-compose.yaml`
- Add reverse proxt to Caddyfile

# run
```bash
./deploy.sh
```