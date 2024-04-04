{ config, pkgs, ...}: {
	## for all packages and config invovling research or classwork
	nixpkgs.config.permittedInsecurePackages = [
           "electron-25.9.0"
    ];

	## this is here because the obsidian package is out of date :(
	home.packages = with pkgs; [
	    vscodium	## ide
	    stellarium	## fun visual astronomy tool
		obsidian	    
  ];	
}
