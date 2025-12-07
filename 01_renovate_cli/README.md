# RENOVATE CLI

TODO:

* Config validation


```sh
brew info renovate

brew install renovate
```

```sh
nvm install --lts
npm install -g renovate
renovate

renovate --version

export RENOVATE_TOKEN=$(gh auth token)
renovate .
```


```sh
npx --yes --package renovate -- renovate-config-validator --strict
```



```sh
ls $TMPDIR/renovate 
rm -rf "$TMPDIR/renovate"

export RENOVATE_CONFIG_FILE=./01_renovate_cli/renovate.json
export RENOVATE_TOKEN=$(gh auth token)
LOG_LEVEL=debug RENOVATE_PLATFORM=local renovate



unset RENOVATE_CONFIG_FILE
export RENOVATE_TOKEN=$(gh auth token)
RENOVATE_CACHE=reset LOG_LEVEL=debug RENOVATE_PLATFORM=local renovate

export RENOVATE_TOKEN=$(gh auth token)
RENOVATE_PLATFORM=local RENOVATE_DRY_RUN=full RENOVATE_CACHE=reset RENOVATE_REINIT=true RENOVATE_PLATFORM=local LOG_LEVEL=debug renovate

```


## Resources

* https://docs.renovatebot.com/getting-started/running/
* https://docs.renovatebot.com/examples/self-hosting/
* https://docs.renovatebot.com/config-validation/
