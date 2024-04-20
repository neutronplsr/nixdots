let

  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-22.11";

  pkgs = import nixpkgs { config = {}; overlays = []; };

in

{

  ds9 = pkgs.callPackage ./ds9.nix { };

}
