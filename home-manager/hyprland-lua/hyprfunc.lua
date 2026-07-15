function toggle_layout()
  local current_layout = hl.get_config("general.layout")
    
  if current_layout == "dwindle" then
      hl.config({ general = { layout = "scrolling" } })
  else
      hl.config({ general = { layout = "dwindle" } })
  end
end 