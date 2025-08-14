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
        { app = "${pkgs.ghostty-bin}/Applications/Ghostty.app"; }
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
      TrackpadRightClick = true;
      TrackpadThreeFingerDrag = true;
    };

    controlcenter = {
      BatteryShowPercentage = true;
    };

    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      AppleShowAllExtensions = true;

      ApplePressAndHoldEnabled = false;
      InitialKeyRepeat = 15;
      KeyRepeat = 2;

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