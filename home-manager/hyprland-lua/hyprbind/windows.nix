{lib, ...}:
let util = import ../lua_utils.nix {lib = lib;}; in
{
  wayland.windowManager.hyprland.settings = {
    # binds.drag_threshold = 10;
    bind = map util.bind [
      ### focus ### 
      { key = "SUPER + code:49"; dsp = util.arg "workspace.toggle_special" "magic"; } #²
      { key = "SUPER + code:10"; dsp = "focus({workspace = 1})"; } #1
      { key = "SUPER + code:11"; dsp = "focus({workspace = 2})"; } 
      { key = "SUPER + code:12"; dsp = "focus({workspace = 3})"; }
      { key = "SUPER + code:13"; dsp = "focus({workspace = 4})"; }
      { key = "SUPER + code:14"; dsp = "focus({workspace = 5})"; }
      { key = "SUPER + code:15"; dsp = "focus({workspace = 6})"; }
      { key = "SUPER + code:16"; dsp = "focus({workspace = 7})"; }
      { key = "SUPER + code:17"; dsp = "focus({workspace = 8})"; }
      { key = "SUPER + code:18"; dsp = "focus({workspace = 9})"; } #9
      { key = "SUPER + code:19"; dsp = "focus({workspace = 10})"; } #0
      { key = "SUPER + code:20"; dsp = "focus({workspace = \"name:0\"})"; } #°

      { key = "ALT + TAB"; dsp = "focus({urgent_or_last = true})"; }
      { key = "SUPER + TAB"; dsp = "focus({workspace = \"e-1\"})"; }
      { key = "SUPER + SHIFT + TAB"; dsp = "focus({workspace = \"e+1\"})"; }
      { key = "CONTROL + SUPER + mouse_down"; dsp = "focus({workspace = \"e-1\"})"; }
      { key = "CONTROL + SUPER + mouse_up"; dsp = "focus({workspace = \"e+1\"})"; }

      { key = "SUPER + mouse_up"; dsp = "focus({direction = \"d\"})"; }
      { key = "SUPER + mouse_down"; dsp = "focus({direction = \"u\"})"; }
      
      { key = "SUPER + left"; dsp = "focus({direction = \"l\"})"; }
      { key = "SUPER + right"; dsp = "focus({direction = \"r\"})"; }
      { key = "SUPER + up"; dsp = "focus({direction =\"u\"})"; }
      { key = "SUPER + down"; dsp = "focus({direction = \"d\"})"; }
      
      ### move ###
      { key = "SUPER + ALT + code:49"; dsp = "window.move({workspace = \"special:magic\"})"; }
      { key = "SUPER + ALT + code:10"; dsp = "window.move({workspace = 1})"; } 
      { key = "SUPER + ALT + code:11"; dsp = "window.move({workspace = 2})"; }
      { key = "SUPER + ALT + code:12"; dsp = "window.move({workspace = 3})"; }
      { key = "SUPER + ALT + code:13"; dsp = "window.move({workspace = 4})"; }
      { key = "SUPER + ALT + code:14"; dsp = "window.move({workspace = 5})"; }
      { key = "SUPER + ALT + code:15"; dsp = "window.move({workspace = 6})"; }
      { key = "SUPER + ALT + code:16"; dsp = "window.move({workspace = 7})"; }
      { key = "SUPER + ALT + code:17"; dsp = "window.move({workspace = 8})"; }
      { key = "SUPER + ALT + code:18"; dsp = "window.move({workspace = 9})"; }
      { key = "SUPER + ALT + code:19"; dsp = "window.move({workspace = 10})"; }
      { key = "SUPER + ALT + code:20"; dsp = "window.move({workspace = \"name:0\"})"; }

      
      ### other ### 
      { key = "CONTROL + SUPER + A"; dsp = "window.drag()"; flg = {mouse = true;}; } #leftclick
      { key = "SUPER + mouse:272"; dsp = "window.drag()"; flg = {mouse = true;}; }
      { key = "CONTROL + SUPER + Z"; dsp = "window.resize()"; flg = {mouse = true;}; } #rightclick
      { key = "SUPER + mouse:273"; dsp = "window.resize()"; flg = {mouse = true;}; }

      { key = "CONTROL + SUPER + E"; dsp = "window.pin()"; }
      # { key = "CONTROL SUPER + H"; dsp = "togglesplit"; }
      { key = "CONTROL + SUPER + D"; dsp = "window.pseudo()"; }
      { key = "CONTROL + SUPER + F"; dsp = "window.float()"; }
      { key = "CONTROL + SUPER + G"; dsp = "group.toggle()"; }
      # { key = "CONTROL SUPER + O"; dsp = "exec, \"$(if hyprctl getoption decoration:blur:ignore_opacity | grep 1; then hyprctl keyword decoration:blur:ignore_opacity false; else hyprctl keyword decoration:blur:ignore_opacity true; fi)\""; }
      { key = "CONTROL + SUPER + L"; fnc = "toggle_layout"; }
      
      
    ];
    
    gesture = [
      {fingers = 3; direction = "vertical"; action ="scroll_move";}
      {fingers = 3; direction = "horizontal"; action ="workspace";}
      
      {fingers = 3; direction = "pinchout"; mods = "SHIFT"; action = "float";}
      {fingers = 3; direction = "pinchin"; mods = "SHIFT"; action = "fullscreen";}
      {fingers = 3; direction = "left"; mods = "SHIFT"; 
        action = lib.generators.mkLuaInline "function() hl.dispatch(hl.dsp.window.move({ workspace = \"-1\", follow = true })) end";}
      {fingers = 3; direction = "right"; mods = "SHIFT"; 
        action = lib.generators.mkLuaInline "function() hl.dispatch(hl.dsp.window.move({ workspace = \"+1\", follow = true })) end";}
      {fingers = 3; direction = "down"; mods = "SHIFT"; action = lib.generators.mkLuaInline "toggle_layout";}
      # {fingers = 3; direction = "up"; mods = "SHIFT"; action = "hyprexpo";}
      
      {fingers = 4; direction = "swipe"; action = "move"; }
      {fingers = 4; direction = "swipe"; mods = "SHIFT"; action = "resize"; }

      {fingers = 4; direction = "pinch"; action ="cursorZoom"; mode="live";}
      
      # {fingers = 4; direction = "left"; action = ""; }
      
      # {fingers = 4; direction = "horizontal"; action ="scroll_move";}
    ];
  };
}