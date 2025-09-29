# Firewall configuration for NixOS
{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      26900 # Query port (Steam)
    ];
    allowedUDPPorts = [
      26900 # Game server
      26901 # Steam communication
      26902 # Networking (LiteNetLib)
    ];
    allowedUDPPortRanges = [
      { from = 27000; to = 27050; } # Server list registration (OUT)
    ];
  };
}
