{ pkgs, pkgs-pinneda, ... }:

{
  environment.systemPackages = with pkgs-pinneda; [ graalvm-ce ];
}
