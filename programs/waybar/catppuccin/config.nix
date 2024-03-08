_: {
  mainBar = {
    layer = "top";
    position = "top";
    mod = "dock";
    modules-left = ["custom/nix" "hyprland/window"  "hyprland/workspaces"];
    modules-center = [ "clock" ];
    modules-right = [
      "tray"
      "network"
      "battery"
      "backlight"
      "pulseaudio"
      "idle_inhibitor"
      "powermenu"
    ];

    "hyprland/workspaces" = {
      format = "{icon}";
      format-icons = {
        active = "";
        default = "";
      };
    };

    "custom/nix" = {
      format = " 󱄅 ";
      tooltip = false;
      on-click-release = "wofi --show drun";
    };

    "custom/media" = {
      "format" = " {}";
      "max-lenght" = "40";
      "interval" = "1";
      "exec" = "playerctl metadata --format '{{ artist }} - {{ title }}'";
      "on-click" = "playerctl play-pause";
      "on-click-right" = "playerctl stop";
      "smooth-scrolling-threshold" = "4";
      "on-scroll-up" = "playerctl next";
      "on-scroll-down" = "playerctl previous";
    };

    "idle_inhibitor" = {
      format = "{icon}";
      format-icons = {
        activated = " ";
        deactivated = " ";
      };
    };

    "tray" = {
      spacing = "10";
      icon-size = "13";
    };

    "clock" = {
      format = "{:󰥔 %R} ";
      tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
    };

    "backlight" = {
      format = "{icon}{percent}%";
      format-icons = ["󰃞 " "󰃟 " "󰃠 "];
      on-scroll-up = "brightnessctl  set 5+";
      on-scroll-down = "brightnessctl  set 5-";
    };

    "battery" = {
      states = {
        warning = "30";
        critical = "15";
      };
      format = "{icon}{capacity}%";
      tooltip-format = "{timeTo} {capacity}%";
      format-charging = "󰂄 {capacity}%";
      format-plugged = " ";
      format-alt = "{time} {icon}";
      format-icons = ["  " "  " "  " "  " "  "];
    };

    "network" = {
      format-wifi = "󰖩 {essid}";
      format-ethernet = "󰈀 ";
      format-linked = "{ifname} (No IP) 󰈀 ";
      format-disconnected = "󰖪  Disconnected";
      on-click = "kitty -e nmtui";
      tooltip-format = "{essid} {signalStrength}%";
    };

    "pulseaudio" = {
      format = "{icon} {volume}%";
      format-muted = " 󰖁 ";
      format-icons = {
        default = ["  " "  " "  "];
      };

	  on-scroll-up = "amixer -q sset Master 3%+";
      on-scroll-down = "amixer -q sset Master 3%- ";
      
      on-click-right = "pavucontrol &";
      on-click = "amixer -q sset Master toggle";
      
    };

    "custom/powermenu" = {
      format = " ";
      on-click = "$HOME/.config/rofi/powermenu/powermenu.sh";
    };
  };
}
