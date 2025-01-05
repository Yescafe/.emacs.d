;; -*- lexical-binding: t -*-
(setq mac-option-modifier 'meta
      mac-command-modifier 'super)

(global-display-line-numbers-mode)

(tool-bar-mode -1)

(scroll-bar-mode -1)

(icomplete-mode 1)

(setq visible-bell t)
(setq ring-bell-function 'ignore)

(global-company-mode 1)

(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)

(setq inhibit-startup-screen t)

(require 'package)
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)
(unless package-archive-contents
  (message "=== refreshing package cache...")
  (package-refresh-contents))

(when (not (package-installed-p 'use-package))
  (package-install 'use-package))

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

(use-package fzf
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

(use-package evil
  :ensure t
  :init 
  (setq evil-want-C-u-scroll t)
  :config
  (define-key evil-insert-state-map (kbd "C-c C-c") 'evil-normal-state)
  (define-key evil-visual-state-map (kbd "C-c C-c") 'evil-normal-state)
  (evil-mode 1))

(use-package evil-leader
  :config
  (evil-leader/set-leader "SPC")
  (global-evil-leader-mode nil)

  (ignore-errors
    (evil-leader/set-key
      "fs" 'save-buffer
      "fd" 'dired
      "qq" 'save-buffers-kill-terminal
      "x" 'execute-extended-command
      "hk" 'describe-key
      "hv" 'describe-variable
      "hf" 'describe-function
      "/" 'consult-line
      "SPC" 'fzf
      "," 'switch-to-buffer
      "sg" 'fzf-grep
      )))

(use-package key-chord
  :ensure t
  :config
  (key-chord-mode 1)
  (key-chord-define evil-insert-state-map  "kj" 'evil-normal-state))

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
 '(package-selected-packages '(orderless vertico company))
 '(size-indication-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Maple Mono SC NF" :foundry "nil" :slant normal :weight regular :height 120 :width normal)))))
