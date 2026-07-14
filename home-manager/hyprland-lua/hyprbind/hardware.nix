{lib, ...}:
let util = import ../lua_utils.nix {lib = lib; }; in 
let dspexc = cmd : util.arg "exec_cmd" cmd; in
{
  wayland.windowManager.hyprland.settings = {

    bind = map util.bind [

      {key = "XF86AudioRaiseVolume"; dsp = dspexc "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"; flg = { locked = true; repeating = true; }; }
      {key = "XF86AudioLowerVolume"; dsp = dspexc "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"; flg = { locked = true; repeating = true; }; }
      {key = "XF86AudioMute"; dsp = dspexc "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"; flg = { locked = true; repeating = true; }; }
      {key = "XF86AudioMicMute"; dsp = dspexc "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"; flg = { locked = true; repeating = true; }; }

      {key = "XF86MonBrightnessUp"; dsp = dspexc "brightnessctl -e4 -n1 set 5%+"; flg = { locked = true; repeating = true; }; }
      {key = "XF86MonBrightnessDown"; dsp = dspexc "brightnessctl -e4 -n1 set 5%-"; flg = { locked = true; repeating = true; }; }

      {key = "XF86AudioNext"; dsp = dspexc "playerctl next"; flg = { locked = true; }; }
      {key = "XF86AudioStop"; dsp = dspexc "playerctl stop"; flg = { locked = true; long_press = true; }; }
      {key = "XF86AudioPlay"; dsp = dspexc "playerctl play-pause"; flg = { locked = true; }; }
      {key = "XF86AudioPrev"; dsp = dspexc "playerctl previous"; flg = { locked = true; }; }
    ];
  };



      
}