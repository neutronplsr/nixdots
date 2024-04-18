{ config, pkgs, ...}:{
	#for all packages and config invovling research or classwork	
	home.packages = with pkgs; [
		vscodium	## ide
		stellarium	## fun visual astronomy tool
		google-chrome	## web browser for school accounts
		gnuastro	## astro research programs
		conda		## python virtual envs
		libsForQt5.qt5.qtwayland
		libsForQt5.kwayland
		libsForQt5.kwayland-integration
		python3
#		python311Packages.pip
		python312Packages.pipx
#		python312Packages.astropy
		python-packages.scipy
		python-packages.matplotlib
#		python312Packages.
		
		
  ];	
}
