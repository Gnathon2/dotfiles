{pkgs, ...}:

{
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages
    patchelf
    # haskellPackages.gi-pangocairo
    atk
    cairo
    gdk-pixbuf
    glib
    # gstreamer
    # gst-plugins-base
    gtk3
    gtksourceview4
    libpeas
    librsvg
    pango
    vte

    dbus
    xorg.libX11
    xorg.libxcb
    xorg.libXi
    xorg.libXcursor
    xorg.libXdamage
    xorg.libXrandr
    xorg.libXcomposite
    xorg.libXext
    xorg.libXfixes
    xorg.libXrender
    xorg.libXtst
    xorg.libXScrnSaver

    # gnome2.GConf
    nss
    nspr
    alsa-lib
    cups
    fontconfig
    expat
    # libgtk
  ];
}