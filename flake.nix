{
	description  = "livova's nixos flake";
	# defines all inputs into our system
	inputs = {
		## nixos version
		nixpkgs.url = "nixpkgs/nixos-23.11";
		nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

		## home-manager version
		home-manager.url = "github:nix-community/home-manager/release-23.11";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";

		## hyprland stuff
		hyprland.url = "github:hyprwm/Hyprland";
		hyprland-plugins = {
		    url = "github:hyprwm/hyprland-plugins";
		    inputs.hyprland.follows = "hyprland";
	  	};
	  	hyprlock.url = "github:hyprwm/Hyprlock";
	  	hyprlang = {
	  	      url = "github:hyprwm/hyprlang";
	  	      inputs.nixpkgs.follows = "nixpkgs";
  	    };
	};

	# defines outputs, our actual system
	outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, home-manager, hyprland, hyprlock, ... }:
	## defines variables for our various sytems
	let 
		system = "x86_64-linux";
		lib = nixpkgs.lib;
		pkgs= nixpkgs.legacyPackages.${system};
	in {
		nixosConfigurations = {
			## this will be used when the host name of our device matches livova-laptop
			livova-laptop = lib.nixosSystem{
				## uses variable defined above
				inherit system;
				modules = [
					## imports our  main configuration file for nix
					./core.nix
					## imports our hardware configuration for this device
					./devices/laptop.nix
					## allows home-manager to set theming and packages
					home-manager.nixosModules.home-manager {
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages   = true;
						home-manager.users.neutron = import ./home.nix;							
					}
					## allows us to pick what optional modules of packages to install
					{home-manager.users.neutron.imports = [
							./programs/fun.nix
							./programs/school.nix	
						 	hyprlock.homeManagerModules.hyprlock											
					];	}
				];
			};
		};

		overlays = {
			add-unstable-packages = final: _prev: {
			    unstable = import nixpkgs-unstable {
			      system = "x86_64-linux";
			    };
		  	};
	  	};
	};
}
