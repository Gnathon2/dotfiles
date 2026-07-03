{lib} :
{
  bind = {key, dsp} : {_args = [key (lib.generators.mkLuaInline dsp)]; };

  exec_cmd = cmd : "hl.dsp.exec_cmd(\"" + cmd + "\")";

  arg = b : (a : b + "(\"" + a + "\")"); 
}