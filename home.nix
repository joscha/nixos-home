{ config, pkgs, ... }:
{
    home.packages = with pkgs; [
        # ACU
        fira
        fira-code
        fira-mono
        texlive.combined.scheme-full

        # WM tools
        alacritty
        rofi

        # Fonts
        nerdfonts

        # dev tools
        (lib.hiPrio gcc)
        (lib.lowPrio clang)
        bear
        cmake
        ctags
        gdb
        gnumake
        rustup

        # i3
        i3blocks
        acpi

        # Python
        python3

        # CLI tools
        bat
        exa
        fd
        file
        fzf
        gitAndTools.tig
        htop
        iftop
        iotop
        ldns
        manpages
        ripgrep
        tree
        unzip
        xclip
        zip

        # desktop
        arandr
        chromium
        discord
        evince
        pavucontrol
        slack
        virtmanager
        wpa_supplicant_gui

        # Emacs dependencies
        ccls
        editorconfig-core-c
        shellcheck

        # Presentations tools
        screenkey
    ];

    programs.emacs.enable = true;
    programs.gpg.enable = true;

    programs.git = {
        enable = true;
        package = pkgs.gitAndTools.gitFull;
        userEmail = "guillaume.pagnoux@epita.fr";
        userName = "Guillaume Pagnoux";
    };

    programs.home-manager.enable = true;

    services.redshift = {
        enable = true;
        latitude = "48.853";
        longitude = "2.35";
        temperature.night = 3000;
    };

    home.file.".config/i3/config".source = ./configs/i3_config;
    home.file.".config/alacritty/alacritty.yml".source = ./configs/alacritty.yml;
    home.file.".local/share/rofi/themes/base16-dracula.rasi".source = ./configs/rofi_theme;
}
