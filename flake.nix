{
   description = "livova's nixos flake";
   inputs = {
   		nixpkgs.url = "nixpkgs/nixos-23.11";

   		home-manager.url= "github:nix-community/home-manager/release-23.11";
   		home-manager.inputs.nixpkgs.follows = "nixpkgs";

   		hyprland.url = "github:/hyprwm/Hyprland";
   };

   outputs = {self, nixpkgs, home-manager, hyprland,  ...}:
   let 
   	lib = nixpkgs.lib;
   	system = "x86_64-linux";
   	pkgs = nixpkgs.legacyPackages.${system};
   in {   
   		nixosConfigurations = {
   			livova-laptop-nixos = lib.nixosSystem{
   				inherit system;
   				modules = [
   					./configuration.nix
   				];
   			};
   		};
   		homeConfigurations =  {
			neutron = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				modules = [
					./home.nix
				];	
			};
   		};
   };
}
