{lib, ...}:

let util = import ../lua_utils.nix {lib = lib;}; in 
{
  wayland.windowManager.hyprland.settings = {

    curve = map util.curve [
      
    ];

    animation = [
      { leaf = "global"; enabled = false; }
      # { leaf = ""; enabled = true; speed = 1; bezier = "";}
    ];
    
  };
}