{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # WoeUSB - утилита для записи Windows ISO на USB (поддерживает Windows 11)
    woeusb
    
    # UNetbootin - графическая утилита для создания загрузочных USB
    unetbootin
    
    # GNOME Multi Writer - утилита для записи ISO на несколько USB одновременно
    gnome-multi-writer
    
    # ISO Image Writer - программа для записи ISO на USB диски
    isoimagewriter
    
    # Дополнительные утилиты для работы с ISO
    # dd - стандартная утилита для записи образов (уже в системе)
    # parted - для работы с разделами (уже в системе)
    # gparted - графический редактор разделов
    gparted
    
    # Утилиты для работы с образами
    # 7zip - для работы с архивами и образами
    p7zip
    
    # Утилиты для работы с USB
    usbutils
    
    # Утилиты для проверки целостности
    # sha256sum, md5sum уже включены в базовую систему
    
    # Wrapper для UNetbootin с правильными настройками
    (writeShellScriptBin "unetbootin-sudo" ''
      #!/bin/sh
      # Запуск UNetbootin с правами root и правильными настройками X11
      xhost +local:root
      sudo -E QT_X11_NO_MITSHM=1 DISPLAY=$DISPLAY unetbootin "$@"
    '')
  ];
}
