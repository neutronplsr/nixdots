{ config, pkgs, ... }:{
  networking.networkmanager.enable = true;
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
  programs.ssh.startAgent= true;
  security.polkit.enable = true;
  services.xserver = {
    layout = "us";
    xkbVariant = "";
    enable = true;
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
  nix.extraOptions = ''
	warn-dirty = false
  '';
  system.stateVersion = "23.11";
  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    	enable = true;
    	alsa.enable = true;
    	alsa.support32Bit = true;
    	pulse.enable = true;
    	jack.enable = true;
  };
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;


  ### need to figure out how to not need this

  programs.hyprland.enable = true;
  services.xserver.displayManager = {
  	sddm = {
  		enable = true;
  		wayland.enable = true;
  	};
  	defaultSession = "hyprland";
  };
       
  ## weird edgecase for obsidian, cant find another place to put this that doesnt throw an erorr
  nixpkgs.config.permittedInsecurePackages = [
  	"electron-25.9.0"
  ];
  ## it wotn work in home.nix so its here for now
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
