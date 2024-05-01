{ config, lib, pkgs, ... }:

let
  pkgsUnstable = import <nixpkgs-unstable> {};
in
{
  home.username = "jumpyvi";
  home.homeDirectory = "/var/home/jumpyvi";
  home.stateVersion = "23.11";

  home.packages = [
    pkgs.neovim
    pkgs.thefuck
    pkgs.fd
    pkgs.stow
    pkgs.dotnet-sdk_8
    pkgs.nodejs_20
    pkgs.bat
    pkgs.starship
    pkgs.eza
    pkgs.antigen
    pkgs.msbuild
    pkgs.cmake
    pkgs.postgresql_16
  ];

  home.sessionVariables = {
    HOMEMANPATH = "$HOME/.config/home-manager";
  };

  programs.home-manager.enable = true;
}
