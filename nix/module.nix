{config, pkgs, ...}:

{
  config = {
    services.jitsi-meet = {
      enable = true;
    };

    services.jitsi-videobridge.openFirewall = true;
    networking.firewall.allowedTCPPorts = [ 80 443 ];
  };
}
