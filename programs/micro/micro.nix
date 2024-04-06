{ config, pkgs, ...}:
{
	programs.micro = {
		enable = true;
		settings = {
			clipboard =	"external";
			ignorecase=	true;
			autosu=		false;
#			colorscheme=./catppuccin-mocha.micro;
		};
	};
#q	home.file.".config/micro/colorschemes/catppuccin-mocha.micro".source = ./catppuccin-mocha.micro;
}
