{ inputs, config, pkgs, ... }: {

	programs.hyprlock = {
		enable = true;
	};
	services.swayidle = {
	    enable = true;
	    timeouts = [
	      {
	        timeout = 10;
	        command = "${pkgs.libnotify}/bin/notify-send 'Locking in 5 seconds' -t 5000";
	      }
	      {
	        timeout = 15;
	        command = "hyprlock";
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
