{ pkgs, ... }:
{
  # Emacs with doomemacs configuration
  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
    extraPackages = epkgs: with epkgs; [
      evil
      magit
      doom-modeline
      which-key
      vertico
      orderless
      consult
      embark
      projectile
      treemacs
      lsp-mode
      company
      flycheck
      nix-mode
      markdown-mode
      org
      org-roam
    ];
  };

  # Doomemacs configuration
  home.file.".doom.d/init.el".text = ''
    ;;; init.el -*- lexical-binding: t; -*-
    
    (doom! :input
           :completion
           (vertico +icons)
           :ui
           doom
           doom-dashboard
           doom-modeline
           hl-todo
           (treemacs +lsp)
           :editor
           (evil +everywhere)
           file-templates
           fold
           format
           :emacs
           dired
           electric
           :term
           :checkers
           syntax
           :tools
           lsp
           magit
           :lang
           data
           emacs-lisp
           markdown
           nix
           org
           (python +lsp)
           (sh +lsp)
           :config
           (default +bindings +smartparens))
  '';

  # Install script
  home.file.".local/bin/doom-install".text = ''
    #!/bin/sh
    git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
    ~/.emacs.d/bin/doom install
  '';
}