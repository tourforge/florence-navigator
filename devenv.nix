{ pkgs, lib, config, inputs, ... }:

{
  android = {
    enable = true;
    flutter.enable = true;
    android-studio.enable = true;
  };
}
