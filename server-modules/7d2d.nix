{ config, lib, pkgs, ... }:

let
  username = config.var.username;
in {
  systemd.services.sevendaystodie = {
    description = "7 Days to Die Dedicated Server";
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      User = username;
      Group = "users";
      WorkingDirectory = "/opt/7d2d-server";

      ExecStart = ''
        ${pkgs.steam-run}/bin/steam-run /opt/7d2d-server/7DaysToDieServer.x86_64 \
          -logfile /opt/7d2d-server/dedicated.log \
          -configfile=serverconfig.xml \
          -quit -batchmode -nographics \
          -heapsize 16777216
      '';

      Restart = "on-failure";
      RestartSec = 5;

      StandardOutput = "journal";
      StandardError = "journal";
    };

    path = with pkgs; [ steam-run mono glibc zlib xorg.libX11 ];
  };

  systemd.tmpfiles.rules = [
    "d /opt/7d2d-server 0755 ${username} users -"
  ];
}
