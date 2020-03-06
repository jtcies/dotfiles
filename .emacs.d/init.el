;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(setq package-enable-at-startup nil)

;; packages -----------------------------------------

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; evil mode
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

;; ess
(require 'ess)
(load "ess-autoloads")

;; styling ----------------------------------------------
;; load theme
(load-theme 'dracula t)

;; font
(set-frame-font "Inconsolata for Powerline Medium" nil t)
(set-face-attribute 'default nil :height 110)

;; remove toolbar
(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)

(setq-default display-line-numbers 'relative)

;; other settings -------------

;; don't create lock files
(setq create-lockfiles nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages (quote (ess dracula-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
