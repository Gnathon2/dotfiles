{lib} :
{
  bind = {key, dsp, flg ? {}} : {_args = [key (lib.generators.mkLuaInline "hl.dsp.${dsp}") flg]; };

  exec_cmd = cmd : "hl.dsp.exec_cmd(\"${cmd}\")";

  arg = dsp : (arg : "${dsp}(\"${arg}\")"); 

  on_start = some_cmd : 
    let func = lib.generators.mkLuaInline 
      ("function () hl.exec_cmd(\"" + some_cmd + "\") end"); 
    in { _args = ["hyprland.start" func]; };
}