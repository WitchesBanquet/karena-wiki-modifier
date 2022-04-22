VERSION="$1"
VERSION="${VERSION#[vV]}"

docker buildx build --load --platform linux/amd64 -t wiki-js-karena-modified:${VERSION}-amd64 .
docker buildx build --load --platform linux/arm64 -t wiki-js-karena-modified:${VERSION}-arm64 .
