{ pkgs, inputs, ... }: {
  imports = [
    ../../modules/home/hyprland
    ../../modules/home/ghostty.nix
    ../../modules/home/vscode.nix
    ../../modules/home/stylix.nix
    ../../modules/home/zen-browser.nix

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
    hyprshot
    nur.repos.slaier.audiorelay
    inputs.self.packages.${system}.lncrawl
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
}
