#!/usr/bin/env -S -- bash -Eeu -o pipefail -O dotglob -O nullglob -O extglob -O failglob -O globstar

set -o pipefail

VERSION="v$(sed -E -n -e 's/VERSION = "([^"]+)"/\1/p' -- lib/sink/version.rb | tr -d -- ' ')"

if ! git diff --exit-code; then
  git add -- .
  git commit --message="$VERSION"
fi

git tag --force --annotate --message="$VERSION" "$VERSION"
git push --delete origin -- "$VERSION" || true
git push --tags --force
gh release create --title="Test :: $VERSION" --notes "$VERSION" -- "$VERSION"
