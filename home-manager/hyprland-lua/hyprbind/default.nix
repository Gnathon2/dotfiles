{lib, ...}:

let util = import ../lua_utils.nix {lib = lib;}; in
{
  imports = [
    ./workspace.nix
    ./system.nix
    ./apps.nix
  ];

  wayland.windowManager.hyprland.settings = {
    bind = map util.bind [
      { key = "SUPER + A";      dsp = util.arg "exec_cmd" "kitty"; }
      { key = "SUPER + Escape"; dsp = "window.close()"; }
    ];

    config.binds = {
      allow_workspace_cycles = true;
    };

    config.gestures = {
      workspace_swipe_forever = false;
    };
  };
}
