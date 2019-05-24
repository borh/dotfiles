source ~/.config/fish/config.desktop.fish

source ~/.config/fish/credentials.(hostname).fish

source ~/.config/fish/fzf.fish

set -x JSGC_DISABLE_POISONING 1
set -x MOZ_ACCELERATED 1
set -x MOZ_WEBRENDER 1

set -x GTK_USE_PORTAL 1
# # Wayland support:
# set -x QT_QPA_PLATFORM wayland-egl
# set -x QT_WAYLAND_FORCE_DPI physical
# set -x QT_WAYLAND_DISABLE_WINDOWDECORATION 1
# set -x SDL_VIDEODRIVER wayland
# set -x GDK_BACKEND wayland
# set -x CLUTTER_BACKEND wayland
# set -x _JAVA_AWT_WM_NONREPARENTING 1
# 
# alias chromium "env GDK_BACKEND='' chromium"

set -x LIBVA_DRIVER_NAME iHD

eval (python3 -m virtualfish)

set -x REQUESTS_CA_BUNDLE /etc/ssl/certs

set -x XDG_RUNTIME_DIR /run/user/(id -u)

set -x XKB_DEFAULT_OPTIONS ctrl:nocaps,caps:none
set -x XKB_DEFAULT_MODEL pc104
setxkbmap -option ctrl:nocaps

# vbox
set -x VBOX_USB usbfs

# Perl
set -x PATH /usr/bin/vendor_perl /usr/bin/core_perl $PATH

# # MKL
# set -x PATH /opt/intel/composerxe/linux/bin/intel64 $PATH
# set -x MKLROOT /opt/intel/composerxe/linux/mkl
# set -x INTEL_LICENSE_FILE /opt/intel/licenses /opt/intel/composerxe/linux/licenses /opt/intel/licenses ~/intel/licenses
# set -x LIBRARY_PATH /opt/intel/composerxe/linux/ipp/lib/intel64 /opt/intel/composerxe/linux/compiler/lib/intel64_lin /opt/intel/composerxe/linux/mkl/lib/intel64_lin /opt/intel/composerxe/linux/ipp/lib/intel64 /opt/intel/composerxe/linux/compiler/lib/intel64_lin /opt/intel/composerxe/linux/mkl/lib/intel64_lin $LIBRARY_PATH
# set -x LD_LIBRARY_PATH $LIBRARY_PATH $LD_LIBRARY_PATH
# set -x NLSPATH /opt/intel/composerxe/linux/compiler/lib/intel64/locale/%l_%t/%N /opt/intel/composerxe/linux/mkl/lib/intel64_lin/locale/%l_%t/%N /opt/intel/composerxe/linux/compiler/lib/intel64/locale/%l_%t/%N /opt/intel/composerxe/linux/mkl/lib/intel64_lin/locale/%l_%t/%N
# set -x CPATH /opt/intel/composerxe/linux/ipp/include /opt/intel/composerxe/linux/mkl/include /opt/intel/composerxe/linux/ipp/include /opt/intel/composerxe/linux/mkl/include
# set -x IPPROOT /opt/intel/composerxe/linux/ipp

# TensorFlow (GPU)

set -x CUDA_HOME /opt/cuda
set -x CUDA_PATH /opt/cuda
set -x LD_LIBRARY_PATH $LD_LIBRARY_PATH:$CUDA_HOME/lib64:$CUDA_HOME/extras/CUPTI/lib64

set -x TF_NEED_JEMALLOC 1
set -x TF_NEED_GCP 0
set -x TF_NEED_HDFS 0
set -x TF_ENABLE_XLA 0
set -x TF_NEED_VERBS 0
set -x TF_NEED_OPENCL 0
set -x TF_NEED_MKL 1
set -x TF_NEED_MPI 0
set -x TF_NEED_S3 0
set -x TF_NEED_GDR 0
set -x TF_NEED_CUDA 1
set -x GCC_HOST_COMPILER_PATH /usr/bin/gcc-5
set -x TF_CUDA_CLANG 0
set -x CLANG_CUDA_COMPILER_PATH /usr/bin/clang
set -x CUDA_TOOLKIT_PATH /opt/cuda
set -x TF_CUDA_VERSION (eval $CUDA_TOOLKIT_PATH/bin/nvcc --version | sed -n 's/^.*release \(.*\),.*/\1/p')
set -x CUDNN_INSTALL_PATH /usr
set -x TF_CUDNN_VERSION (sed -n 's/^#define CUDNN_MAJOR\s*\(.*\).*/\1/p' $CUDNN_INSTALL_PATH/include/cudnn.h)
set -x TF_CUDA_COMPUTE_CAPABILITIES '5.2'

# Arch Oracle JDK (AUR)
set -x JAVA_HOME /usr/lib/jvm/default

set -x BOOT_JVM_OPTIONS $BOOT_JVM_OPTIONS' -Dclojure.compiler.direct-linking=true -Dio.netty.tryReflectionSetAccessible=true' # --add-exports java.base/jdk.internal.misc=ALL-UNNAMED' # -XX:MaxDirectMemorySize=-1' -XX:+UseLargePages' --add-modules "java.xml.bind"

alias ls 'lsd'
alias ll 'lsd -l'
alias lt 'lsd -l --tree'

alias julia-master ~/Dependencies/julia/julia

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
