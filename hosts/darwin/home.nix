{ lib, pkgs, user, ... }: {
  imports = [
    ../../modules/home/vscode.nix
    ../../modules/home/ghostty.nix

    ../../modules/home/shell/bat.nix
    ../../modules/home/shell/direnv.nix
    ../../modules/home/shell/zsh.nix
    ../../modules/home/shell/git.nix
  ];

  home.stateVersion = "25.05";
  home.packages = with pkgs; [
    raycast
    nixd
    ani-cli
    devenv
    firefox
    (taterclient-ddnet.overrideAttrs {
      version = "10.3.0";
      src = fetchFromGitHub {
        owner = "sjrc6";
        repo = "taterclient-ddnet";
        tag = "V10.3.0";
        hash = "sha256-OEoiUtD87xsXBgAZ65mmfmAJcEvrley3drRX+IJo20s=";
      };
    })
  ];

  home.sessionVariables = {
    ANI_CLI_DOWNLOAD_DIR = /Users/${user}/Movies;
  };

  home.activation.setWallpaper = lib.hm.dag.entryAfter ["writeBoundary"] (let 
    wallpaper = pkgs.fetchurl (builtins.elemAt (import ../../wallpapers.nix) 0);
  in ''
    $DRY_RUN_CMD /usr/bin/osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"${wallpaper}\""
  '');
}