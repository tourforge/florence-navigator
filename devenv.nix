{ config, pkgs, lib, ... }:

{
  languages.kotlin.enable = true;
  languages.nix.enable = true;
  languages.swift.enable = true;
  languages.dart.enable = true;
  languages.java = {
    jdk.package = lib.mkForce pkgs.jdk17;
  };

  android = {
    enable = true;
    flutter.enable = true;
    
    buildTools.version = [
      # This one is for zipalign for ELF alignment checking
      "35.0.0-rc3"
      "35.0.0"
    ];

    platforms.version = [
      "35"
      "36"
    ];
    
    ndk.enable = true;
    ndk.version = [ "29.0.14206865" ];

    emulator.enable = true;
  };

  packages = with pkgs; [
    git
    ripgrep
    
    bundletool
    android-studio-tools
  ];

  tasks."android-build:build-apk" = {
    exec = "flutter clean && flutter build apk";
    cwd = "${config.env.DEVENV_ROOT}";
  };

  tasks."android-build:check-elf-alignment" = {
    exec = "./check_elf_alignment.sh build/app/outputs/flutter-apk/app-release.apk";
    cwd = "${config.env.DEVENV_ROOT}";
    after = [ "android-build:build-apk" ];
  };
}