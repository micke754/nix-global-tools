{

  description = "Installing Global Tools with Nix";



  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
#    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";# Current stable relese

  };



  outputs = { self, nixpkgs }: let

    system = "x86_64-linux";

    pkgs = import nixpkgs { inherit system; };

  in {

    packages.${system}.default = pkgs.buildEnv {

      name = "global-packages";

      paths = with pkgs; [

        # languages
        nushell
        pipx
        zig
        uv

        # Rustup userland
        #starship
        bat
        dust
        eza
        gitui
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
        helix-gpt
        ansible-language-server
        harper
        helix-gpt
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

      ];

    };

  };

}
