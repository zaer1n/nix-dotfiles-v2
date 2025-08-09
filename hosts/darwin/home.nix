{ pkgs, inputs, ... }: {
  imports = [
    ../../modules/vscode.nix
    ../../modules/ghostty.nix

    ../../modules/home/shell/bat.nix
    ../../modules/home/shell/direnv.nix
    ../../modules/home/shell/zsh.nix
    ../../modules/home/shell/git.nix
  ];

  home.stateVersion = "25.05";
  home.packages = with pkgs; [
    raycast
  ] ++ [
    inputs.zen-browser.packages.${pkgs.system}.default
  ];

  homebrew = {
    enable = true;
  };
}