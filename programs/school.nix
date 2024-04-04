{ config, pkgs, ...}: {
	## for all packages and config invovling research or classwork
	home.packages = with pkgs; [
	    vscodium	## ide
	    stellarium	## fun visual astronomy tool
	    
  ];	
}
