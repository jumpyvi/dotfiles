{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "jumpyvi";
  home.homeDirectory = "/var/home/jumpyvi";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # Fish
    pkgs.fish
    pkgs.fishPlugins.forgit
    pkgs.fishPlugins.puffer
    pkgs.fishPlugins.bass
    pkgs.fishPlugins.sponge
    pkgs.fishPlugins.autopair

    # CLI utilities
    pkgs.neovim
    pkgs.zoxide
    pkgs.fastfetch
    pkgs.fzf
    pkgs.starship
    pkgs.trash-cli

    # Dev tools
    pkgs.devcontainer
    pkgs.yarn
    pkgs.nodejs_23
    pkgs.dotnet-sdk
    pkgs.dotnet-ef

    # Fonts & icons
    pkgs.nerd-fonts.blex-mono
    pkgs.inter
    pkgs.nerd-fonts.ubuntu-sans
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.morewaita-icon-theme
  ];

  home.file = {
    ".config/fish" = {
      source = config.lib.file.mkOutOfStoreSymlink dotfiles/fish;
      recursive = true;
    };

    ".config/ghostty/config" = {
      source = config.lib.file.mkOutOfStoreSymlink dotfiles/ghostty/config;
    };

    ".gitconfig" = {
      source = config.lib.file.mkOutOfStoreSymlink dotfiles/git/dot_gitconfig;
    };

    ".config/input-remapper-2" = {
      source = config.lib.file.mkOutOfStoreSymlink dotfiles/input-remapper-2;
      recursive = true;
    };

    ".config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink dotfiles/nvim;
      recursive = true;
    };

    ".config/starship.toml" = {
      source = config.lib.file.mkOutOfStoreSymlink dotfiles/starship/starship.toml;
    };

    ".local/share/logseq" = {
      source = config.lib.file.mkOutOfStoreSymlink dotfiles/logseq;
      recursive = true;
    };
  };


 home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
