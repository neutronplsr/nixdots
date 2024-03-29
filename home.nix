{ config, pkgs, ... }:
{
  home.username = "neutron";
  home.homeDirectory = "/home/neutron";
  home.stateVersion = "23.11";


  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
                  "electron-25.9.0"
  ];

  home.packages = with pkgs; [
	# window manager specfic packages
	## hyprland enviorment 
    hyprland ### window manager
    xdg-desktop-portal-gtk ###needed for wayland config stuff
    waybar   ### widget bar
    rofi     ### program runner
    dunst    ### notification manager
	sway-contrib.grimshot  ### screenshot tool
	blueman	 ### bluetooth gui manager
	swaylock ### screen locking
	swayidle ### idle checking
 	hyprpaper### wallpaper manager
 	gnome.nautilus ### gui file manager
	catppuccin-gtk ### gui theming
	wl-clipboard   ### clipboard
    
	# core packages 
	## ease of use, cli tools
	zoxide			### dynamic replacement for cd 
	du-dust			### faster du
	starship		### shell prompt customizer
	fish			### alternate shell for when nushell inevitabilty breaks
	zsh				### alternate shell for when nushell inevitabilty breaks
	linuxHeaders	### linux headers, useful for dkms stuff
	
	## main apps and utils
	discord			### social media
    betterdiscordctl### adds plugins and custom css to discord
    palemoon-bin	### second browser
    obsidian		### notetaking app
    pcloud			### cloud storage and file syncing
    bitwarden		### password manager
    mullvad-vpn		### vpn
    pavucontrol		### audio manager
    brightnessctl	### backlight control

	## coding
	vscodium		### non microsoft version of vs code, ide
	#rustc			### programming langauge
	#rustup			### rust package install tools
	cargo 			### rust building
	python3			### programming langauge
	python311Packages.pip	## python package manager
	conda			### tool for managing python virtual enviorments
	
	
	# fun packages
	## gaming
    steam			## games store/runner, proton windows emulator
	lutris			## games manager/runner
    qbittorrent		## P2P file sharing
    linuxKernel.packages.linux_zen.xpadneo	### xbox wireless controller support

    # customization packages
    ## fonts
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "Ubuntu" ]; })
  ];

  home.file = {};

  home.sessionVariables = {
     EDITOR = "micro";
  };
  programs.home-manager.enable = true;
  
  services.dunst.enable = true;
  fonts.fontconfig.enable = true;

  services.swayidle.enable = true;
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.systemd.enable = true;

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
  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };

    
  programs.git = {
  	enable = true;
  	userName = "neutronpslr";
  	userEmail = "chiariniolivia@gmail.com";
  	extraConfig = { push = { autoSetupRemote = true; };};
  };

  imports = [
  	./sys-core/nushell/nu.nix

  	./wms/hyprland/hyprland.nix

  	./programs/waybar/waybar.nix
  	./programs/kitty/kitty.nix
  	./programs/micro/micro.nix
  	./programs/hyprpaper/hyprpaper.nix
  	./programs/dunst/dunst.nix
  	./programs/rofi/rofi.nix
  	./programs/swaylock/swaylock.nix
  	./programs/swayidle/swayidle.nix
  ];
}
