{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "yutingrui";
        email = "fenjinzhe@foxmail.com";
      };
      credential.helper = "store";
    };
  };
}
