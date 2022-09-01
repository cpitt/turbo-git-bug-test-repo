# Turborepo git 2.17.1 bug reproduction

This repo demonstrates a bug with turborepo and git 2.17.1

Note: `turbo.json` has been updated to include an `inputs` declaration

## Prerequisites

- docker
- bash

## Executing

Run:

```bash
bash ./run-repro-steps.sh
```

This script builds 2 docker containers one with git 2.17.1 and one with the
latest git.

It then executes `./test-hash-change.sh` in each of the containers

`./test-hash-change.sh` simply does a dry run changes a file and does another dry run

notice that the hash doesn't change with git 2.17.1
