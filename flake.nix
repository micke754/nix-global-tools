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
        #uv
        npm
        pipx
        pixi
        zig

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

        # Neovim
        neovim
        texliveFull
        wl-clipboard
        xdg-utils
        sqlfluff
        python312Packages.sqlfmt
        vale


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

      ];

    };

  };

}
