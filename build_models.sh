
# Pull requests and commits to other branches shouldn't try to deploy, just build to verify
if [ "$TRAVIS_PULL_REQUEST" != "false" -o "$TRAVIS_BRANCH" != "master" ]; then
    echo "Skipping deploy; just doing a build."
    exit 0
fi

# Remove old generated data
cd $TRAVIS_BUILD_DIR

# Generate 3D model data
python _scripts/gen_3dmodel_info.py /home/travis/build/kicad-packages3d/*.3dshapes --output $TRAVIS_BUILD_DIR/_packages3d --download $TRAVIS_BUILD_DIR/download --hash $TRAVIS_BUILD_DIR/_includes/commit_3d.html -v
