{ config, pkgs, ... }:
{
  networking.networkmanager.enable = true;
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
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
  programs.ssh.startAgent= true;
  services.xserver = {
    layout = "us";
    xkbVariant = "";
    enable = true;
    displayManager.sddm = {
    	enable = true;
    };
  };
  users.users.neutron = {
    isNormalUser = true;
    description = "Olivia Chiarini";
    extraGroups = [ "networkmanager" "wheel" ];
  };
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
  	git
  	wget
	micro
  ];
  nix.settings.experimental-features  = [ "nix-command" "flakes" ]; 
  system.stateVersion = "23.11";
}
