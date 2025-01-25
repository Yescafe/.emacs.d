;; -*- lexical-binding: t -*-

(use-package evil
  :ensure t
  :init 
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  :config
  (define-key evil-insert-state-map (kbd "C-c C-c") 'evil-normal-state)
  (define-key evil-visual-state-map (kbd "C-c C-c") 'evil-normal-state)
  (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
  (evil-mode 1)
  (with-eval-after-load 'evil-maps
    (define-key evil-motion-state-map (kbd "RET") nil)))

(use-package evil-collection
  :ensure t
  :config
  (evil-collection-init))

(use-package evil-leader
  :ensure t
  :config
  (evil-leader/set-leader "SPC")
  (global-evil-leader-mode nil)

  (ignore-errors
    (evil-leader/set-key
      "fs" 'save-buffer
      "ff" 'find-file
      "fd" 'dired
      "qq" 'save-buffers-kill-terminal
      "x" 'execute-extended-command
      "hk" 'describe-key
      "hv" 'describe-variable
      "hf" 'describe-function
      "hm" 'describe-mode
      "/" 'consult-line
      "SPC" 'fzf
      "," 'switch-to-buffer
      "b" 'switch-to-buffer
      "sg" 'fzf-grep
      "gg" 'magit
      "u" 'undo-tree-visualize
      "w1" 'delete-other-windows
      "w2" 'split-window-below
      "w3" 'split-window-right
      "wd" 'delete-window
      )))

(use-package key-chord
  :ensure t
  :config
  (key-chord-mode 1)
  (key-chord-define evil-insert-state-map  "kj" 'evil-normal-state))

(provide 'init-evil)
