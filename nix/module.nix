{config, pkgs, ...}:

{
  config = {
    services.jitsi-meet = {
      enable = true;
      hostName = "jitsi.example.com";
    };

    services.jitsi-videobridge.openFirewall = true;
    networking.firewall.allowedTCPPorts = [ 80 443 ];
    security.acme.email = "me@example.com";
    security.acme.acceptTerms = true;
  };
}
