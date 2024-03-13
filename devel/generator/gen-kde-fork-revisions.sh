#!/bin/bash
set -e # abort on first error
shopt -s nullglob
bindir=$(dirname "$0")
source "$bindir/../versions.sh"
expected_version=${versions[qt5]}.*

arch_pkgbuilds=$1
[[ $arch_pkgbuilds ]] && cd "$arch_pkgbuilds"

echo "expected version: $expected_version"

for pkgbuild in qt5-*/PKGBUILD ; do
    source "$pkgbuild"
    if [[ $pkgname != qt5-doc ]] && [[ $pkgver =~ $expected_version ]] && [[ $_commit ]]; then
        if [[ $pkgver == "${versions[qt5]}" ]]; then
            pkgver=0
        fi
        echo "${pkgname##qt5-} => [${pkgver##*+r}, '$_commit']",
    fi
done

