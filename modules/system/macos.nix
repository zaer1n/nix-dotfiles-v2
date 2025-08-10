{ pkgs, ... }: {
  security.pam.services.sudo_local.touchIdAuth = true;
  system.defaults = {
    dock = {
      tilesize = 48;
      magnification = true;
      largesize = 54;
      show-recents = false;
      minimize-to-application = true;
      persistent-apps = [
        { app = "${pkgs.vscode}/Applications/Visual Studio Code.app"; }
        { app = "/Applications/Ghostty.app"; }
        { app = "/Applications/Zen.app"; }
      ];
    };
    
    finder = {
      ShowPathbar = true;
      ShowStatusBar = true;
      _FXShowPosixPathInTitle = false;
    };

    trackpad = {
      Clicking = true;
    };

    controlcenter = {
      BatteryShowPercentage = true;
    };

    NSGlobalDomain = {
      AppleShowAllExtensions = true;

      "com.apple.swipescrolldirection" = false;
      "com.apple.mouse.tapBehavior" = 1;
    };

    CustomUserPreferences = {
      "com.apple.Siri" = {
        VoiceTriggerUserEnabled = 1;
      };
    };
  };
}