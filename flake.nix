{

  description = "Installing Dev Tools with a Flake";

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  };

  outputs = { self, nixpkgs }: let

    system = "aarch64-darwin";

    pkgs = import nixpkgs { inherit system; };

  in {

    packages.${system}.default = pkgs.buildEnv {

      name = "dev-tooling-flake";

      paths = with pkgs; [

        # Rustup userland
        # starship

        bat
        bk
        dust
        eza
        fish
        gitui
        lsd
        mprocs
        ncspot
        presenterm
        ripgrep
        rustup
        speedtest-rs
        tealdeer
        tokei
        topiary
        tree-sitter
        uutils-coreutils
        wiki-tui
        yazi
        zellij
        zoxide

        # Neovim
        neovim
      	# texliveFull
        unzip

        # Charm
        glow
        gum
        mods

        # Other utilities
        carapace
        curl
        duckdb
        entr
        exercism
        fastfetch
        fd
        fx
        fzf
        gh
        gitingest
        gtypist
        kepubify
        lazygit
        mermaid-cli
        pandoc
        pass
        quarto
        stow
        tmux
        ttyper

      ];

    };

  };

}
