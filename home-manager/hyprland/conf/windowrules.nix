{...}:

{
  wayland.windowManager.hyprland.settings = {
    window_rule = [
      # tricks:  (?ire) case insensitive
       
      { match.class = ".*"; suppress_event = "maximize"; name = "suppress-maximize-event"; }
      #   # idle_inhibit = "fullsceen";
    
      { match.class = "i?picture-in-picture"; float = true; }
      { match.class = "i?matplotlib.*"; float = true; }
      # { match.class = ".*mpv.*"; pin = true; float = true; }
      { match.class = "i?kitty"; float = true; }

      { match.class = "i?dev.zed.*"; workspace = "2"; }
      { match.class = "i?zen.*"; workspace = "3"; }
      { match.class = "i?discord.*"; workspace = "zero"; }
      { match.class = "i?spotify.*"; workspace = "music"; }
      
    ];
  };
}