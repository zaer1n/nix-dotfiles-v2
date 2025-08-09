{ pkgs, inputs, config, ... }: {
  imports = [
    inputs.stylix.homeModules.stylix
  ];

  stylix = {
    enable = true;
    image = pkgs.fetchurl {
      url = "https://w.wallhaven.cc/full/7j/wallhaven-7j3rpy.jpg";
      hash = "sha256-YS6SqtcA7yYYr7NYxRdY6INGGOTiwRKFrrrc6QaZ/H8=";
    };
    polarity = "dark";

    cursor = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };
    iconTheme = {
      enable = true;
      dark = "MoreWaita";
      package = pkgs.morewaita-icon-theme;
    };

    targets = {
      gtk.extraCss = ''
        @define-color sidebar_bg_color #${config.stylix.base16Scheme.base00};
        @define-color headerbar_bg_color #${config.stylix.base16Scheme.base00};
      '';
      vscode.enable = false;
      rofi.enable = false;
    };
  };
}