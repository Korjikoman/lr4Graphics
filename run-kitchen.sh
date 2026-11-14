#!/usr/bin/env bash
set -euo pipefail
lab_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
repo_dir="$lab_dir/example/raytracing-book"
jar_path="$repo_dir/build/libs/raytracing_book-0.0.3.jar"
cd "$repo_dir"
if [[ ! -f "$jar_path" ]] || [[ -n "$(find src build.gradle -type f -newer "$jar_path" -print -quit)" ]]; then
    bash ./gradlew --console=plain jar
fi
exec java -jar "$jar_path" "$@"
