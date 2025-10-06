{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Создаем wrapper для UNetbootin с правильными настройками
    (writeShellScriptBin "unetbootin-sudo" ''
      #!/bin/sh
      # Запуск UNetbootin с правами root и правильными настройками X11
      xhost +local:root
      sudo -E QT_X11_NO_MITSHM=1 DISPLAY=$DISPLAY unetbootin "$@"
    '')
  ];
}
