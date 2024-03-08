{ config, pkgs, ...}:
{
	programs.micro = {
		enable = true;
		settings = {
			clipboard =  "external";
			ignorecase=  true;
		};
	};
}
