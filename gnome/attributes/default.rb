#
# Cookbook Name:: gnome 
# Recipe:: default
#
# Copyright 2011, Eric G. Wolfe
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

case node['platform']
when "redhat","centos","scientific","amazon","oracle"
  default['gnome']['packages'] = %w{
      control-center
      gnome-applets
      gnome-panel
      gnome-session
      gnome-terminal
      metacity
      nautilus
      yelp
      NetworkManager
      NetworkManager-gnome
      alsa-plugins-pulseaudio
      control-center-extra
      eog
      gdm
      gdm-plugin-fingerprint
      gdm-user-switch-applet
      gnome-media
      gnome-packagekit
      gnome-power-manager
      gnome-vfs2-smb
      gok
      gvfs-archive
      gvfs-fuse
      gvfs-smb
      openssh-askpass
      orca
      pulseaudio-module-gconf
      pulseaudio-module-x11
      vino
      xdg-user-dirs-gtk
    }
else
  default['gnome']['packages'] = %w{ gnome-desktop-environment }
end
