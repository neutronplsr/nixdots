{ inputs, config, pkgs, outputs, ... }: {

	programs.hyprlock = {
		enable = true;
	};

	home.file.".config/hypr/hyprlock.conf".source = ./hyprlock.conf;
	services.swayidle = {
	    enable = true;
	    timeouts = [
	      {
	        timeout = 5;
	        command = "${pkgs.libnotify}/bin/notify-send 'Locking in 5 seconds' -t 5000";
	      }
	      {
	        timeout = 10;
	        command = "${pkgs.kitty}/bin/kitty";
	      }
	    ];
	    events = [
	      {
	        event = "before-sleep";
	        command = "hyprlock";
	      }
	    ];
	  };


	  
}
