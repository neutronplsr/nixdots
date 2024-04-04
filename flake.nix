{
	description  = "livova's nixos flake";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-23.11";
		home-manager.url = "github:nix-community/home-manager/release-23.11";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
	};

	outputs = inputs@{ self, nixpkgs, home-manager, ... }:
	let 
		system = "x86_64-linux";
		lib = nixpkgs.lib;
		pkgs= nixpkgs.legacyPackages.${system};
	in {
		nixosConfigurations = {
			livova-laptop = lib.nixosSystem{
				inherit system;
				modules = [
					./core.nix
					./devices/laptop.nix
					#define optional package sets to install
					#./programs/fun.nix
					#./programs/school.nix

					home-manager.nixosModules.home-manager {
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages   = true;
						home-manager.users.neutron = import ./home.nix;
					}
				];
				
			};
			livova-desktop = lib.nixosSystem{
				inherit system;
				modules = [
					./core.nix
					./devices/desktop.nix
					#define optional package sets to install
					#./programs/fun.nix
					#./programs/school.nix


					home-manager.nixosModules.home-manager{
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages   = true;
						home-manager.users.neutron = import ./home.nix;
					}
				];
				
			};	
	
		};
	};
}
