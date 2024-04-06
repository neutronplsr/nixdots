#!/bin/sh

echo Running nixos update...

git -C /home/neutron/.nixdots/ add .

nix flake update /home/neutron/.nixdots/.

sudo nixos-rebuild switch --flake /home/neutron/.nixdots/.

git -C /home/neutron/.nixdots/ commit -m "automatic commmit from update"
git -C /home/neutron/.nixdots/ push
echo Done nixos update!
