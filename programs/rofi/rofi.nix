{ config, pkgs, ...}:{
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
