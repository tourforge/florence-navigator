{ config, pkgs, lib, ... }:

{
  languages.kotlin.enable = true;

  android = {
    enable = true;
    flutter.enable = true;
    
    buildTools.version = [
      # This one is for zipalign for ELF alignment checking
      "35.0.0-rc3"
      "35.0.0"
    ];
    platforms.version = [ "33" "34" "35" "36" ];
    
    ndk.enable = true;
    ndk.version = [ "29.0.14206865" ];

    android-studio.enable = true;
    emulator.enable = true;
  };

  languages.java = {
    jdk.package = lib.mkForce pkgs.jdk17;
  };

  packages = with pkgs; [
    bundletool
    gemini-cli-bin
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