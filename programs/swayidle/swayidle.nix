{ inputs, config, pkgs, outputs, ... }: {
	home.packages = with pkgs; [
		swaylock-effects	## screenlocker tool
	];

	services.swayidle = 
	let 
	lockCommand = "${pkgs.swaylock}/bin/swaylock   swaylock --clock  --indicator 	--indicator-radius 100--indicator-thickness 7 --effect-blur 7x5 	--effect-vignette 0.5:0.5 	--ring-color bb00cc 	--key-hl-color 880033 	--line-color 00000000 	--inside-color 00000088 --separator-color 00000000 --fade-in 0.2";
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
