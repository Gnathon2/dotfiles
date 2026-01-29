{...}:
{
  imports = [
    ./ghostty.nix
  ];
  
  catppuccin = {
    enable = true;
    accent = "maroon";
    flavor = "mocha";

    # btop.enable = true;
    # ghostty.enable = true;
    # gtk.icon.enable = true;
    hyprlock.enable = false;
    vscode.profiles.default.enable = false;
    # vscode.profiles.catppuccin = {
    #   # can't use this because it locks .vscode/extensions/ which is no no
    #   accent = "yellow";
    #   settings = {
    #     boldKeywords = true;
    #     italicComments = true;
    #     italicKeywords = true;
    #     colorOverrides = {};
    #     customUIColors = {};
    #     workbenchMode = "default";
    #     bracketMode = "rainbow";
    #     extraBordersEnabled = false;
    #   };
    # };
  };

  gtk = {
    enable = true;
    colorScheme = "dark";

    # theme = {
    #   package = pkgs.flat-remix-gtk;
    #   name = "Flat-Remix-GTK-Grey-Darkest";
    # };

    # iconTheme = {
    #   package = pkgs.adwaita-icon-theme;
    #   name = "Adwaita";
    # };

    font = {
      name = "Sans";
      size = 11;
    };

    
    cursorTheme = {
      name = "custom";
      size = 39;
    };
  };
}