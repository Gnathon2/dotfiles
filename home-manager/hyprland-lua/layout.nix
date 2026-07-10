{...}:

{

  # config.layout = {};
  
  config.dwindle = {
    # pseudotile = true;
    preserve_split = true;
  };


  config.master = {
    new_status = "slave";
    new_on_active = "after";
    allow_small_split = false;
  };

  config.scrolling = {
    direction = "down";
    column_width = 0.9;
  };
}