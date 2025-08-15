{ inputs, ... }: {
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;
    policies = {
      DisableAppUpdate = true;
      DisableTelemetry = true;
      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
        "{eac6e624-97fa-4f28-9d24-c06c9b8aa713}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/material-icons-for-github/latest.xpi";
          installation_mode = "force_installed";
        };
      };
    };
  };
}