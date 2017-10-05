# vbox
set -x VBOX_USB usbfs

# Perl
set -x PATH /usr/bin/vendor_perl $PATH

# TensorFlow

set -x LD_LIBRARY_PATH $LD_LIBRARY_PATH:/opt/cuda/lib64
set -x CUDA_HOME /opt/cuda

set -x TF_NEED_JEMALLOC 1
set -x TF_NEED_GCP 0
set -x TF_NEED_HDFS 0
set -x TF_ENABLE_XLA 0
set -x TF_NEED_VERBS 0
set -x TF_NEED_OPENCL 0
set -x TF_NEED_MKL 1
set -x TF_NEED_MPI 0
set -x TF_NEED_CUDA 1
set -x GCC_HOST_COMPILER_PATH /usr/bin/gcc-5
set -x TF_CUDA_CLANG 0
set -x CLANG_CUDA_COMPILER_PATH /usr/bin/clang
set -x CUDA_TOOLKIT_PATH /opt/cuda
set -x TF_CUDA_VERSION (eval $CUDA_TOOLKIT_PATH/bin/nvcc --version | sed -n 's/^.*release \(.*\),.*/\1/p')
set -x CUDNN_INSTALL_PATH /opt/cuda
set -x TF_CUDNN_VERSION (sed -n 's/^#define CUDNN_MAJOR\s*\(.*\).*/\1/p' $CUDNN_INSTALL_PATH/include/cudnn.h)
set -x TF_CUDA_COMPUTE_CAPABILITIES '5.2'

# Arch Oracle JDK (AUR)
set -x JAVA_HOME /usr/lib/jvm/default

alias ls 'exa --git --sort=modified'
alias ll 'exa --git --sort=modified -lh'
alias lt 'exa --git --sort=name -lh --tree'

# Arch specific
# Pacman alias examples
alias pacupg 'sudo pacman -Syu'        # Synchronize with repositories before upgrading packages that are out of date on the local system.
alias pacin 'sudo pacman -S'           # Install specific package(s) from the repositories
alias pacins 'sudo pacman -U'          # Install specific package not from the repositories but from a file
alias pacre 'sudo pacman -R'           # Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacrem 'sudo pacman -Rns'        # Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacrep 'pacman -Si'              # Display information about a given package in the repositories
alias pacreps 'pacman -Ss'             # Search for package(s) in the repositories
alias pacloc 'pacman -Qi'              # Display information about a given package in the local database
alias paclocs 'pacman -Qs'             # Search for package(s) in the local database
