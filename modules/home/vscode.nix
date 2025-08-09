{
  pkgs,
  inputs,
  ...
}: {
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      pkief.material-icon-theme
      rust-lang.rust-analyzer
      golang.go
      mkhl.direnv
      github.vscode-github-actions
      tamasfe.even-better-toml
      unifiedjs.vscode-mdx
      astro-build.astro-vscode
      ms-python.python
      ms-python.vscode-pylance
      ms-vscode.cpptools-extension-pack
    ] ++ [
      inputs.self.packages.${pkgs.system}.moegi-theme
    ];
    profiles.default.userSettings = {
      "workbench.colorTheme" = "Moegi Dark Vitesse";
      "workbench.iconTheme" = "material-icon-theme";
      "editor.minimap.enabled" = false;
      "explorer.compactFolders" = false;
      "window.titleBarStyle" = "custom";
      "python.languageServer" = "Pylance";      
      "rust-analyzer.inlayHints.parameterHints.enable" = false;
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nixd";
      "nix.serverSettings.nixd" = {
        "formatting.command" = ["alejandra"];
        "nixpkgs.expr" = "import <nixpkgs> {}";
        "options" = {
          "nixos" = {
            "expr" = "(builtins.getFlake \"github:zaer1n/nix-dotfiles\").nixosConfigurations.nixos.options";
          };
          "nix-darwin" = {
            "expr" = "(builtins.getFlake \"github:zaer1n/nix-dotfiles\").darwinConfigurations.darwin.options";
          };
        };
      };
      "nix.hiddenLanguageServerErrors" = [
        "textDocument/definition"
      ];
      "[nix]" = {
        "editor.defaultFormatter" = "jnoortheen.nix-ide";
        "editor.formatOnPaste" = false;
        "editor.formatOnSave" = false;
      };
    };
  };
}
