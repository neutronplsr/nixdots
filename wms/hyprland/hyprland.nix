{ config, pkgs, ... }: {
	 wayland.windowManager.hyprland = {
	 	enable = true;
	 	xwayland.enable = true;
	 	settings = {
			"$mod" = "SUPER";
			bind = [
				"$mod shift, f, exec, firefox"
				"$mod, return, exec, kitty"
			];	
		};
		extraConfig = builtins.readFile ./hyprland.conf;
	};
	#programs.hyprland = {
	#	enable = true;
	#	xwayland.enable = true;
	#	enableNvidiaPatches = true;
	#};
}
