;;; package --- Main init file
;;; Commentary:
;;; Emacs init file.  Made by Andres Cornejo.

;;; Code:

;; Fonts and Font Size.
(add-to-list 'default-frame-alist '(font . "Fira Code Retina 14" ))
(set-face-attribute 'default t :font "Fira Code Retina")

;; Always follow symbolic links.
(setq vc-follow-symlinks t)

;; Change cursor to bar.
(setq-default cursor-type 'bar)

;; Stop startup message.
(setq inhibit-startup-message t)

;; Remove the toolbar from the UI.
(tool-bar-mode -1)

;; Set flex matching and interactive do.
(setq indo-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; Package manager and package list (Melpa).
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
  ;; and `package-pinned-packages`. Most users will not need or want to do this.
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  )
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Installed packages
(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(defalias 'list-buffers 'ibuffer-other-window)
;; (defalias 'list-buffers 'ibuffer)

;; (use-package arjen-grey-theme
;;   :ensure t
;;   :init
;;   (progn
;;     (load-theme 'arjen-grey t)
;;     (enable-theme 'arjen-grey)
;;     ))

(use-package spacegray-theme
  :ensure t
  :init
  (progn
    (load-theme 'spacegray t)
    ))

(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))

(use-package linum-relative
  :ensure t
  :config (linum-relative-mode)
  (global-linum-mode))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package yaml-mode
  :ensure t
  :mode ("\\.yml\\'" . yaml-mode)
  :interpreter ("yaml" . yaml-mode))

;; Custom set variables, do not modify this block of code.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8d805143f2c71cfad5207155234089729bb742a1cb67b7f60357fdd952044315" "aad7fd3672aad03901bf91e338cd530b87efc2162697a6bef79d7f8281fd97e3" "8530b2f7b281ea6f263be265dd8c75b502ecd7a30b9a0f28fa9398739e833a35" "a455366c5cdacebd8adaa99d50e37430b0170326e7640a688e9d9ad406e2edfd" default)))
 '(package-selected-packages
   (quote
    (spacemacs-theme spacegray-theme arjen-grey-theme arjen-grey flycheck cyberpunk-theme yaml-mode linum-relative org-bullets auto-complete which-key try use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide '.emacs)
;;; .emacs ends here
