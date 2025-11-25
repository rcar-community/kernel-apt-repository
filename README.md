# kernel-apt-repository
apt repository for debian based distribution

## Repository Structure

- main branch: For build apt-repository and debian based image.
- apt-repo branch: For apt-repository which provides kernel package for sparrow-hawk board

## How to build debian based image

```
# You need to prepare docker envrionment on your Host PC
./build_image/build_with_docker_sparrow-hawk.sh <DEBIAN_VERSION>
ex.) ./build_image/build_with_docker_sparrow-hawk.sh 12
```
or
```
# Note: Build requirements can be confirmed from build_image/Dockerfile.
sudo ./build_image/build_debian_12_for_sparrow-hawk.sh <DEBIAN_VERSION>
ex.) sudo ./build_image/build_debian_12_for_sparrow-hawk.sh 12
```


Pre-built image can be downloaded from release page.

## Note

### Breaking change of Apt repository

Since 2025-11-xx release, apt repository is changed to support multiple version of Debian.
As a result, codename is changed to "kernel" instead of debian codename.
If you want to continue using current image and to update kernel, following change is needed:
```
Before: https://raw.githubusercontent.com/rcar-community/kernel-apt-repository/apt-repo bookwarm main
After:  https://raw.githubusercontent.com/rcar-community/kernel-apt-repository/apt-repo kernel   main
```
If possible, please use latest binary image.

