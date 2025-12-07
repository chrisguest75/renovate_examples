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
export RENOVATE_TOKEN=$(gh auth token)
echo "export RENOVATE_TOKEN=$(gh auth token)"

# look at suggested upgrades
LOG_LEVEL=debug RENOVATE_PLATFORM=local npx --yes renovate

# raise PR
export RENOVATE_REPOSITORIES="chrisguest75/renovate_examples"
LOG_LEVEL=debug npx --yes renovate
```

## Resources

* [How To Use Mend Renovate For Automated Management Of Vulnerabilities In Code Projects](https://www.youtube.com/watch?v=HbKIqK5L8-E)
* https://github.com/marketplace/renovate
* https://docs.renovatebot.com/getting-started/installing-onboarding/
* https://github.com/renovatebot/renovate
* https://docs.renovatebot.com/bot-comparison/