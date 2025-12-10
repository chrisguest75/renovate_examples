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

execute-task action="":  
  #!/usr/bin/env bash
  set -eufo pipefail

  echo "****************************************"
  echo "Executing '{{ action }}' on dockerfiles"
  echo "****************************************"
  just -f ./projects/dockerfiles/justfile {{ action }}
  echo "****************************************"
  echo "Executing '{{ action }}' on 01_test_node20"
  echo "****************************************"
  just -f ./projects/typescript/01_test_node20/justfile {{ action }}
  echo "****************************************"
  echo "Executing '{{ action }}' on 08_pino_logger"
  echo "****************************************"
  just -f ./projects/typescript/08_pino_logger/justfile {{ action }}

  echo "****************************************"
  echo "Executing '{{ action }}' on 49_uv"
  echo "****************************************"
  just -f ./projects/python/49_uv/justfile {{ action }}
  echo "****************************************"
  echo "Executing '{{ action }}' on 24_quine"
  echo "****************************************"
  just -f ./projects/terraform/24_quine/justfile {{ action }}


clean:  
  just execute-task clean

install:  
  just execute-task install

lint:  
  just execute-task lint

build:  
  just execute-task build

test:  
  just execute-task test


  
