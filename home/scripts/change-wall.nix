{pkgs, ...}: let
  change-wall = pkgs.writeShellScriptBin "change-wall" ''
    CACHE_DIR="$HOME/.cache"
    LINK_PATH="$CACHE_DIR/wallpaper"
    TARGET_WALL="$1"

    if [ -z "$TARGET_WALL" ]; then
        echo "Usage: change-wall ~/wallpapers/your_image.png"
        exit 1
    fi

    mkdir -p "$CACHE_DIR"

    ln -sf "$TARGET_WALL" "$LINK_PATH"

    echo "Wallpaper updated to: $TARGET_WALL"
  '';
in {
  home.packages = [change-wall];
}
