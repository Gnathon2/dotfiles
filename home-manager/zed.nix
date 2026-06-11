{pkgs, ...}:

{
  programs.zed-editor = {
    enable = true;
  };
  home.shellAliases = {
    z = "zeditor";
  };

  home.packages = with pkgs; [
    clang
    nil
    nixd
  ];


}
