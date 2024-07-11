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

        zig

        nushell
        starship
        zellij
        mprocs
        bat
        uutils-coreutils
        speedtest-rs
        yazi
        ripgrep
        rustup

        neovim
        gh
        fzf
        fd
        fastfetch
        lazygit
        quarto
        curl

      ];

    };

  };

}
