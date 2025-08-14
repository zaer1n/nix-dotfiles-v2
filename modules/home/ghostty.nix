{ pkgs, ... }: {
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    package = with pkgs; if stdenv.isDarwin then ghostty-bin else ghostty;

    settings = {
      background-opacity = 0.8;
      window-padding-x = 12;
      window-padding-y = 4;
    };
  };
}