#/bin/bash
set -eux

# Don't run this script as root
[ ! "$UID" -eq 0 ] || { echo "This script must not be run as root."; exit 1;}

dconf write /org/gnome/shell/disable-extension-version-validation "true" #yolo
dconf write /org/gnome/shell/disable-user-extensions "false"

echo "Installing Firefox, Thunderbird, and codecs"
echo "We'll need sudo for this ..."
sudo flatpak install org.mozilla.firefox org.mozilla.Thunderbird org.freedesktop.Platform.ffmpeg-full//22.08 -y

echo "Installing Distrobox"
wget -qO- "https://raw.githubusercontent.com/89luca89/distrobox/main/install" | sudo sh
echo "Installing Ubuntu userspace"
distrobox-create -Y -i public.ecr.aws/ubuntu/ubuntu:latest -n ubuntu-toolbox
echo "Installing Debian userspace"
distrobox-create -Y -i public.ecr.aws/debian/debian:stable --name debian-toolbox
./bits/distrobox-terminal-profile.sh -n ubuntu-toolbox -c ubuntu-toolbox -s "<Primary><Alt>u" 
./bits/distrobox-terminal-profile.sh -n debian-toolbox -c debian-toolbox -s "<Primary><Alt>t" 

echo "Installing dash to dock and disabling eOS customizations..."
mkdir -p ~/.local/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com/
unzip dash-to-dock@micxgx.gmail.com.zip \
-d ~/.local/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com/
gnome-extensions disable eos-desktop@endlessm.com
gnome-extensions disable eos-panel@endlessm.com
gnome-extensions enable dash-to-dock@micxgx.gmail.com

echo "Setting an Ubuntu dock"
dconf write /org/gnome/shell/favorite-apps "['org.mozilla.firefox.desktop', 'org.mozilla.Thunderbird.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Rhythmbox3.desktop', 'org.libreoffice.LibreOffice.writer.desktop', 'org.gnome.Software.desktop', 'ubuntu-toolbox.desktop', 'yelp.desktop']"

