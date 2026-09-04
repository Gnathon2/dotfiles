{lib} :
{
  bind = {key, dsp ? "", flg ? {}, fnc ? null} : {_args = [key (lib.generators.mkLuaInline (if isNull fnc then "hl.dsp.${dsp}" else fnc)) flg]; };

  # exec_cmd = cmd : "hl.dsp.exec_cmd(\"${cmd}\")";

  arg = dsp : (arg : "${dsp}(\"${arg}\")"); 

  on_start = some_cmd : 
    let func = lib.generators.mkLuaInline 
      ("function () hl.exec_cmd(\"" + some_cmd + "\") end"); 
    in { _args = ["hyprland.start" func]; };

  curve = {name, type, points}: 
    { _args = [name {type = type; points = points;}]; };
}