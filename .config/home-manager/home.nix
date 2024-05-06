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
    pkgs.bat
    pkgs.starship
    pkgs.eza
    pkgs.antigen

    pkgs.devbox
    pkgs.direnv
    pkgs.nix-direnv
  ];

  home.sessionVariables = {
    HOMEMANPATH = "$HOME/.config/home-manager";
  };

  programs.home-manager.enable = true;
}
