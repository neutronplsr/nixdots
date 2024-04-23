{ config, pkgs, ... }:{
	# enable wifi and general networking
	networking.networkmanager.enable = true;
	# define all locale vars
	i18n = {
		defaultLocale = "en_US.UTF-8";
		extraLocaleSettings = {
			LC_ADDRESS = "en_US.UTF-8";
			LC_IDENTIFICATION = "en_US.UTF-8";
			LC_MEASUREMENT = "en_US.UTF-8";
			LC_MONETARY = "en_US.UTF-8";
			LC_NAME = "en_US.UTF-8";
			LC_NUMERIC = "en_US.UTF-8";
			LC_PAPER = "en_US.UTF-8";
			LC_TELEPHONE = "en_US.UTF-8";
			LC_TIME = "en_US.UTF-8";
		};	
	};
	time.timeZone = "America/New_York";
	# allow ssh tunneling
	programs.ssh.startAgent= true;
	# security layer, allows secuirty keys to be used
	security.polkit.enable = true;
	# sets up xorg server, even for wayland
	services.xserver = {
		layout = "us";
		xkbVariant = "";
		enable = true;
	};
	# defines our user account
	users.users.neutron = {
		isNormalUser = true;
		description = "Olivia Chiarini";
		extraGroups = [ "networkmanager" "wheel" ];
		shell = pkgs.nushell;
	};
	# allows non free software
	nixpkgs.config.allowUnfree = true;
	# core things no system should go without
	environment.systemPackages = with pkgs; [
		git
		wget
		micro
		qt5.qtwayland
		libsForQt5.qt5.qtwayland
      	qt6.qtwayland
	];
	# allows for flakes and home-manager to be used
	nix.settings.experimental-features  = [ "nix-command" "flakes" ]; 
	# prevents annoying messages when updating
	nix.extraOptions = ''
		warn-dirty = false
	'';
	# nixos version
	system.stateVersion = "23.11";
	# sound configuration
	sound.enable = true;
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		jack.enable = true;
	};
	# bluetooth configuration
	hardware.bluetooth.enable = true;
	hardware.bluetooth.powerOnBoot = true;
	# helps displayManager to find WMs
	### need to figure out how to not need this
	programs.hyprland.enable = true;
	services.xserver.windowManager.qtile.enable = true;
	services.mullvad-vpn.enable = true;

	# defines display manager to open gui setup
	services.xserver.displayManager = {
		sddm = {
		enable = true;
			wayland.enable = true;
		};
		defaultSession = "hyprland";
	};

	# weird edgecase for obsidia that only works when its here, not in home manager for some reason
	nixpkgs.config.permittedInsecurePackages = [
			"electron-25.9.0"
	];
}


flake-overlays:

{ config, pkgs, options, lib, ... }:
{
  nixpkgs.overlays = [
    (
      final: prev: {
        # Your own overlays...
      }
    )
  ] ++ flake-overlays;
  environment.systemPackages = with pkgs; [
    # Other packages
    matlab
    # More packages
  ];
}
