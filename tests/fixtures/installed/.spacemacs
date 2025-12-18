;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; emacs-r-devkit configuration

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-configuration-layers
   '(ess
     auto-completion
     syntax-checking
     lsp)))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-distribution 'spacemacs))
