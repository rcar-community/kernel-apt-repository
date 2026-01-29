#!/bin/bash

REFERENCE=v2026-01-30
RAW_GITHUB_BASE_URL=https://raw.githubusercontent.com/rcar-community/meta-sparrow-hawk/refs
# Check tag(vYYYY-MM-DD) or branch
if [[ "$(echo ${REFERENCE} | grep -E 'v[0-9]{4}-[0-9]{2}-[0-9]{2}')" == "" ]]; then
    YOCTO_BSP_RAW_GITHUB_URL=${RAW_GITHUB_BASE_URL}/heads/${REFERENCE}
else
    YOCTO_BSP_RAW_GITHUB_URL=${RAW_GITHUB_BASE_URL}/tags/${REFERENCE}
fi
unset RAW_GITHUB_BASE_URL

