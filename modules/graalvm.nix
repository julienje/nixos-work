{ pkgs, ... }:

{
  environment.systemPackages = with nixpkgs-pgraalvm.legacyPackages.aarch64-linux; [ graalvm-ce ];
}
