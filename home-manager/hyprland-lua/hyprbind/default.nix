{...}:
{
  imports = [
    ./workspace.nix
    ./system.nix
    ./apps.nix
  ];

  wayland.windowManager.hyprland.settings = {
    bind = [
      "SUPER, Escape, killactive"
      "CONTROL SUPER ALT, Escape, exit" # kill hyprland
      "SUPER, A, exec, kitty"
    ];
    gesture = [
      
    ];
  };
}