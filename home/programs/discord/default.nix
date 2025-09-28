{ inputs, ... }: let
  nixcordPkgs = inputs.nixcord.packages;
in {
  imports = [inputs.nixcord.homeModules.nixcord];

  programs.nixcord = {
    enable = true;

    discord = {
      enable = false;     # отключаем стандартный Discord
      openASAR.enable = false;

      vencord = {
        enable = true;    # включаем Vencord
      };
    };

    vesktop = {
      enable = true;
    };

    config.plugins = {
      fakeNitro.enable = true;
      friendsSince.enable = true;
      crashHandler.enable = true;
      volumeBooster.enable = true;
      notificationVolume.enable = true;
      webScreenShareFixes.enable = true;
    };
  };
}
