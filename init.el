;; -*- lexical-binding: t -*-
(setq gc-cons-threshold (* 300 1024 1024))
(setq read-process-output-max (* 1024 1024))

(setq mac-option-modifier 'meta
      mac-command-modifier 'super)

(setq make-backup-files nil)
(setq auto-save-default nil)

(global-auto-revert-mode 1)

(global-display-line-numbers-mode)

(tool-bar-mode -1)

(scroll-bar-mode -1)

;; (icomplete-mode 1)

(setq visible-bell t)
(setq ring-bell-function 'ignore)

(setq inhibit-startup-screen t)

(delete-selection-mode 1)

(show-paren-mode t)

(global-hl-line-mode 1)

(fset 'yes-or-no-p 'y-or-n-p)

(add-to-list 'load-path "~/.emacs.d/lisp/")

(when (string= system-type "darwin")
  (setq dired-use-ls-dired t
        insert-directory-program "/usr/local/bin/gls"
        dired-listing-switches "-aBhl --group-directories-first"))

(require 'init-packages)

(use-package saveplace
  :ensure t
  :hook (after-init . save-place-mode))

(use-package vertico
  :ensure t
  :config
  (vertico-mode t))

(use-package orderless
  :ensure t
  :init
  (setq completion-styles '(orderless)))

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode t))

(use-package consult
  :ensure t
  :config
  (global-set-key (kbd "C-s") 'consult-line))

(use-package company
  :ensure t
  :bind (:map company-active-map
              ("C-n" . 'company-select-next)
              ("C-p" . 'company-select-previous))
  :init
  (global-company-mode t)
  :config
  (setq company-minimum-prefix-length 2)
  (setq company-idle-delay 1))

(use-package fzf
  :ensure t
  :bind
    ;; Don't forget to set keybinds!
  :config
  (setq fzf/args "-x --color bw --print-query --margin=1,0 --no-hscroll"
        fzf/executable "fzf"
        fzf/git-grep-args "-i --line-number %s"
        ;; command used for `fzf-grep-*` functions
        ;; example usage for ripgrep:
        ;; fzf/grep-command "rg --no-heading -nH"
        fzf/grep-command "grep -nrH"
        ;; If nil, the fzf buffer will appear at the top of the window
        fzf/position-bottom t
        fzf/window-height 15))

(use-package restart-emacs
  :ensure t)

(use-package keycast
  :ensure t
  :config
  (add-to-list 'global-mode-string '("" keycast-mode-line))
  (keycast-mode-line-mode t))

(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode t))

(use-package magit
  :ensure t)

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(require 'init-evil)

(use-package undo-tree
  :ensure t
  :diminish
  :init
  (global-undo-tree-mode 1)
  (setq undo-tree-auto-save-history nil)
  (evil-set-undo-system 'undo-tree))

(use-package rust-mode
  :ensure t)

(require 'init-lsp)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes '(leuven-dark))
 '(display-battery-mode t)
 '(display-line-numbers-type 'relative)
 '(global-display-line-numbers-mode t)
 '(package-selected-packages
   '(evil-leader fzf lsp-mode undo-tree magit restart-emacs orderless vertico company))
 '(size-indication-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Maple Mono SC NF" :foundry "nil" :slant normal :weight regular :height 120 :width normal)))))
