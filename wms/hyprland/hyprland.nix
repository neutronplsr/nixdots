{ inputs, config, pkgs, ... }: {

	home.packages = with pkgs; [
		rofi		## app launcher
		dunst		## notfication deamon	
		waybar		## task bar
		hyprpaper	## wallpaper manager
		grimblast	## screenshot tool
	];
	
	programs.swaylock = {
		enable = true;	
	};
	security.pam.services.swaylock = {};
	
	
	imports = [
		## defines what config files to use	
		../../programs/dunst/dunst.nix
		../../programs/hyprpaper/hyprpaper.nix
		../../programs/rofi/rofi.nix		
		../../programs/waybar/waybar.nix		
	];

	home.sessionVariables = rec {
		XDG_CURRENT_DESKTOP = "Hyprland";
		XDG_SESSION_TYPE = "wayland";	
		XDG_SESSION_DESKTOP = "Hyprland";
		GDK_BACKEND = "wayland,x11";	
	};

	## hyprland settings
	 wayland.windowManager.hyprland = {
	 	enable = true;
		enableNvidiaPatches = true;
	 	xwayland.enable = true;
	 	systemd.enable = true;
	 	settings = {
			"$mod" = "SUPER";
			"exec-once" = [
				"waybar"
				"kitty"
				"pcloud"
				"mullvad-gui"
			];
			bind = [
				"$mod shift, f, exec, firefox"
				"$mod shift, s, exec, grimblast copysave area ~/Pictures/Screenshots/$(date +\"%FT%H%M%z\").png"
				"$mod, return, exec, kitty"
			];	
		};
		extraConfig = builtins.readFile ./hyprland.conf;
	};
}
