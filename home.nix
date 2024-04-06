{ config, pkgs, ...}:{
	programs.home-manager.enable = true;
	home.username = "neutron";
	home.homeDirectory = "/home/neutron";
	home.stateVersion = "23.11";

	## core packages
	home.packages = with pkgs; [
		firefox	## web browser
		kitty	## terminal emulator
		obsidian## note taking/organization

		
		gnome.nautilus	## file browser
		feh		## image viewer
		## nerdfonts i like
		(nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "Ubuntu" ]; })
	];



	## default apps
	xdg.mimeApps= {
		enable = true;
		defaultApplications = {
			"text/html"			= "firefox.desktop";
			"application/pdf"	= "firefox.desktop";	
			"image/png"			=  "feh.desktop";
			"image/jpg"			=  "feh.desktop";
			"image/jpeg"			=  "feh.desktop";			
		};
	};
	## git config
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
		./programs/kitty/kitty.nix
		./programs/micro/micro.nix	
	];
}
