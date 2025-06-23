{

  description = "Installing Dev Tools with Nix";

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
        delta
        dust
        eza
        gitui
        lsd
        mprocs
        ncspot
        presenterm
        porsmo
        ripgrep
        rustup
        speedtest-rs
        tealdeer
        tokei
        tree-sitter
        uutils-coreutils
        wiki-tui
        yazi
        # zoxide
        # zellij
        # starship

        # Neovim
        neovim
        texliveFull
        # unzip
        xdg-utils
        xsel

        # Other utilities
        curl
        carapace
        duckdb
        entr
        exercism
        fastfetch
        fd
        fx
        # fzf
        git-credential-manager
        gitingest
        gitleaks
        gh
        glow
        gtypist
        lazygit
        mermaid-cli
        # mods switching to my fork for testing
        pandoc
        quarto
        slides
        stow
        tmux
        ttyper
        typer

      ];

    };

  };

}
