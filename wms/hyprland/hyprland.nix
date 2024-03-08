{ config, pkgs, ...}:
{
	wayland.windowManager.hyprland = {
		enable = true;
		xwayland.enable = true;
		settings = {
			"$mod" = "SUPER";
			bind = [
				"$mod, shift F, exec, firefox"
				"$mod, return, exec, kitty"
			];	
			exec-once = [
				"waybar"
				"firefox"
				"kitty"
			];
		};
		extraConfig = builtins.readFile ./hyprland.conf;
	};
}
