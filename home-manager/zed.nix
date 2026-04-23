{pkgs, ...}:

{
  programs.zed-editor = {
    enable = true;
  };
  home.shellAliases = {
    zed = "zeditor";
  };

  home.packages = with pkgs; [
    clang
    nil
    nixd
  ];


}
