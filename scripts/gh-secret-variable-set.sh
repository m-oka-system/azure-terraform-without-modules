#! /bin/bash

# GitHub Login
gh auth login

# Create environments
gh api repos/:owner/:repo/environments/dev --method PUT
gh api repos/:owner/:repo/environments/prod --method PUT

# Register repository secrets
gh secret set -f .secrets

# Register environment secrets (dev)
gh secret set --env dev -f .secrets.dev

# Register environment secrets (prod)
gh secret set --env prod -f .secrets.prod

# Register repository variables
gh variable set -f variables

# Register environment variables (dev)
gh variable set --env dev -f variables.dev

# Register environment variables (prod)
gh variable set --env prod -f variables.prod
