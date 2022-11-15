#!/usr/bin/env bash

fonts=(
    3270-nerd-font
    fira-mono-nerd-font
    inconsolata-go-nerd-font
    inconsolata-lgc-nerd-font
    inconsolata-nerd-font
    monofur-nerd-font
    overpass-nerd-font
    ubuntu-mono-nerd-font
    agave-nerd-font
    arimo-nerd-font
    anonymice-nerd-font
    aurulent-sans-mono-nerd-font
    bigblue-terminal-nerd-font
    bitstream-vera-sans-mono-nerd-font
    blex-mono-nerd-font
    caskaydia-cove-nerd-font
    code-new-roman-nerd-font
    cousine-nerd-font
    daddy-time-mono-nerd-font
    dejavu-sans-mono-nerd-font
    droid-sans-mono-nerd-font
    fantasque-sans-mono-nerd-font
    fira-code-nerd-font
    go-mono-nerd-font
    gohufont-nerd-font
    hack-nerd-font
    hasklug-nerd-font
    heavy-data-nerd-font
    hurmit-nerd-font
    im-writing-nerd-font
    iosevka-nerd-font
    jetbrains-mono-nerd-font
    lekton-nerd-font
    liberation-nerd-font
    meslo-lg-nerd-font
    monoid-nerd-font
    mononoki-nerd-font
    mplus-nerd-font
    noto-nerd-font
    open-dyslexic-nerd-font
    profont-nerd-font
    proggy-clean-tt-nerd-font
    roboto-mono-nerd-font
    sauce-code-pro-nerd-font
    shure-tech-mono-nerd-font
    space-mono-nerd-font
    terminess-ttf-nerd-font
    tinos-nerd-font
    ubuntu-nerd-font
    victor-mono-nerd-font)

brew tap homebrew/cask-fonts
for font in ${fonts[@]}; do
    brew install --cask font-${font}
done