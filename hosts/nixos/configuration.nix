{
  pkgs,
  inputs,
  user,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/uwsm.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # https://nixos.wiki/wiki/AMD_GPU#Make_the_kernel_use_the_correct_driver_early
  boot.initrd.kernelModules = ["amdgpu"];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # https://nixos.wiki/wiki/Bluetooth#Enabling_Bluetooth_support
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # 59100: AudioRelay server discovery
  # 59200: AudioRelay audio transport
  networking.firewall.allowedUDPPorts = [59100 59200];

  # Auto mount/unmount drives
  services.gvfs.enable = true;

  # https://nixos.wiki/wiki/PipeWire#Enabling_PipeWire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.${user} = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel"];
  };

  # https://nixos.wiki/wiki/Command_Shell#For_all_users
  users.defaultUserShell = pkgs.zsh;

  time.timeZone = "Europe/Istanbul";
  i18n.defaultLocale = "en_US.UTF-8";

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    tree
  ];

  # https://wiki.hyprland.org/Nix/Hyprland-on-NixOS/
  programs.hyprland.enable = true;
  programs.hyprland.withUWSM = true;

  # https://nixos.wiki/wiki/Command_Shell#Enable
  programs.zsh.enable = true;

  # https://nixos.wiki/wiki/Steam#Install
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  system.stateVersion = "25.05";
}