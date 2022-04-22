VERSION="$1"
VERSION="${VERSION#[vV]}"
VERSION_MAJOR="${VERSION%%\.*}"
VERSION_MINOR="${VERSION#*.}"
VERSION_MINOR="${VERSION_MINOR%.*}"
VERSION_PATCH="${VERSION##*.}"

# Single Image
docker image tag wiki-js-karena-modified:${VERSION}-amd64 $2/wiki-js-karena-modified:${VERSION}-amd64
docker image tag wiki-js-karena-modified:${VERSION}-arm64 $2/wiki-js-karena-modified:${VERSION}-arm64
docker image push --all-tags $2/wiki-js-karena-modified

# {MAJOR}.{MINOR}.{PATCH} Manifest
docker manifest create $2/wiki-js-karena-modified:${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_PATCH} \
    $2/wiki-js-karena-modified:${VERSION}-amd64 \
    $2/wiki-js-karena-modified:${VERSION}-arm64

docker manifest push $2/wiki-js-karena-modified:${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_PATCH}

# {MAJOR}.{MINOR} Manifest
docker manifest create $2/wiki-js-karena-modified:${VERSION_MAJOR}.${VERSION_MINOR} \
    $2/wiki-js-karena-modified:${VERSION}-amd64 \
    $2/wiki-js-karena-modified:${VERSION}-arm64

docker manifest push $2/wiki-js-karena-modified:${VERSION_MAJOR}.${VERSION_MINOR}

# {MAJOR} Manifest
docker manifest create $2/wiki-js-karena-modified:${VERSION_MAJOR} \
    $2/wiki-js-karena-modified:${VERSION}-amd64 \
    $2/wiki-js-karena-modified:${VERSION}-arm64

docker manifest push $2/wiki-js-karena-modified:${VERSION_MAJOR}

# Latest Manifest
docker manifest create --amend $2/wiki-js-karena-modified:latest \
    $2/wiki-js-karena-modified:${VERSION}-amd64 \
    $2/wiki-js-karena-modified:${VERSION}-arm64

docker manifest push $2/wiki-js-karena-modified:latest
