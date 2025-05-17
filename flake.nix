{

  description = "Installing Global Tools with Nix";

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  };

  outputs = { self, nixpkgs }: let

    system = "aarch64-darwin";

    pkgs = import nixpkgs { inherit system; };

  in {

    packages.${system}.default = pkgs.buildEnv {

      name = "global-packages";

      paths = with pkgs; [

        # Rustup userland
        # starship
        bat
        dust
        eza
        gitui
        lsd
        mprocs
        ncspot
        # porsmo
        ripgrep
        rustup
        speedtest-rs
        tree-sitter
        uutils-coreutils
        wiki-tui
        yazi
        zellij
        zoxide

        # Neovim
        neovim
        texliveFull
        unzip

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
        tealdeer
        tmux
        ttyper

      ];

    };

  };

}
