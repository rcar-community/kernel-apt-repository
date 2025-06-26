# kernel-apt-repository
apt repository for debian based distribution

## Repository Structure

- main branch: For build apt-repository and debian based image.
- apt-repo branch: For apt-repository which provides kernel package for sparrow-hawk board

## How to build debian based image

```
# You need to prepare docker envrionment on your Host PC
./build_image/build_with_docker_sparrow-hawk.sh
```
or
```
# Note: Build requirements can be confirmed from build_image/Dockerfile.
sudo ./build_image/build_debian_12_for_sparrow-hawk.sh
```


Pre-built image can be downloaded from release page.


