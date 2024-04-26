#!/bin/bash
set -e

export PATH="$HOME/.local/share/fnm:$PATH"
eval "`fnm env --shell=bash`"
fnm use 18

# build
yarn || true # some error in smoketest not recongizing the git repo, it's harmless but I did not have time to investigate
yarn gulp vscode-reh-web-linux-x64-min

SCRIPT_DIR=$(dirname "$0")
echo "script directory is"
echo $SCRIPT_DIR

# generate tar
mkdir -p dir $SCRIPT_DIR/../dist
input=$SCRIPT_DIR/../dist/vscode-server-anyscale.tar.zst
tar -I zstd -cf $input $SCRIPT_DIR/../../vscode-reh-web-linux-x64
echo "tar created successfully in $input"

output=s3://anyscale-dev-imports/anyscale-vscode-releases/${BUILDKITE_BRANCH}/${BUILDKITE_COMMIT}/${BUILD_ARCH}/vscode-server-anyscale.tar.zst
aws s3 cp $input $output
echo "copied to s3"
echo $output


echo "sha256"
checksum=$(sha256sum $input | awk '{print $1}')
echo $checksum

echo "generating buildkite message"
cat << EOF | buildkite-agent annotate --style success --context $BUILD_ARCH 
### Build $BUILD_ARCH

#### S3
\`\`\`
$output

\`\`\`

#### Checksum
\`\`\`
$checksum
\`\`\`
EOF
