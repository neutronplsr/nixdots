#!/bin/sh

echo Running nixos update...

nix flake update /home/neutron/.nixdots/.
sudo nixos-rebuild switch --flake /home/neutron/.nixdots/.

echo Done nixos update!
