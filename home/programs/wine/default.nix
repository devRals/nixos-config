{pkgs, ...}: {
  home.packages = with pkgs; [
    # The "Wow64" packages handle 32-bit and 64-bit compatibility automatically.
    # Choose ONE of these based on your needs:
    wineWow64Packages.stagingFull # For general stability

    # wineWow64Packages.staging  # Use this instead if you need experimental features

    # You usually only need winetricks once
    winetricks
  ];
}
