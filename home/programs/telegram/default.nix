{ pkgs, ... }:

{
  programs.telegram-desktop = {
    enable = true;

    # optional: кастомные настройки
    settings = {
      frameless = true;     # пример
      autostart = true;
      theme = "Dark";
    };
  };
}
