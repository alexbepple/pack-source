#!/bin/bash

function require_dir() {
    if [ ! -d "$1" ]; then
        echo $2
        exit 1
    fi
}
function require_not_empty() {
    if [ -z "$1" ]; then
        echo "$2"
        exit 1
    fi
}

project=$(basename "$1")
require_dir "$project" "What shall I pack?"

tag="$2"
require_not_empty "$tag" "Which tag shall I pack?"

archive_basename="$project"_"$tag"

cd "$project"
    git checkout "$tag"
cd -
pack.source.for.course "$project" "$archive_basename"
