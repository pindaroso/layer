#!/bin/sh
set -ex

cat sample/cifar10_x.csv \
    | csi -script conv.scm -w weights.keras_cifar10_cnn.0 -b biases.keras_cifar10_cnn.0 --input-shape=32,32,3  --filter-shape=3,3 --num-filters=32 -a relu \
    | csi -script conv.scm -w weights.keras_cifar10_cnn.1 -b biases.keras_cifar10_cnn.1 --input-shape=30,30,32 --filter-shape=3,3 --num-filters=32 -a relu \
    | csi -script pool.scm --input-shape=28,28,32 --filter-shape=2,2 --stride=2 -p max