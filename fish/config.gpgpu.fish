alias tmux "tmux-next -u"
alias emacs 'env LC_CTYPE=ja_JP.UTF-8 SHELL=/bin/bash emacs-25.3'
alias ls 'exa --git --sort=modified'
alias ll 'exa --git --sort=modified -lh'
alias lt 'exa --git --sort=name -lh --tree'

set -x JAVA_HOME /usr/lib/jvm/default-java

set -g VIRTUALFISH_VERSION 1.0.5;set -g VIRTUALFISH_PYTHON_EXEC /usr/bin/python3;source /home/bor/.local/lib/python3.5/site-packages/virtualfish/virtual.fish;emit virtualfish_did_setup_plugins

# TensorFlow (GPU)

set -x CUDA_HOME /usr/local/cuda
set -x LD_LIBRARY_PATH $LD_LIBRARY_PATH:$CUDA_HOME/lib64:$CUDA_HOME/extras/CUPTI/lib64

set -x TF_NEED_JEMALLOC 1
set -x TF_NEED_GCP 0
set -x TF_NEED_HDFS 0
set -x TF_ENABLE_XLA 0
set -x TF_NEED_VERBS 0
set -x TF_NEED_OPENCL 0
set -x TF_NEED_MKL 1
set -x TF_NEED_MPI 0
set -x TF_NEED_CUDA 1
set -x GCC_HOST_COMPILER_PATH /usr/bin/gcc
set -x TF_CUDA_CLANG 0
set -x CLANG_CUDA_COMPILER_PATH /usr/bin/clang
set -x CUDA_TOOLKIT_PATH $CUDA_HOME
set -x TF_CUDA_VERSION (eval $CUDA_TOOLKIT_PATH/bin/nvcc --version | sed -n 's/^.*release \(.*\),.*/\1/p')
set -x CUDNN_INSTALL_PATH /usr/include
set -x TF_CUDNN_VERSION (sed -n 's/^#define CUDNN_MAJOR\s*\(.*\).*/\1/p' $CUDNN_INSTALL_PATH/cudnn.h)
set -x TF_CUDA_COMPUTE_CAPABILITIES '6.1'

# DyNet

set -x LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64:$HOME/Dependencies/dynet/build/dynet
