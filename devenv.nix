{ pkgs, lib, ... }:

{
  android = {
    enable = true;
    flutter.enable = true;
    android-studio.enable = true;
    buildTools.version = [ "34.0.0" ];
    platforms.version = [ "33" "34" ];
  };
  
  languages.java.jdk.package = lib.mkForce pkgs.jdk17;
}
