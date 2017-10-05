eval (python3 -m virtualfish)

set -x JAVA_HOME /usr/lib/jvm/default-java

alias ls 'exa --git --sort=modified'
alias ll 'exa --git --sort=modified -lh'
alias lt 'exa --git --sort=name -lh --tree'

# TensorFlow (native only)

set -x TF_NEED_JEMALLOC 1
set -x TF_NEED_GCP 0
set -x TF_NEED_HDFS 0
set -x TF_ENABLE_XLA 0
set -x TF_NEED_VERBS 0
set -x TF_NEED_OPENCL 0
set -x TF_NEED_MKL 1
set -x TF_NEED_MPI 0
set -x TF_NEED_CUDA 0
set -x GCC_HOST_COMPILER_PATH /usr/bin/gcc-5
set -x TF_CUDA_CLANG 0
