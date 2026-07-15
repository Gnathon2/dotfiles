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
        direction = "down";
        column_width = 0.9;
      };
    };
  };
}