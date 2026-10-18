#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

for i in jq wget curl zsh unzip vim gdb xcb libgtk-3-common libasound2t64 libdbus-glib-1-2;
do
  echo ""
  echo "Installing $i..."
  echo ""
  apt-get install -y $i;
done

echo ""
echo "Copy config files..."
echo ""

cp /root/.pzc/templates/template.zshrc /root/.zshrc
mkdir -p /root/.config/pzc
cp /root/.pzc/templates/config.json /root/.config/pzc/config.json

echo ""
echo "Edit config files..."
echo ""
jq '.pzc_config_dirs.large_dir = "/root/pzc_dirs"' "/root/.config/pzc/config.json" > "/root/.config/pzc/config.json.tmp"
if [[ $? = 0 ]]
then
  mv "/root/.config/pzc/config.json.tmp" "/root/.config/pzc/config.json"
fi

jq '.pzc_config_dirs.work_dir = "/root/work"' "/root/.config/pzc/config.json" > "/root/.config/pzc/config.json.tmp"
if [[ $? = 0 ]]
then
  mv "/root/.config/pzc/config.json.tmp" "/root/.config/pzc/config.json"
fi
