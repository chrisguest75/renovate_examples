# RENOVATE CLI

TODO:

* Config validation

## Install

### Brew

```sh
brew info renovate

brew install renovate
```

### NPM

```sh
nvm install --lts
npm install -g renovate
renovate

renovate --version

cp .env.template .env

npx --yes renovate
```

## Config

```sh
export RENOVATE_CONFIG_FILE=./01_renovate_cli/renovate.json

ls $TMPDIR/renovate 
rm -rf "$TMPDIR/renovate"
```

## Resources

* https://docs.renovatebot.com/getting-started/running/
* https://docs.renovatebot.com/examples/self-hosting/
* https://docs.renovatebot.com/config-validation/
