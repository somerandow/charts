#!/bin/bash

set -ex

# Capture return code to allow uploads to continue even if one fails, and fail job at the end
rc=0
PKG_REGEX="^.cr-release-packages\/([a-z-]+)-([0-9]+\.[0-9]+\.[0-9]+)\.tgz$"
REPO=$1

if [ -z "$1" ]; then
  echo "no repository specified!"
  exit 1
fi

if [ ! -d .cr-release-packages ] || [ -z "$(ls -A .cr-release-packages)" ]; then
  echo "no packages found, exiting gracefully..."
  exit 0
fi

for pkg in .cr-release-packages/*; do
  if [[ ! "${pkg}" =~ ${PKG_REGEX} ]]; then
    echo "invalid package: ${pkg}, skipping..."
    continue
  fi

  pkg_name=${BASH_REMATCH[1]}
  pkg_version=${BASH_REMATCH[2]}

  echo "checking for existing package: ${pkg_name}@${pkg_version}..."

  if helm pull "oci://ghcr.io/${REPO}/${pkg_name}" --version "${pkg_version}" 2> /dev/null; then
    echo "found existing package: ${pkg_name}@${pkg_version}, skipping..."
    rc=1
    continue
  fi
  echo "pushing package: ${pkg_name}@${pkg_version}..."
  if ! helm push "${pkg}" "oci://ghcr.io/${REPO}"; then
    echo "error occurred pushing package: ${pkg_name}@${pkg_version}!"
    echo "continuing with remaining packages..."
    rc=1
  fi
done
exit $rc
