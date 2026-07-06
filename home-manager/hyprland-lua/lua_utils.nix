{lib} :
{
  bind = {key, dsp, flg ? {}} : {_args = [key (lib.generators.mkLuaInline ("hl.dsp." + dsp)) flg]; };

  exec_cmd = cmd : "hl.dsp.exec_cmd(\"" + cmd + "\")";

  arg = dsp : (arg : dsp + "(\"" + arg + "\")"); 
}