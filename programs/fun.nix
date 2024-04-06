{ config, pkgs, ...}:{
	# for all packages and config invovling gaming, fun things, etc.	
	home.packages = with pkgs; [
		lutris	## games manager/runner
		steam	## games manager/runner, includes windows emulation
		linuxKernel.packages.linux_zen.xpadneo	## xboox controller drivers
	];	
}
