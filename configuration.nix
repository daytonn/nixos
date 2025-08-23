{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;

  networking.hostName = "Circuitron";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Phoenix";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver.enable = true;

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.printing.enable = true;

  services.pcscd.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  security.sudo.extraConfig = ''
    Defaults pwfeedback
  '';
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.flatpak.enable = true;

  users.users.daytonn = {
    isNormalUser = true;
    description = "Dayton Nolan";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      albert
      asdf-vm
      bash-completion
      bat
      blender
      brave
      code-cursor-fhs
      dbeaver-bin
      eza
      flameshot
      freecad
      fzf
      gimp3-with-plugins
      git
      gnome-extension-manager
      gnomeExtensions.gtile
      gnomeExtensions.auto-move-windows
      gnomeExtensions.burn-my-windows
      gnomeExtensions.compiz-windows-effect
      gnomeExtensions.force-quit
      gnomeExtensions.notification-banner-reloaded
      gnomeExtensions.reboottouefi
      gnomeExtensions.status-area-horizontal-spacing
      gnomeExtensions.emoji-copy
      gnomeExtensions.weather-oclock
      gnomeExtensions.weeks-start-on-monday-again
      gnomeExtensions.user-themes
      gnome-tweaks
      inkscape-with-extensions
      joplin
      jq
      libreoffice-still
      lmstudio
      mcfly
      neofetch
      openssh
      pcsclite
      pinentry-gnome3
      pinentry-curses
      proton-pass
      protonmail-desktop
      protonvpn-gui
      rhythmbox
      spotify
      stacer
      starship
      steam
      sublime4
      telegram-desktop
      terminator
      thefuck
      usbimager
      yubioath-flutter
      upscayl
      vlc
      xclip
      xdg-utils
      zeal
      zoom-us
    ];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];

  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
                "openssl-1.1.1w"
              ];

  nix.settings.experimental-features = [ "flakes" "nix-command" ];

  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
  ];

  programs.gnupg.agent = {
   enable = true;
   enableSSHSupport = true;
   pinentryPackage = pkgs.pinentry-gnome3;
};
  system.stateVersion = "25.05"; # Did you read the comment?
}
