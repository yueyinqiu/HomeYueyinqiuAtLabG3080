{ lib, pkgs, ... }: {
  programs.bash.enable = true;

  programs.bash.initExtra = lib.mkBefore ''
    . /etc/bash.bashrc
  '';

  home.packages = [
    (pkgs.writeShellApplication {
      name = "my-bash-escape-std";
      text = ''
        input=$(cat)
        printf "%s" "''${input@Q}"
      '';
    })
  ];

  imports = [
    ./cheats
  ];
}
