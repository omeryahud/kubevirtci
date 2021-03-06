#!/usr/bin/env bash

set -e

declare -A IMAGES
IMAGES[gocli]="gocli@sha256:220f55f6b1bcb3975d535948d335bd0e6b6297149a3eba1a4c14cad9ac80f80d"
if [ -z $KUBEVIRTCI_PROVISION_CHECK ]; then
    IMAGES[k8s-fedora-1.17.0]="k8s-fedora-1.17.0@sha256:aebf67b8b1b499c721f4d98a7ab9542c680553a14cbc144d1fa701fe611f3c0d"
    IMAGES[k8s-1.17]="k8s-1.17@sha256:2bb37d65749439d86e53258fb3151697d8339b9e6109aa8d23f577f123380d49"
    IMAGES[k8s-1.16]="k8s-1.16@sha256:cbcd3783f64f4f74610378eee52221249b265dfb55086258f5b442aa8f6d8721"
    IMAGES[k8s-1.15]="k8s-1.15@sha256:9fc04146bb44f3e659970c4599b7f513d8bd72e6d644c3da5640327a121f40cf"
    IMAGES[k8s-1.14]="k8s-1.14@sha256:7cd5c575d9da458e8b8d2bf05d826f28984ba039917898a12e4331934465001c"
    IMAGES[okd-4.1]="okd-4.1@sha256:e7e3a03bb144eb8c0be4dcd700592934856fb623d51a2b53871d69267ca51c86"
    IMAGES[okd-4.2]="okd-4.2@sha256:a830064ca7bf5c5c2f15df180f816534e669a9a038fef4919116d61eb33e84c5"
    IMAGES[okd-4.3]="okd-4.3@sha256:63abc3884002a615712dfac5f42785be864ea62006892bf8a086ccdbca8b3d38"
    IMAGES[ocp-4.3]="ocp-4.3@sha256:d293f0bca338136ed136b08851de780d710c9e40e2a1d18e5a5595491dbdd1ea"
    IMAGES[ocp-4.4]="ocp-4.4@sha256:42497f3a848c2847e3caeff6fbb7f4bb28ee48b692c0541ec7099392067a0387"
fi
export IMAGES

IMAGE_SUFFIX=""
if [[ $KUBEVIRT_PROVIDER =~ (ocp|okd).* ]]; then
    IMAGE_SUFFIX="-provision"
fi

image="${IMAGES[$KUBEVIRT_PROVIDER]:-${KUBEVIRT_PROVIDER}${IMAGE_SUFFIX}:latest}"
export image
