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
      [org.gnome.shell]
      enabled-extensions=['auto-move-windows@gnome-shell-extensions.gcampax.github.com', 'burn-my-windows@schneegans.github.com', 'compiz-windows-effect@hermes83.github.com', 'emoji-copy@felipeftn', 'fq@megh', 'gTile@vibou', 'notification-banner-reloaded@marcinjakubowski.github.com', 'reboottouefi@ubaygd.com', 'status-area-horizontal-spacing@mathematical.coffee.gmail.com', 'user-theme@gnome-shell-extensions.gcampax.github.com', 'weatheroclock@CleoMenezesJr.github.io', 'weeks-start-on-monday@extensions.gnome-shell.fifi.org', 'status-icons@gnome-shell-extensions.gcampax.github.com', 'docker@stickman_0x00.com']

      [org.gnome.desktop.peripherals.keyboard]
      delay=250
      repeat-interval=15

      [org.gnome.desktop.peripherals.mouse]
      natural-scroll=true

      [org.gnome.shell.keybindings]
      focus-active-notification=[]
      open-new-window-application-1=[]
      open-new-window-application-2=[]
      open-new-window-application-3=[]
      open-new-window-application-4=[]
      open-new-window-application-5=[]
      open-new-window-application-6=[]
      open-new-window-application-7=[]
      open-new-window-application-8=[]
      open-new-window-application-9=[]
      screenshot=['<Shift><Alt>3']
      show-screenshot-ui=['<Shift><Alt>4']
      screenshot-window=['<Shift><Alt>5']
      show-screen-recording-ui=[]
      shift-overview-down=[]
      shift-overview-up=[]
      switch-to-application-1=[]
      switch-to-application-2=[]
      switch-to-application-3=[]
      switch-to-application-4=[]
      switch-to-application-5=[]
      switch-to-application-6=[]
      switch-to-application-7=[]
      switch-to-application-8=[]
      switch-to-application-9=[]
      toggle-application-view=[]
      toggle-message-tray=[]
      toggle-quick-settings=[]

      [org.gnome.desktop.interface]
      accent-color='teal'
      clock-format='12h'
      clock-show-weekday=true
      color-scheme='prefer-dark'
      cursor-theme='Adwaita'
      font-antialiasing='grayscale'
      font-hinting='slight'
      gtk-theme='Adwaita'
      icon-theme='Tela-manjaro-light'

      [org.gnome.desktop.wm.preferences]
      action-double-click-titlebar='toggle-maximize'
      action-middle-click-titlebar='none'
      action-right-click-titlebar='menu'
      button-layout='close:appmenu'
      focus-mode='click'

      [org.gnome.desktop.calendar]
      show-weekdate=true

      [org.gnome.desktop.wm.keybindings]
      begin-move=[]
      begin-resize=[]
      close=['<Alt>q']
      cycle-group-backward=[]
      cycle-group=[]
      maximize=[]
      minimize=['<Alt>h']
      move-to-monitor-down=[]
      move-to-monitor-left=[]
      move-to-monitor-right=[]
      move-to-monitor-up=[]
      move-to-workspace-1=[]
      move-to-workspace-last=[]
      move-to-workspace-left=[]
      move-to-workspace-right=[]
      switch-input-source-backward=[]
      switch-input-source=[]
      switch-panels-backward=[]
      switch-panels=[]
      switch-to-workspace-1=[]
      switch-to-workspace-last=[]
      switch-to-workspace-left=[]
      switch-to-workspace-right=[]
      unmaximize=[]

      [org.gnome.desktop.input-sources]
      xkb-options=['caps:ctrl_modifier']
    '';

    extraGSettingsOverridePackages = [
      pkgs.gsettings-desktop-schemas # for org.gnome.desktop
    ];
  };

  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    open = true;  # Use open-source kernel modules (recommended for RTX/GTX 16xx)
  };
  hardware.graphics.enable = true;
  hardware.graphics.extraPackages = [
    pkgs.mesa
  ];

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
    adwaita-icon-theme
    albert
    arc-theme
    bash-completion
    bat
    blender
    brave
    code-cursor-fhs
    dbeaver-bin
    dconf-editor
    discord
    docker
    eza
    firefox-devedition
    flameshot
    fluent-icon-theme
    freecad
    fzf
    gimp3-with-plugins
    gnome-decoder
    gnome-extension-manager
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
    gnome-themes-extra
    gnome-tweaks
    impression
    inkscape-with-extensions
    joplin
    jq
    kooha
    libreoffice-still
    lmstudio
    mcfly
    neofetch
    pcsclite
    pinentry-curses
    pinentry-gnome3
    protonmail-desktop
    proton-pass
    protonvpn-gui
    refine
    rhythmbox
    shellcheck
    spotify
    stacer
    starship
    steam
    sublime4
    tela-icon-theme
    telegram-desktop
    terminator
    thefuck
    ungoogled-chromium
    upscayl
    usbimager
    virtualbox
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

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
    autoconf
    automake
    bison
    bzip2
    gcc
    git
    gnumake
    inotify-tools
    libiconv
    libtool
    makeWrapper
    openssh
    pkg-config
    unzip
    vim
    wget
  ];

  environment.gnome.excludePackages = with pkgs; [
    epiphany
    gedit
    totem
    yelp
    geary
    seahorse
    gnome-contacts
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
