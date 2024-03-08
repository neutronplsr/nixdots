{ config, pkgs, ... }:
{
  imports = [ 
      ./hardware-configuration.nix
   ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  networking.hostName = "livova-laptop-nixos"; 
  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";

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
  
  services.xserver = {
    layout = "us";
    xkbVariant = "";
    enable = true;
    displayManager.lightdm.enable = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "23.11"; 
  security.polkit.enable = true;
  ### livova-stuff
  users.users.neutron = {
    isNormalUser = true;
    description = "Olivia Chiarini";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.nushell;
  };

  nixpkgs.config.allowUnfree = true;
  users.defaultUserShell = pkgs.nushell;  
  
  environment.systemPackages = with pkgs; [
  ## core pkgs
  micro
  git
  wget
  kitty
  ## gui pkgs
  firefox
  ];
  programs.hyprland = {
  	enable = true;
  	xwayland.enable = true;
  	enableNvidiaPatches = true;
  };

  hardware = {
  	opengl.enable = true;
  	nvidia.modesetting.enable = true;
  };

  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
  	enable = true;
  	alsa.enable = true;
  	alsa.support32Bit = true;
  	pulse.enable = true;
  	jack.enable = true;
  };

fonts.packages = with pkgs; [
  noto-fonts
  noto-fonts-cjk
  noto-fonts-emoji
  liberation_ttf
  fira-code
  fira-code-symbols
  mplus-outline-fonts.githubRelease
  dina-font
  proggyfonts
  papirus-icon-theme
];
  
}
