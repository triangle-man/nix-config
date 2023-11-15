## Home Raspberry Pi 4 configuration
## James Geddes 2023
## 
## Copy this file to /etc/nixos
## and symlink ./nix-config to this repo

{ config, pkgs, ... }:

{
  imports =
    [ 
      <nixos-hardware/raspberry-pi/4>
      ./hardware-configuration.nix
      ./nix-config/macacinho.nix	
    ];

  system.stateVersion = "23.11"; 

}

