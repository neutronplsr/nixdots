{ inputs, config, pkgs, outputs, ... }: {
	home.packages = with pkgs; [
		swaylock-effects	## screenlocker tool
	];

	services.swayidle = 
	let 
	lockCommand = "${pkgs.swaylock}/bin/swaylock   \
					--clock\
					--indicator ";
	in {
	    enable = true;
	    timeouts = [
	      {
	        timeout = 115;
	        command = "${pkgs.libnotify}/bin/notify-send 'Locking in 5 seconds' -t 5000";
	      }
	      {
	        timeout = 120;
	        command = lockCommand;
	      }
	    ];
	    events = [
	     	{
	        	event = "after-resume";
	        	command = lockCommand;
	      	}
	      	{
	      		event = "lock";
	        	command = lockCommand;
        	}
		];
	};	  
	
}
