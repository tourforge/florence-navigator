{ config, pkgs, lib, ... }:

{
  android = {
    enable = true;
    flutter.enable = true;

    buildTools.version = [ "35.0.0" "36.0.0" ];
    platforms.version = [ "35" "36" ];
    
    ndk.enable = true;
    ndk.version = [ "29.0.14206865" ];
  };

  languages.java = {
    jdk.package = lib.mkForce pkgs.jdk17;
  };

  packages = with pkgs; [
    bundletool
  ];
}