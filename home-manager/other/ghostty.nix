{inputs, ...}:

{
  programs.ghostty = {
    enable = true; 
    settings = {
      background = "#000";
      theme = "Citruszest";
      cursor-style = "block";
      confirm-close-surface = false;
      mouse-scroll-multiplier = 0.5;
      keybind = [
        "ctrl+up=new_split:up"
        "ctrl+down=new_split:down"
        "ctrl+right=new_split:right"
        "ctrl+left=new_split:left"
        "performable:ctrl+c=copy_to_clipboard"
        "ctrl+v=paste_from_clipboard" 
      ];
    };
  };
}