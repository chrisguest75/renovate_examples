#!/usr/bin/env just --justfile
# ^ A shebang isn't required, but allows a justfile to be executed
#   like a script, with `./justfile test`, for example.

set dotenv-load := true

# default lists actions
default:
  @just -f {{ source_file() }} --list

validate:
  #!/usr/bin/env bash
  set -eufo pipefail

  npx --yes --package renovate -- renovate-config-validator --strict

# ***************************************
# scan
# ***************************************
scan:  
  #!/usr/bin/env bash
  set -eufo pipefail

  npx --yes renovate

scan-local:  
  #!/usr/bin/env bash
  set -eufo pipefail

  unset RENOVATE_REPOSITORIES
  RENOVATE_PLATFORM=local npx --yes renovate

# ***************************************
# clean
# ***************************************

clean:  
  #!/usr/bin/env bash
  set -eufo pipefail

  just -f ./projects/dockerfiles/justfile clean
  just -f ./projects/typescript/01_test_node20/justfile clean
  just -f ./projects/typescript/08_pino_logger/justfile clean

# ***************************************
# install
# ***************************************

install:  
  #!/usr/bin/env bash
  set -eufo pipefail

  just -f ./projects/dockerfiles/justfile install
  just -f ./projects/typescript/01_test_node20/justfile install
  just -f ./projects/typescript/08_pino_logger/justfile install

# ***************************************
# build
# ***************************************

build:  
  #!/usr/bin/env bash
  set -eufo pipefail

  just -f ./projects/dockerfiles/justfile build 
  just -f ./projects/typescript/01_test_node20/justfile build 
  just -f ./projects/typescript/08_pino_logger/justfile build 

# ***************************************
# test
# ***************************************

test:  
  #!/usr/bin/env bash
  set -eufo pipefail

  just -f ./projects/dockerfiles/justfile test
  just -f ./projects/typescript/01_test_node20/justfile test
  just -f ./projects/typescript/08_pino_logger/justfile test 

