#!/usr/bin/bash

# Copies patches from QT_GIT_REPOS_DIR to default
# variant of all repos and updates sources and checksums

#set -euxo pipefail
set -e # abort on first error
shopt -s nullglob
source /usr/share/makepkg/util/message.sh
colorize

scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
for r in "$QT_GIT_REPOS_DIR/qt"*; do
    repo="${r##*/qt}"
    [[ $repo == '5ct' || $repo == '5ct-code' || $repo == 'repotools' || $repo == 'webkit' ]] && continue
    msg "Updating repository $repo ..."
    "$scriptdir/update-patches.sh" "$repo" "$@"
done
