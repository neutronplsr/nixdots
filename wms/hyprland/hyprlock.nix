{ inputs, config, pkgs, ... }: {

	programs.hyprlock = {
		enable = true;
	};
	services.swayidle = {
	    enable = true;
	    timeouts = [
	      {
	        timeout = 115;
	        command = "${pkgs.libnotify}/bin/notify-send 'Locking in 5 seconds' -t 5000";
	      }
	      {
	        timeout = 120;
	        command = "${pkgs.hyprlock}/bin/hyprlock";
	      }
	    ];
	    events = [
	      {
	        event = "before-sleep";
	        command = "${pkgs.hyprlock}/bin/hyprlock";
	      }
	    ];
	  };
}
