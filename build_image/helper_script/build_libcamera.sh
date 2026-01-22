#!/bin/bash

# Load common variable
source ./setup_yocto_bsp_variables.sh

# Get information from libcamera recipe in meta-sparrow-hawk
RECIPE_FILENAME="libcamera_git.bb"
RECIPE_URL="${YOCTO_BSP_RAW_GITHUB_URL}/recipes-multimedia/libcamera/${RECIPE_FILENAME}"
wget ${RECIPE_URL}
PATCH_LIST="$(cat ${RECIPE_FILENAME} | grep '.patch ' | sed -e 's|.*file://||' -e 's/\ .*$//')"
SRCREV="$(cat ${RECIPE_FILENAME} | grep SRCREV | cut -d'"' -f2 )"
LIBCAMERA_PIPELINES="$(cat ${RECIPE_FILENAME} | grep ^LIBCAMERA_PIPELINES | cut -d'"' -f2 )"
EXTRA_OEMESON="$(cat ${RECIPE_FILENAME} \
    | sed -e ':loop; /\\$/ {N;s/\\\n//;bloop}' \
    | sed -e "s/-Dpipelines=.*\} /-Dpipelines=${LIBCAMERA_PIPELINES}/" \
    | grep EXTRA_OEMESON | cut -d'"' -f2 )"
rm ${RECIPE_FILENAME}

git clone https://git.libcamera.org/libcamera/libcamera.git
cd libcamera
git checkout -B work ${SRCREV}
for patch in ${PATCH_LIST}; do
    wget ${YOCTO_BSP_RAW_GITHUB_URL}/recipes-multimedia/libcamera/files/${patch}
done

if [[ "$(git config --list | grep user)" == "" ]]; then
    git config user.email "you@example.com"
    git config user.name "Your Name"
fi
git am *.patch

apt-get update
apt-get install -y meson build-essential ninja-build cmake \
    libyaml-dev python3-yaml python3-ply python3-jinja2 \
    libevent-dev pkg-config python3-dev python3-pybind11 libdrm-dev

meson setup ${EXTRA_OEMESON} build
ninja -C build install

# cleanup
# cd ../ && rm -rf libcamera

