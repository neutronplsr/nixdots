{ inputs, config, pkgs, ...}:{
	programs.home-manager.enable = true;
	home.username = "neutron";
	home.homeDirectory = "/home/neutron";
	home.stateVersion = "23.11";


	nixpkgs.overlays = [outputs.unstable-packages];	
	# main packages for all systems
	home.packages = with pkgs; [
		## cli tools and core utilities
		brightnessctl		### backlight manager
		du-dust				### disk usage tool written in rust
		kitty				### terminal emulator
		linuxHeaders		### used for dkms modules
		wl-clipboard   		### clipboard manager

		## gui apps and utilities 
		bitwarden			### password manager
		feh					### image viewer
		firefox				### web browser
		gnome.nautilus		### file browser
		mullvad-vpn			### vpn
		obsidian			### note taking/organization
		pavucontrol			### audio manager
#		pcloud				### cloud file backups/storage, currently broken so a module must be used.
		vesktop				### discord with custom client and wayland fixes
		
		## theming
		catppuccin-gtk		### gui theme for gtk supported apps

		## fonts
		fira-code
		fira-code-symbols
		noto-fonts
		noto-fonts-cjk
		noto-fonts-emoji
		liberation_ttf
		papirus-icon-theme
		proggyfonts

		### nerdfonts
		(nerdfonts.override { fonts = [ "DroidSansMono" "FiraCode" "Ubuntu" ]; })	
	];


	# gui theming
	gtk = {
		enable = true;
		theme = {
			name = "Catppuccin-Macchiato-Compact-Teal-Dark";
			package = pkgs.catppuccin-gtk.override {
				accents = [ "teal" ];
				size = "compact";
				tweaks = [ "rimless" "black" ];
				variant = "macchiato";
			};
		};
	};
	
	# default apps
	xdg.mimeApps= {
		enable = true;
		defaultApplications = {
			"application/pdf"=					"firefox.desktop";
			"text/html"=						"firefox.desktop";
			"x-scheme-handler/http"=			"firefox.desktop";
			"x-scheme-handler/https"=			"firefox.desktop";
			"x-scheme-handler/chrome"=			"firefox.desktop";
			"application/x-extension-htm"=		"firefox.desktop";
			"application/x-extension-html"=		"firefox.desktop";
			"application/x-extension-shtml"=	"firefox.desktop";
			"application/xhtml+xml"=			"firefox.desktop";
			"application/x-extension-xhtml"=	"firefox.desktop";
			"application/x-extension-xht"=		"firefox.desktop";

			"image/jpeg"=						"feh.desktop";
			"image/jpg"=						"feh.desktop";
			"image/png"=						"feh.desktop";
		};
	};

	# session variables
	home.sessionVariables = {
		EDITOR = "micro";
		XDG_SESSION_TYPE =  "wayland";
		GDK_BACKEND =  "wayland,x11";
		XDG_SCREENSHOTS_DIR = "$HOME/Pictures/Screenshots";
		XDG_PICTURES_DIR = "$HOME/Pictures/";
		XDG_CACHE_HOME  = "$HOME/.cache";
		XDG_CONFIG_HOME = "$HOME/.config";
		XDG_DATA_HOME   = "$HOME/.local/share";
		XDG_STATE_HOME  = "$HOME/.local/state";
		XDG_BIN_HOME    = "$HOME/.local/bin";
	};

	# git config
	programs.git = {
		enable 		= true;
		userName	= "neutronplsr";
		userEmail	= "chiariniolivia@gmail.com";
		extraConfig = {
			push 	= {autoSetupRemote = true;};	
		};
	};
		
	# modules to import
	imports = [
		## defines what WM configs to use
		./wms/hyprland/hyprland.nix
		#./wms/qtile/qtile.nix

		## defines what config files to use for packages installed
		./programs/kitty/kitty.nix
#		./programs/micro/micro.nix
		./programs/pcloud/pcloud.nix
		./programs/vesktop/vesktop.nix	
	];
}
