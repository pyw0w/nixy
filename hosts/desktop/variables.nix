{
  config,
  lib,
  ...
}: {
  imports = [
    # Choose your theme here:
    ../../themes/catppuccin.nix
  ];

  config.var = {
    hostname = "desktop";
    username = "pyw0w";
    configDirectory =
      "/home/"
      + config.var.username
      + "/.config/nixos"; # The path of the nixos configuration directory

    keyboardLayout = "us,ru";

    location = "Russia";
    timeZone = "Asia/Yekaterinburg";
    defaultLocale = "ru_RU.UTF-8";
    extraLocale = "en_US.UTF-8";

    git = {
      username = "pyw0w";
      email = "myxi2002@gmail.com";
    };

    autoUpgrade = false;
    autoGarbageCollector = true;
  };

  # Let this here
  options = {
    var = lib.mkOption {
      type = lib.types.attrs;
      default = {};
    };
  };
}
