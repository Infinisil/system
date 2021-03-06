{ lib, config, pkgs, ... }:

with lib;

{

  options.mine.gaming.enable = mkEnableOption "games";

  config = mkIf config.mine.gaming.enable {

    programs.steam.enable = true;

    boot.blacklistedKernelModules = [ "hid_steam" ];
    services.udev.extraRules = ''
      KERNEL=="uinput", SUBSYSTEM=="misc", MODE="0666"
    '';

    nixpkgs.config.pulseaudio = true;

    environment.systemPackages = with pkgs; [
      minecraft
      mumble
    ];

  };

}
