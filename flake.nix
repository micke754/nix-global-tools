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

        # languages
        # nushell
        carapace
        pipx
      	bun
        nil

        # Rustup userland
        # starship
        bat
        dust
        eza
        gitui
        lsd
        mprocs
        porsmo
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
        sqlfluff
        texliveFull
        unzip
        xdg-utils
        xsel

        # helix stuff
        # helix
        ansible-language-server
        # helix-gpt
        markdown-oxide
        prettierd
        sqls
        taplo
        vale-ls
        vale
        yaml-language-server

        # Other utilities
        curl
        duckdb
        entr
        fastfetch
        fd
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
