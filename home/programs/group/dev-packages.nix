{
  pkgs,
  pkgs-stable,
}:
(with pkgs; [
  go
])
++ (with pkgs-stable; [
  nodejs
  duckdb
  python3
])
