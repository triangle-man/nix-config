## Home Raspberry Pi 4 configuration
## James Geddes 2023


{ config, pkgs, ... }:

{

  # Use the extlinux boot loader. (NixOS wants to enable GRUB by default)
  boot.loader.grub.enable = false;
  # Enables the generation of /boot/extlinux/extlinux.conf
  boot.loader.generic-extlinux-compatible.enable = true;

  ## Networking
  ## ----------
  
  networking.hostName = "macacinho"; # Define your hostname.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  
  services.openssh.enable = true;

  services.tailscale.enable = true;

  ## Localisation
  ## ------------

  time.timeZone = "Europe/London";

  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "uk";
    # useXkbConfig = true; 
  };

  ## Users
  ## -----
  
  security.sudo.wheelNeedsPassword = false;

  users.users = {
    james = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKuv4EfGytAZvNnCQD50Qsi8kXqryQa6kqfzySD5rYY1 geddes.james@me.com"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBhJp1ZZYslOjyl21Il2rmoxaxGdovWAycUWVVhjdpUI jgeddes@turing.ac.uk"
      ];
      packages = with pkgs; [
      ];
    };
  };


  ## System-wide configuration
  ## -------------------------
  
  environment.systemPackages = with pkgs; [
    tailscale
    git
    vim
    emacs29
    wget
    lm_sensors	
  ];

}

