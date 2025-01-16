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
  home.packages = with pkgs; [
    # Fish
    fish
    fishPlugins.forgit
    fishPlugins.puffer
    fishPlugins.bass
    fishPlugins.sponge
    fishPlugins.autopair

    # CLI utilities
    neovim
    zoxide
    fastfetch
    fzf
    starship
    trash-cli

    # Dev tools
    devcontainer
    yarn
    nodejs_23
    dotnet-sdk
    dotnet-ef

    # Theming
    nerd-fonts.blex-mono
    inter
    nerd-fonts.ubuntu-sans
    nerd-fonts.jetbrains-mono
    morewaita-icon-theme
    adw-gtk3
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

  # Auto-updates
  services.home-manager.autoUpgrade.enable = true;
  services.home-manager.autoUpgrade.frequency = "daily";
}


