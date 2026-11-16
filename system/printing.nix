{
  pkgs,
  config,
  ...
}: {
  services.printing.enable = true;
  services.printing.drivers = [pkgs.rastertoezpl pkgs.splix];

  environment.systemPackages = [pkgs.system-config-printer];
}
