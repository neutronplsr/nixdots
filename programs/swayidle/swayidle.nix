{ config, pkgs, ...}: {	
	services.swayidle = {
	    enable = true;
	    timeouts = [
	      {
	        timeout = 115;
	        command = "${pkgs.libnotify}/bin/notify-send 'Locking in 5 seconds' -t 5000";
	      }
	      {
	        timeout = 120;
	        command = "${pkgs.swaylock}/bin/swaylock";
	      }
	    ];
	    events = [
	      {
	        event = "after-resume";
	        command = "${pkgs.swaylock}/bin/swaylock";
	      }
	      {
	      	event = "lock";
	        command = "${pkgs.swaylock}/bin/swaylock";
	      }
	    ];
	  };	  
}