dconf write /org/gnome/shell/extensions/dash-to-dock/activate-single-window "true"
dconf write /org/gnome/shell/extensions/dash-to-dock/animate-show-apps "true"
dconf write /org/gnome/shell/extensions/dash-to-dock/animation-time "0.20000000000000001"
dconf write /org/gnome/shell/extensions/dash-to-dock/app-ctrl-hotkey-1 "['<Ctrl><Super>1']"
dconf write /org/gnome/shell/extensions/dash-to-dock/app-ctrl-hotkey-10 "['<Ctrl><Super>0']"
dconf write /org/gnome/shell/extensions/dash-to-dock/app-ctrl-hotkey-2 "['<Ctrl><Super>2']"
dconf write /org/gnome/shell/extensions/dash-to-dock/app-ctrl-hotkey-3 "['<Ctrl><Super>3']"
dconf write /org/gnome/shell/extensions/dash-to-dock/app-ctrl-hotkey-4 "['<Ctrl><Super>4']"
dconf write /org/gnome/shell/extensions/dash-to-dock/app-ctrl-hotkey-5 "['<Ctrl><Super>5']"
dconf write /org/gnome/shell/extensions/dash-to-dock/app-ctrl-hotkey-6 "['<Ctrl><Super>6']"
dconf write /org/gnome/shell/extensions/dash-to-dock/app-ctrl-hotkey-7 "['<Ctrl><Super>7']"
dconf write /org/gnome/shell/extensions/dash-to-dock/app-ctrl-hotkey-8 "['<Ctrl><Super>8']"
dconf write /org/gnome/shell/extensions/dash-to-dock/app-ctrl-hotkey-9 "['<Ctrl><Super>9']"
dconf write /org/gnome/shell/extensions/dash-to-dock/app-hotkey-1 "['<Super>1']"
dconf write /org/gnome/shell/extensions/dash-to-dock/app-hotkey-10 "['<Super>0']"
dconf write /org/gnome/shell/extensions/dash-to-dock/app-hotkey-2 "['<Super>2']"
dconf write /org/gnome/shell/extensions/dash-to-dock/app-hotkey-3 "['<Super>3']"
dconf write /org/gnome/shell/extensions/dash-to-dock/app-hotkey-4 "['<Super>4']"
dconf write /org/gnome/shell/extensions/dash-to-dock/app-hotkey-5 "['<Super>5']"
dconf write /org/gnome/shell/extensions/dash-to-dock/app-hotkey-6 "['<Super>6']"
dconf write /org/gnome/shell/extensions/dash-to-dock/app-hotkey-7 "['<Super>7']"
dconf write /org/gnome/shell/extensions/dash-to-dock/app-hotkey-8 "['<Super>8']"
dconf write /org/gnome/shell/extensions/dash-to-dock/app-hotkey-9 "['<Super>9']"
dconf write /org/gnome/shell/extensions/dash-to-dock/app-shift-hotkey-1 "['<Shift><Super>1']"
dconf write /org/gnome/shell/extensions/dash-to-dock/app-shift-hotkey-10 "['<Shift><Super>0']"
dconf write /org/gnome/shell/extensions/dash-to-dock/app-shift-hotkey-2 "['<Shift><Super>2']"
dconf write /org/gnome/shell/extensions/dash-to-dock/app-shift-hotkey-3 "['<Shift><Super>3']"
dconf write /org/gnome/shell/extensions/dash-to-dock/app-shift-hotkey-4 "['<Shift><Super>4']"
dconf write /org/gnome/shell/extensions/dash-to-dock/app-shift-hotkey-5 "['<Shift><Super>5']"
dconf write /org/gnome/shell/extensions/dash-to-dock/app-shift-hotkey-6 "['<Shift><Super>6']"
dconf write /org/gnome/shell/extensions/dash-to-dock/app-shift-hotkey-7 "['<Shift><Super>7']"
dconf write /org/gnome/shell/extensions/dash-to-dock/app-shift-hotkey-8 "['<Shift><Super>8']"
dconf write /org/gnome/shell/extensions/dash-to-dock/app-shift-hotkey-9 "['<Shift><Super>9']"
dconf write /org/gnome/shell/extensions/dash-to-dock/apply-custom-theme "false"
dconf write /org/gnome/shell/extensions/dash-to-dock/apply-glossy-effect "true"
dconf write /org/gnome/shell/extensions/dash-to-dock/autohide "true"
dconf write /org/gnome/shell/extensions/dash-to-dock/autohide-in-fullscreen "false"
dconf write /org/gnome/shell/extensions/dash-to-dock/background-color "'#ffffff'"
dconf write /org/gnome/shell/extensions/dash-to-dock/background-opacity "0.69999999999999996"
dconf write /org/gnome/shell/extensions/dash-to-dock/bolt-support "true"
dconf write /org/gnome/shell/extensions/dash-to-dock/click-action "'focus-or-previews'"
dconf write /org/gnome/shell/extensions/dash-to-dock/custom-background-color "false"
dconf write /org/gnome/shell/extensions/dash-to-dock/custom-theme-customize-running-dots "true"
dconf write /org/gnome/shell/extensions/dash-to-dock/custom-theme-running-dots-border-color "'#e95420'"
dconf write /org/gnome/shell/extensions/dash-to-dock/custom-theme-running-dots-border-width "0"
dconf write /org/gnome/shell/extensions/dash-to-dock/custom-theme-running-dots-color "'#e95420'"
dconf write /org/gnome/shell/extensions/dash-to-dock/custom-theme-shrink "true"
dconf write /org/gnome/shell/extensions/dash-to-dock/customize-alphas "false"
dconf write /org/gnome/shell/extensions/dash-to-dock/dash-max-icon-size "48"
dconf write /org/gnome/shell/extensions/dash-to-dock/dock-fixed "true"
dconf write /org/gnome/shell/extensions/dash-to-dock/dock-position "'LEFT'"
dconf write /org/gnome/shell/extensions/dash-to-dock/extend-height "true"
dconf write /org/gnome/shell/extensions/dash-to-dock/force-straight-corner "false"
dconf write /org/gnome/shell/extensions/dash-to-dock/height-fraction "0.90000000000000002"
dconf write /org/gnome/shell/extensions/dash-to-dock/hide-delay "0.20000000000000001"
dconf write /org/gnome/shell/extensions/dash-to-dock/hot-keys "true"
dconf write /org/gnome/shell/extensions/dash-to-dock/hotkeys-overlay "true"
dconf write /org/gnome/shell/extensions/dash-to-dock/hotkeys-show-dock "true"
dconf write /org/gnome/shell/extensions/dash-to-dock/icon-size-fixed "true"
dconf write /org/gnome/shell/extensions/dash-to-dock/intellihide "true"
dconf write /org/gnome/shell/extensions/dash-to-dock/intellihide-mode "'ALL_WINDOWS'"
dconf write /org/gnome/shell/extensions/dash-to-dock/isolate-monitors "false"
dconf write /org/gnome/shell/extensions/dash-to-dock/isolate-workspaces "false"
dconf write /org/gnome/shell/extensions/dash-to-dock/max-alpha "0.80000000000000004"
dconf write /org/gnome/shell/extensions/dash-to-dock/middle-click-action "'launch'"
dconf write /org/gnome/shell/extensions/dash-to-dock/min-alpha "0.20000000000000001"
dconf write /org/gnome/shell/extensions/dash-to-dock/minimize-shift "true"
dconf write /org/gnome/shell/extensions/dash-to-dock/multi-monitor "false"
dconf write /org/gnome/shell/extensions/dash-to-dock/preferred-monitor "0"
dconf write /org/gnome/shell/extensions/dash-to-dock/pressure-threshold "100.0"
dconf write /org/gnome/shell/extensions/dash-to-dock/require-pressure-to-show "true"
dconf write /org/gnome/shell/extensions/dash-to-dock/running-indicator-dominant-color "false"
dconf write /org/gnome/shell/extensions/dash-to-dock/running-indicator-style "'DOTS'"
dconf write /org/gnome/shell/extensions/dash-to-dock/scroll-action "'switch-workspace'"
dconf write /org/gnome/shell/extensions/dash-to-dock/scroll-switch-workspace "true"
dconf write /org/gnome/shell/extensions/dash-to-dock/shift-click-action "'launch'"
dconf write /org/gnome/shell/extensions/dash-to-dock/shift-middle-click-action "'minimize'"
dconf write /org/gnome/shell/extensions/dash-to-dock/shortcut "['<Super>q']"
dconf write /org/gnome/shell/extensions/dash-to-dock/shortcut-text "'<Super>q'"
dconf write /org/gnome/shell/extensions/dash-to-dock/shortcut-timeout "2.0"
dconf write /org/gnome/shell/extensions/dash-to-dock/show-apps-at-top "false"
dconf write /org/gnome/shell/extensions/dash-to-dock/show-delay "0.25"
dconf write /org/gnome/shell/extensions/dash-to-dock/show-favorites "true"
dconf write /org/gnome/shell/extensions/dash-to-dock/show-mounts "true"
dconf write /org/gnome/shell/extensions/dash-to-dock/show-running "true"
dconf write /org/gnome/shell/extensions/dash-to-dock/show-show-apps-button "true"
dconf write /org/gnome/shell/extensions/dash-to-dock/show-trash "true"
dconf write /org/gnome/shell/extensions/dash-to-dock/show-windows-preview "true"
dconf write /org/gnome/shell/extensions/dash-to-dock/transparency-mode "'FIXED'"
dconf write /org/gnome/shell/extensions/dash-to-dock/unity-backlit-items "false"

echo "You need to logout and back in!"
gnome-session-quit