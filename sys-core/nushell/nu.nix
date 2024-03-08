{config, pkgs, ...}:
{
	programs.nushell = {
		enable = true;
		shellAliases = {};
		configFile.source = ./config.nu;
		extraConfig = ''

		$env.config = {
			show_banner: false,
		}
		$env.PATH = ($env.PATH |
		 split row (char esep) 
		 )
		'';	
	};
}
