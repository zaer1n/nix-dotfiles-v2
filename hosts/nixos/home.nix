{ pkgs, inputs, ... }: {
  imports = [
    ../../modules/home/hyprland
    ../../modules/home/ghostty.nix
    ../../modules/home/vscode.nix
    ../../modules/home/stylix.nix

    ../../modules/home/shell/bat.nix
    ../../modules/home/shell/direnv.nix
    ../../modules/home/shell/zsh.nix
    ../../modules/home/shell/git.nix
  ];

  home.stateVersion = "25.05";
  home.packages = with pkgs; [
    nautilus
    adwaita-icon-theme
    nixd
    overskride
    pwvucontrol
    noto-fonts # (!)
    hyprshot
  ] ++ [
    inputs.zen-browser.packages.${pkgs.system}.default
  ];
}
