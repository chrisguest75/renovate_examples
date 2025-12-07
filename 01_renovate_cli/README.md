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
export RENOVATE_TOKEN=$(gh auth token)
export RENOVATE_CONFIG_FILE=./01_renovate_cli/renovate.json
LOG_LEVEL=debug RENOVATE_PLATFORM=local renovate
```


## Resources

* https://docs.renovatebot.com/getting-started/running/
* https://docs.renovatebot.com/examples/self-hosting/
* https://docs.renovatebot.com/config-validation/
