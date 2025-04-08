#!/bin/sh

if [ -d env ]; then
  PYTHON="$(which python)"
  if [[ "$PYTHON" == *env/bin/python ]]; then
    echo "Deactivating vEnv"
    deactivate
  else
    echo "Activating vEnv"
    PWD="$(pwd)"
    source $PWD/env/bin/activate
  fi
else
  echo "Creating vEnv"
  python3 -m venv env
  source env/bin/activate
  env/bin/python -m pip install debugpy
fi
