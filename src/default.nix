{ ... }: {
  home.username = "root";
  home.homeDirectory = "/root";

  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;

  imports = [ ./packages ];

  home.stateVersion = "26.05";
}
