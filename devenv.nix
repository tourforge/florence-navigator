{ pkgs, inputs, lib, ... }:
let
  pkgs-unstable = import inputs.nixpkgs-unstable { system = pkgs.stdenv.system; };
in
{
  android = {
    enable = true;
    flutter.enable = true;
    flutter.package = pkgs-unstable.flutter;
    android-studio.enable = true;
    buildTools.version = [ "34.0.0" ];
    platforms.version = [ "33" "34" ];
  };
  
  languages.java.jdk.package = lib.mkForce pkgs.jdk17;
}