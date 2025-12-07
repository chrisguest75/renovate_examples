# RENOVATE EXAMPLES

Demonstrate how to use renovate to identify packages for upgrade and fix them.  

## Renovate

Validate the configuration

```sh
npx --yes --package renovate -- renovate-config-validator --strict
```

Detect out-of-date components.

```sh
# get the token on the host and copy it into devcontainer
cp .env.template .env

# fill the token value in
export RENOVATE_TOKEN=$(gh auth token)
echo "export RENOVATE_TOKEN=$(gh auth token)"

# look at suggested upgrades
just scan-local

# raise PR
just scan
```

## Resources

* [How To Use Mend Renovate For Automated Management Of Vulnerabilities In Code Projects](https://www.youtube.com/watch?v=HbKIqK5L8-E)
* https://github.com/marketplace/renovate
* https://docs.renovatebot.com/getting-started/installing-onboarding/
* https://github.com/renovatebot/renovate
* https://docs.renovatebot.com/bot-comparison/