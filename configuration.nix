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
  services.xserver.desktopManager.gnome = {
    extraGSettingsOverrides = ''
      [org.gnome.desktop.peripherals.keyboard]
      delay=250
      repeat-interval=15

      [org.gnome.desktop.peripherals.mouse]
      natural-scroll=true

      [org.gnome.shell.keybindings]
      screenshot=['<Shift><Alt>3']
      show-screenshot-ui=['<Shift><Alt>4']
      screenshot-window=['<Shift><Alt>5']
      show-screen-recording-ui=[]

      [org.gnome.desktop.interface]
      accent-color='teal'
      clock-format='12h'
      clock-show-weekday=true
      color-scheme='prefer-dark'

      [org.gnome.desktop.calendar]
      show-weekdate=true
    '';

    extraGSettingsOverridePackages = [
      pkgs.gsettings-desktop-schemas # for org.gnome.desktop
    ];
  };

  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    open = true;  # Use open-source kernel modules (recommended for RTX/GTX 16xx)
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.gnome.core-developer-tools.enable = true;

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

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
  };

  users.users.daytonn = {
    isNormalUser = true;
    description = "Dayton Nolan";
    extraGroups = [ "networkmanager" "wheel" "docker"];
    packages = with pkgs; [
      arc-theme
      materia-theme
      orchis-theme
      colloid-gtk-theme
      nordic
      whitesur-gtk-theme
      
      catppuccin-gtk
      
      palenight-theme
      
      numix-gtk-theme
      gnome-themes-extra


      papirus-icon-theme
      tela-icon-theme
      fluent-icon-theme
      numix-icon-theme
      moka-icon-theme
      
      adwaita-icon-theme
      pantheon.elementary-icon-theme
      
      bibata-cursors
      numix-cursor-theme
      capitaine-cursors
      catppuccin-cursors
      vanilla-dmz 

      albert
      autoconf
      automake
      bash-completion
      bat
      bison
      blender
      brave
      bzip2
      code-cursor-fhs
      dbeaver-bin
      dconf-editor
      docker
      eza
      flameshot
      freecad
      fzf
      gcc
      gimp3-with-plugins
      git
      gnome-extension-manager
      gnome-tweaks
      gnomeExtensions.auto-move-windows
      gnomeExtensions.burn-my-windows
      gnomeExtensions.compiz-windows-effect
      gnomeExtensions.docker
      gnomeExtensions.emoji-copy
      gnomeExtensions.force-quit
      gnomeExtensions.gtile
      gnomeExtensions.notification-banner-reloaded
      gnomeExtensions.reboottouefi
      gnomeExtensions.status-area-horizontal-spacing
      gnomeExtensions.user-themes
      gnomeExtensions.weather-oclock
      gnomeExtensions.weeks-start-on-monday-again
      gnumake
      inkscape-with-extensions
      joplin
      jq
      libiconv
      libreoffice-still
      libtool
      lmstudio
      makeWrapper
      mcfly
      neofetch
      openssh
      pcsclite
      pinentry-curses
      pinentry-gnome3
      pkg-config
      proton-pass
      protonmail-desktop
      protonvpn-gui
      refine
      rhythmbox
      spotify
      stacer
      starship
      steam
      sublime4
      telegram-desktop
      terminator
      texlivePackages.rpgicons
      thefuck
      unzip
      upscayl
      usbimager
      vlc
      xclip
      xdg-utils
      yubioath-flutter
      zeal
      zoom-us
    ];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    inter
    roboto 
  ];

  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
                "openssl-1.1.1w"
              ];

  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  nix.settings.experimental-features = [ "flakes" "nix-command" ];

  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  programs.gnupg.agent = {
   enable = true;
   enableSSHSupport = true;
   pinentryPackage = pkgs.pinentry-gnome3;
};
  system.stateVersion = "25.05"; # Did you read the comment?
}
