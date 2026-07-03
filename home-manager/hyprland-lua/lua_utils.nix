{lib} :
{
  bind = {key, cmd} : 
    let lua = lib.generators.mkLuaInline cmd; 
    in {_args = [key lua]; };

  exec_cmd = cmd : "hl.dsp.exec_cmd(\"" + cmd + "\")";
 
}