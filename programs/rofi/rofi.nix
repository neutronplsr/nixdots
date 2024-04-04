{ config, pkgs, ...}: {
	# programs.rofi = {
	# 	enable = true;
	# 	configPath = "./.";
	# 	theme = "./catppuccin-mocha.rasi";
	# 	extraConfig = {
	# 	    modi= "run,drun,window";
	# 	    icon-theme= "Oranchelo";
	# 	    show-icons= true;
	# 	    terminal= "kitty";
	# 	    drun-display-format= "{icon} {name}";
	# 	    location= 0;
	# 	    disable-history= false;
	# 	    hide-scrollbar= true;
	# 	    display-drun= "   Apps ";
	# 	    display-run= "   Run ";
	# 	    display-window= " 﩯  Window";
	# 	    display-Network= " 󰤨  Network";
	# 	    sidebar-mode= true;
	# 	};
	# };
	home.file.".config/rofi/config.rasi".text = ''
		configuration{
		    modi: "drun,window";
		    icon-theme: "Oranchelo";
		    show-icons: true;
		    terminal: "alacritty";
		    drun-display-format: "{icon} {name}";
		    location: 0;
		    disable-history: false;
		    hide-scrollbar: true;
		    display-drun: "   Apps ";
		    display-window: " 󰀻  Windows";
		    display-Network: " 󰤨  Network";
		    sidebar-mode: true;
		}
		
		@theme "catppuccin-mocha"
	'';
	home.file.".config/rofi/catppuccin-mocha.rasi".source = ./catppuccin-mocha.rasi;
}
