{config, lib, pkgs, ...}:

with lib;

let cfg = config.jitsi;
in {
  options.jitsi = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = ''
        If enabled, the full jitsi server stack will be deployed.
      '';
    };

    hostName = mkOption {
      type = types.string;
      description = ''
        The hostname of the server to host Jitsi.
      '';
    };
  };

  config = mkIf cfg.enable {
    services.jitsi-meet = {
      enable = true;
      hostName = cfg.hostName;
    };

    services.jitsi-videobridge.openFirewall = true;
    networking.firewall.allowedTCPPorts = [ 80 443 ];
  };
}
