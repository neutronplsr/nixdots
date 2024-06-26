{ inputs, config, pkgs, outputs, ... }: {
	home.packages = with pkgs; [
		rofi		## app launcher
		dunst		## notfication deamon	
		waybar		## task bar
		hyprpaper	## wallpaper manager
		grimblast	## screenshot tool
	];
		
	imports = [
		## defines what config files to use	
		../../programs/dunst/dunst.nix
		../../programs/hyprpaper/hyprpaper.nix
		../../programs/rofi/rofi.nix		
		../../programs/waybar/waybar.nix
		../../programs/swayidle/swayidle.nix
	];

	home.sessionVariables = rec {
		XDG_CURRENT_DESKTOP = "Hyprland";
		XDG_SESSION_TYPE = "wayland";	
		XDG_SESSION_DESKTOP = "Hyprland";
		GDK_BACKEND = "wayland,x11";	
		QT_QPA_PLATFORM="wayland";
	};
	## hyprland settings
	 wayland.windowManager.hyprland = {
	 	enable = true;
		enableNvidiaPatches = true;
	 	xwayland.enable = true;
	 	systemd.enable = true;
	 	settings = {
			"$mod" = "SUPER";
			### startup apps
			"exec-once" = [
				"waybar"
				"kitty"
				"pcloud"
				"mullvad-gui"
				"hyprpaper"
			];

			### enviorment variables
			env = [
				"XDG_CURRENT_DESKTOP, Hyprland"
				"XDG_SESSION_TYPE, wayland"
				"XDG_SESSION_DESKTOP, Hyprland"
				"GDK_BACKEND,wayland,x11"
			];

			### display settings
			monitor = [
				", preffered, 0x0, 1"	
				", preffered, 0x1080, 1"	
			];
			### keyboard bindings
			bind = [
				"$mod shift, f, exec, firefox"
				"$mod shift, s, exec, grimblast copysave area ~/Pictures/Screenshots/$(date +\"%FT%H%M%z\").png"
				"$mod, return, exec, kitty"
				"$mod, R, exec, rofi -show drun"

				"$mod shift, left, movewindow,  l"
				"$mod shift, right, movewindow, r"
				"$mod shift, up, movewindow, u"
				"$mod shift, down, movewindow, d"
				
				"$mod, left, movefocus,  l"
				"$mod, right,movefocus,  r"
				"$mod, up,movefocus,  u"
				"$mod, up,movefocus,  d"
				"$mod, BracketLeft, movefocus, l"
				"$mod, BracketRight, movefocus, r"

				"$mod, Equal, splitratio, 0.1"
				"$mod, Minus, splitratio, -0.1"
				"$mod, Apostrophe, splitratio, 0.1"
				"$mod, Semicolon, splitratio, -0.1"

				"$mod, f, fullscreen, 0"
				"$mod, d, fullscreen, 1"

				"$mod, W, killactive"
				
				"$mod shift, 1, movetoworkspacesilent, 1"
				"$mod shift, 2, movetoworkspacesilent, 2"
				"$mod shift, 3, movetoworkspacesilent, 3"
				"$mod shift, 4, movetoworkspacesilent, 4"
				"$mod shift, 5, movetoworkspacesilent, 5"
				"$mod shift, 6, movetoworkspacesilent, 6"
				"$mod shift, 7, movetoworkspacesilent, 7"
				"$mod shift, 8, movetoworkspacesilent, 8"
				"$mod shift, 9, movetoworkspacesilent, 9"
				"$mod shift, 0, movetoworkspacesilent, 0"

				"$mod, 1, workspace, 1"
				"$mod, 2, workspace, 2"
				"$mod, 3, workspace, 3"
				"$mod, 4, workspace, 4"
				"$mod, 5, workspace, 5"
				"$mod, 6, workspace, 6"
				"$mod, 7, workspace, 7"
				"$mod, 8, workspace, 8"
				"$mod, 9, workspace, 9"
				"$mod, 0, workspace, 0"

				"$mod control, right, workspace, +1"
				"$mod control, left, workspace, -1"
				"$mod control, up, workspace, -5"
				"$mod control, down, workspace, +5"

				"$mod, T, togglefloating"
				"$mod control, L, exec, sleep 0.1 && systemctl suspend"
			];
			### mouse bindings	
			bindm = [
				"$mod, mouse:272, movewindow"
				"$mod, mouse:273, resizewindow"
			];
			### media key bindings
			bindl = [ 
				",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
				", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
				", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
			];
			bindle= [
				", XF86MonBrightnessUp, exec, brightnessctl set '12.75+'"
				", XF86MonBrightnessDown, exec, brightnessctl set '12.75-'"
			];
			
			general = {
				 "col.active_border" = "rgba(94e2d5ee) rgba(89dcebee)";
				 "col.inactive_border" = "rgba(6c7086ee)";
				 "border_size" = 2;
			};
			input   = {
				touchpad = {
					natural_scroll = "yes";
					disable_while_typing = true;
					clickfinger_behavior = true;
					scroll_factor = 0.5;
				};
				repeat_delay = 250;
				numlock_by_default = true;
			};
		};
	};
}
