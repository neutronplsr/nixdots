_: {
  mainBar = {
    layer = "top";
    position = "top";
    mod = "dock";

    modules-left = ["custom/nix" "hyprland/window"  "hyprland/workspaces"];

    "custom/nix" = {
      format = " 󱄅 ";
      tooltip = false;
      on-click-release = "wofi --show drun";
    };
    
    "hyprland/workspaces" = {
      format = "{icon}";
      format-icons = {
        active = "";
        default = "";
      };
    };
	
    modules-center = [ "clock" ];

   "clock" = {
          format = "{:󰥔 %R} ";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
     };


    modules-right = [
      "tray"
      "network"
      "battery"
      "backlight"
      "pulseaudio"
      "idle_inhibitor"
      "custom/powermenu"
    ];

   "tray" = {
      spacing = "10";
      icon-size = "13";
    };

	"network" = {
	      format-wifi = "󰖩 {essid}";
	      format-ethernet = "󰈀 ";
	      format-linked = "{ifname} (No IP) 󰈀 ";
	      format-disconnected = "󰖪  Disconnected";
	      on-click = "kitty -e nmtui";
	      tooltip-format = "{essid} {signalStrength}%";
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

    "backlight" = {
          format = "{icon}{percent}%";
          format-icons = ["󰃞 " "󰃟 " "󰃠 "];
          on-scroll-up = "brightnessctl  set 5+";
          on-scroll-down = "brightnessctl  set 5-";
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

    "idle_inhibitor" = {
      format = "{icon}";
      format-icons = {
        activated = " ";
        deactivated = " ";
      };
    };    
  
    "custom/powermenu" = {
      format = " ";
      on-click = "$HOME/.config/rofi/powermenu/powermenu.sh";
    };

  };
}
