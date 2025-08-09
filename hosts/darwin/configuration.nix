{ lib, inputs, user, ... }: {
  nix.settings.experimental-features = ["nix-command flakes"];

  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;

  users.users.${user}.home = lib.mkDefault /Users/${user};
  system.primaryUser = user;

  homebrew = {
    enable = true;
    casks = [
      "zen"
      "ghostty"
    ];
  };

  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;
  system.stateVersion = 6;
}