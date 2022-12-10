#!/usr/bin/env bash
set -e

## purpose: generate a CycloneDX sBOM

help() {
  echo "Generates a CycloneDX sBOM file for the given project"
}

gen_sbom_for_npm_project() {
  SWITCHES="--package-lock-only --flatten-components"

  cyclonedx-npm ${SWITCHES} --output sbom.json
}

if [ "$1" == "-h" ]; then
  help
  exit 0
fi

if [ -f "package.json" ]; then
  echo "package.json file found. Generating sBOM for node/npm based projects"
fi
