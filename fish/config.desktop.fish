set -x SSH_ASKPASS /usr/bin/ksshaskpass
set -x XDG_CURRENT_DESKTOP kde
set -x QT_QPA_PLATFORMTHEME qt5ct # Seems to crash keepassxc when set to KDE
set -x XAPIAN_CJK_NGRAM 1
set -x XKB_DEFAULT_OPTIONS ctrl:nocaps

# IME (mozc)
# using fcitx
set -x GTK_IM_MODULE fcitx
set -x QT_IM_MODULE fcitx
set -x XMODIFIERS "@im=fcitx"
set -x LOO_FORCE_DESKTOP gnome
set -x OOO_FORCE_DESKTOP gnome
