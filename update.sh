#!/bin/sh

echo Running nixos update...

git -C /home/neutron/.nixdots/ add .

nix flake update /home/neutron/.nixdots/.
sudo nixos-rebuild switch --flake /home/neutron/.nixdots/.

echo Done nixos update!
