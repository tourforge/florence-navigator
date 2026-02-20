{ config, pkgs, lib, ... }:

lib.mkIf (config.stdenv.buildPlatform.isDarwin) {
  packages = with pkgs; [
    cocoapods
    # Tool to download select version of xcode
    xcodes
  ];

  # Slight harm to reproducibility, TOO BAD!
  apple.sdk = null;
  env.DEVELOPER_DIR = "";
  env.SDKROOT = "";
  env.NIX_APPLE_SDK_VERSION = "";
}
