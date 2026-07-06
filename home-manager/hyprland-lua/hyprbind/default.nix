{lib, ...}:

let util = import ../lua_utils.nix {lib = lib;}; in
{
  imports = [
    ./workspace.nix
    #./system.nix
    ./apps.nix
  ];

  wayland.windowManager.hyprland.settings = {
    bind = map util.bind [
      { key = "SUPER + A";      dsp = util.arg "exec_cmd" "kitty"; }
      { key = "SUPER + Escape"; dsp = "window.close()"; }
      
      # { _args = ["SUPER + A" (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"kitty\")")]; }
      # { _args = ["SUPER + Escape" (lib.generators.mkLuaInline "hl.dsp.window.close()") {locked = true;}]; }
    ];
  };
}
