;; -*- lexical-binding: t -*-

(require 'package)
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)
(unless package-archive-contents
  (message "=== refreshing package cache...")
  (package-refresh-contents))

(when (not (package-installed-p 'use-package))
  (package-install 'use-package))

(provide 'init-packages)
