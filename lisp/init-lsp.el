;; -*- lexical-binding: t -*-

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "s-l")
  :hook
  ((elisp-mode . lsp-deferred)
   (c-mode . lsp-deferred)
   (c++-mode . lsp-deferred)
   (rust-mode . lsp-deferred)
   (lsp-mode . lsp-enable-which-key-integration)
   )
  :config
  (lsp-inlay-hints-mode)
  (setq lsp-inlay-hint-enable t)
  )

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package consult-lsp
  :ensure t)

(use-package flycheck
  :ensure t)

(use-package flycheck-posframe
  :ensure t
  :after flycheck
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-posframe-mode)
  (flycheck-posframe-configure-pretty-defaults)
  )

(provide 'init-lsp)
