{

  description = "Installing Global Tools with Nix";

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  };

  outputs = { self, nixpkgs }: let

    system = "x86_64-linux";

    pkgs = import nixpkgs { inherit system; };

  in {

    packages.${system}.default = pkgs.buildEnv {

      name = "global-packages";

      paths = with pkgs; [

        # Rustup userland
        bat
        dust
        eza
        gitui
        lsd
        mprocs
        ncspot
        porsmo
        ripgrep
        rustup
        speedtest-rs
        tealdeer
        tree-sitter
        uutils-coreutils
        wiki-tui
        yazi
        zoxide
        # zellij
        # starship

        # Neovim
        neovim
        texliveFull
        unzip
        xdg-utils
        xsel

        # Other utilities
        curl
        duckdb
        entr
        exercism
        fastfetch
        fd
        fx
        fzf
        gh
        gtypist
        lazygit
        quarto
        stow
        tmux
        ttyper

      ];

    };

  };

}
