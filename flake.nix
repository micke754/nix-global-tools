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
        # starship
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
        tree-sitter
        uutils-coreutils
        wiki-tui
        yazi
        # zellij
        zoxide

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
        fastfetch
        fd
        fx
        fzf
        gh
        lazygit
        quarto
        tmux
        tldr
        tt
        ttyper
        gtypist

      ];

    };

  };

}
