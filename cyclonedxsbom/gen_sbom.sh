#!/usr/bin/env bash
set -e

## purpose: generate a CycloneDX sBOM

help() {
  echo "Generates a CycloneDX sBOM file for the given project"
}

gen_sbom_for_npm_project() {
  OUTPUT_FILENAME="sbom.json"
  SWITCHES_GLOBAL="--flatten-components --output-file ${OUTPUT_FILENAME} --short-PURLs"

  npx --yes --package @cyclonedx/cyclonedx-npm --call exit

  if [ -f "package-lock.json" ] || [ -f "npm-shrinkwrap.json" ]; then
    echo "found npm package lock file. Using --package-lock-only switch"
    npx @cyclonedx/cyclonedx-npm ${SWITCHES_GLOBAL} --package-lock-only
  else
    echo "no npm package lock file found. running with npm install"
    npm install --force
    npx @cyclonedx/cyclonedx-npm ${SWITCHES_GLOBAL} --ignore-npm-errors
  fi
}

if [ "$1" == "-h" ]; then
  help
  exit 0
fi

if [ -f "package.json" ]; then
  echo "package.json file found. Generating sBOM for node/npm based projects"
  gen_sbom_for_npm_project
else
  echo "ERROR: unknown project format"
  exit 1
fi
