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

        nativeBuildInputs = with pkgs; [
          exploitdb
          foremost
          gdb
          go-exploitdb
          gobuster
          hashcat
          hashcat-utils
          john
          nmap
          proxychains
          pwndbg
          rustscan
          testdisk
          tor
          tor-browser
          tshark
          wipe
          wireshark
        ];

        NIX_CFLAGS_COMPILE = ''
          -O3
          -g
        '';
      };
    };
  };
}
