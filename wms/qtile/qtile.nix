{ inputs, config, pkgs, ... }: {

	home.packages = with pkgs; [
		rofi	## app launcher
		dunst	## notfication deamon	
		waybar	## task bar
	];

	imports = [
		## defines what config files to use	
		../../programs/dunst/dunst.nix
		../../programs/hyprpaper/hyprpaper.nix
		../../programs/rofi/rofi.nix		
		../../programs/waybar/waybar.nix		
	];

	home.sessionVariables = rec {
		XDG_CURRENT_DESKTOP = "qtile";
		XDG_SESSION_TYPE = "wayland";	
		XDG_SESSION_DESKTOP = "qtile";
		GDK_BACKEND = "wayland,x11";	
	};
}
