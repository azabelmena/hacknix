{

  description = "Nix Flakes for Hacking";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
};

outputs = { self, nixpkgs }:
let
  system = "x86_64-linux";

  pkgs = nixpkgs.legacyPackages.${system};
in
  {

    devShells.${system} = {
      hacknix = pkgs.mkShell{
        name = "HackNix";

        nativeBuildInputs = [
          pkgs.exploitdb
          pkgs.foremost
          pkgs.gobuster
          pkgs.go-exploitdb
          pkgs.hashcat
          pkgs.hashcat-utils
          pkgs.john
          pkgs.nmap
          pkgs.proxychains
          pkgs.rustscan
          pkgs.testdisk
          pkgs.tor
          pkgs.tor-browser
          pkgs.tshark
          pkgs.wipe
          pkgs.wireshark
        ];

        NIX_CFLAGS_COMPILE = ''
          -O3
          -g
        '';
      };
    };
  };
}
