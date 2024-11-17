{

  description = "Global packages for R, Zig, and Neovim";



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
        zig
        uv
        pixi
        pipx

        # Rustup userland
        bat
        dust
        eza
        gitui
        mprocs
        porsmo
        ripgrep
        rustup
        speedtest-rs
        starship
        uutils-coreutils
        wiki-tui
        yazi
        zellij

        # Other utilities
        # neovim
        entr
        tmux
        curl
        fastfetch
        fd
        fzf
        gh
        lazygit
        quarto

      ];

    };

  };

}
