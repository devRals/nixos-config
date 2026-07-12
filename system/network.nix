{config, ...}: {
	networking.hostName = config.var.hostname;
	networking.networkmanager.enable = true;
	systemd.services.NetworkManager-wait-online.enable = false;
}
