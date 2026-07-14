{lib, ...}:

{

  wayland.windowManager.hyprland.settings = {
    config =  {
      # layout = {};
    
      dwindle = {
        preserve_split = true;
        smart_split = true;
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

    bind = [
      { _args = ["CONTROL + SUPER + L" (lib.generators.mkLuaInline ''
        function()
          local current_layout = hl.get_config("general.layout")
            
          if current_layout == "dwindle" then
              hl.config({ general = { layout = "scrolling" } })
          else
              hl.config({ general = { layout = "dwindle" } })
          end
        end 
      '') {description = "this monster allow layout toggling ";}]; }
    ];
  };
}