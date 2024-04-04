
{ config, pkgs, ...}:{
	programs.home-manager.enable = true;
	home.username = "neutron";
	home.homeDirectory = "/home/neutron";
	home.stateVersion = "23.11";

	## core packages
	home.packages = with pkgs; [
		firefox	## web browser
		kitty	## terminal emulator
		rofi	## launcher
		dunst	## notfications
	];

	programs.git = {
		enable 		= true;
		userName	= "neutronplsr";
		userEmail	= "chiariniolivia@gmail.com";
		extraConfig = {
			push = {autoSetupRemote = true;};	
		};
	};
	
	## modules to import
	imports = [
		## defines what WM to use
		./wms/hyprland/hyprland.nix
		#./wms/qtile/qtile.nix

		## defines what config files to use	
	];
}
