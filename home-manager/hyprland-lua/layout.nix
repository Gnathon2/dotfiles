{...}:

{

  wayland.windowManager.hyprland.settings = {
    config =  {
      # layout = {};
    
      dwindle = {
        preserve_split = true;
        smart_split = false;
      };
    
    
      master = {
        new_status = "slave";
        new_on_active = "after";
        allow_small_split = false;
      };
    
      scrolling = {
        direction = "right";
        column_width = 1;
        follow_focus = false;
      };
    };
  };
}