(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("nongnu" . "https://elpa.nongnu.org/nongnu/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; The theme I use
;;(use-package poet-theme
;;  :config (load-theme 'poet-dark t))
;;(use-package moe-theme
;; :ensure t
;; :config (load-theme 'moe-dark t))
;; (use-package almost-mono-themes
;;   :ensure t
;;   :config (load-theme 'almost-mono-black t))
;; Languages
(use-package zenburn-theme
  :ensure t
  :config
  (load-theme 'zenburn t))
(use-package markdown-mode
  :ensure t)
(use-package json-mode
  :ensure t)
(use-package sly
  :ensure t
  :init (setq inferior-lisp-program "rlwrap sbcl"))
(use-package forth-mode
  :ensure t)
(use-package cmake-mode
  :ensure t)
(use-package web-mode
  :mode "\\.php\\'"
  :config
  (setq web-mode-enable-auto-indentation t))
;; Development tools
(use-package magit
  :ensure t)
(use-package company
  :ensure t
  :config (global-company-mode t))
(use-package company-c-headers
  :ensure t
  :after company
  :config
  (add-to-list 'company-backends 'company-c-headers))
(use-package format-all
  :ensure t
  :hook (c++-mode . format-all-mode))
(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode))
(setq c-default-style "linux"
      c-basic-offset 4)

(scroll-bar-mode 0)
(tool-bar-mode 0)
(show-paren-mode 1)
(electric-pair-mode 1)

(setq-default tab-width 4
              truncate-lines t
              fill-column 72
              indent-tabs-mode nil)

(setq show-paren-style 'parenthesis
      global-hl-line-sticky-flag t
      display-line-numbers-type 'relative
      electric-indent-mode nil
      make-backup-files nil
      history-length 2000
      whitespace-line-column 72)

(global-display-line-numbers-mode t)
(global-hl-line-mode 1)
(load "~/.quicklisp/clhs-use-local.el" 'noerror)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'mail-send-hook 'kotorifan/check-empty)
(add-hook 'after-init-hook 'ruler-mode)
(setq gc-cons-threshold (* 50 1024 1024))

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 2 1024 1024))))

(keymap-global-set "M-$" #'jinx-correct)
(keymap-global-set "C-M-$" #'jinx-languages)
 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-line-numbers-type 'relative)
 '(global-display-line-numbers-mode t)
 '(package-selected-packages
   '(zenburn zenburn-theme web-mode php-mode company-box m68k-mode forth-mode almost-mono-themes nasm-mode ## sly moe-theme markdown-mode magit json-mode format-all company-c-headers cmake-mode))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "CozetteVector" :foundry "KBnP" :slant normal :weight medium :height 180 :width normal)))))
