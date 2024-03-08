{ config, pkgs, ... }:
{
  home.username = "neutron";
  home.homeDirectory = "/home/neutron";
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    hyprland
    waybar
    wofi
    dunst
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "Ubuntu" ]; })
  ];

  home.file = {};

  home.sessionVariables = {
     EDITOR = "micro";
  };
  programs.home-manager.enable = true;


  fonts.fontconfig.enable = true;

  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.systemd.enable = true;

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
  ];
}
