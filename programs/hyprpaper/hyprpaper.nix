{ config, pkgs, ...}:{
	home.file.".config/hypr/hyprpaper.conf" = {
		text = "
			preload = /home/neutron/Pictures/wallpapers/fortuna.png
			wallpaper = eDP-1,/home/neutron/Pictures/wallpapers/fortuna.png    	
			splash = true
		";
	};
}
