#!/usr/bin/env bash
# Workaround from here: https://github.com/renovatebot/renovate/issues/8231#issuecomment-2095239390
# until https://github.com/renovatebot/renovate/issues/28045 is sorted
# modified slightly to better detect which file to update

set -euo pipefail

parent_dir="$1"
is_major="$2"
is_minor="$3"
is_patch="$4"

version=$(grep "^version:" "${parent_dir}/Chart.yaml" | awk '{print $2}')
if [[ ! $version ]]; then
  echo "No valid version was found"
  exit 1
fi

major=$(echo "$version" | cut -d. -f1)
minor=$(echo "$version" | cut -d. -f2)
patch=$(echo "$version" | cut -d. -f3)

# Bump major version
if [[ "$is_major" = 'true' ]]; then
  major=$(( major + 1 ))
  minor=0
  patch=0
fi

# Bump minor version
if [[ "$is_minor" = 'true' ]]; then
  minor=$(( minor + 1 ))
  patch=0
fi

# Bump patch version
if [[ "$is_patch" = 'true' ]]; then
  patch=$(( patch + 1 ))
fi

echo "Bumping version for $parent_dir from $version to $major.$minor.$patch"
sed -i "s/^version:.*/version: ${major}.${minor}.${patch}/g" "${parent_dir}/Chart.yaml"