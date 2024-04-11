#!/bin/sh

${pkgs.libnotify}/bin/notify-send 'Locking now' -t 5000
hyprlock
