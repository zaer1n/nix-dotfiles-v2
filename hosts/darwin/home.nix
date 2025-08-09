{ lib, pkgs, ... }: {
  imports = [
    ../../modules/home/vscode.nix

    ../../modules/home/shell/bat.nix
    ../../modules/home/shell/direnv.nix
    ../../modules/home/shell/zsh.nix
    ../../modules/home/shell/git.nix
  ];

  home.stateVersion = "25.05";
  home.packages = with pkgs; [
    raycast
    nixd
  ];

  home.activation.setWallpaper = lib.hm.dag.entryAfter ["writeBoundary"] (let 
    wallpaper = pkgs.fetchurl (builtins.elemAt (import ../../wallpapers.nix) 0);
  in ''
    $DRY_RUN_CMD /usr/bin/osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"${wallpaper}\""
  '');
}