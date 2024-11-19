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
	nodejs_22
        pipx
        pixi
        zig
	#uv

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
        sqlfluff
        texliveFull
        unzip
        vale
        wl-clipboard
        xdg-utils
        xsel


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
