 (require 'package)
 (setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
 			 ("melpa" . "https://melpa.org/packages/")
 			 ("ublt" . "https://elpa.ubolonton.org/packages/")
 			 ("org" . "https://orgmode.org/elpa/")))

 (package-initialize)
 (unless (package-installed-p 'use-package)
   (package-refresh-contents)
   (package-install 'use-package))

(load-file "/home/valeera/.emacs.d/plugin/discord-emacs.el")
(discord-emacs-run "384815451978334208")

(require 'use-package)
 (setq use-package-compute-statistics t)
(setq use-package-always-ensure t)

(setq make-backup-files nil)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(blink-cursor-mode -1)

(use-package flycheck
  :hook (lsp-deferred . flycheck-mode))

(use-package yasnippet
   :config
   (yas-global-mode))

(use-package yasnippet-snippets)

(use-package which-key
  :ensure t
  :init
  (setq which-key-separator " ")
  (setq which-key-prefix-prefix "+")
  :config
  (which-key-mode))



(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-horizon t))

(set-face-attribute 'default nil
                    :family "MesloLGM Nerd Font"
                    :height 120
                    :weight 'normal
                    :width 'normal)

(use-package neotree
  :ensure t
  :init
  (global-set-key [f8] 'neotree-toggle)
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))

(use-package all-the-icons)

(use-package display-line-numbers
  :ensure nil
  :hook
  ((prog-mode yaml-mode systemd-mode) . display-line-numbers-mode))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  (setq doom-modeline-height 30))

(use-package centaur-tabs
  :ensure t
  :config
  (setq centaur-tabs-set-bar 'zigzag
	centaur-tabs-set-icons t
	centaur-tabs-gray-out-icons 'buffer
	centaur-tabs-height 40
	centaur-tabs-set-modified-marker t
        centaur-tabs-set-bar 'under
        x-underline-at-descent-line t
	centaur-tabs-modified-marker "*")
  (centaur-tabs-mode t))

(use-package dashboard
  :ensure t
  :config
  (setq dashboard-banner-logo-title "Bienvenido al Emacs de Valeera"
	dashboard-startup-banner "/home/valeera/.emacs.d/dashboardbanner/dashboardemacs.png")
        dashboard-center-content t
        dashboard-items '((recents  . 5)
                        (bookmarks . 5)
                        (projects . 5)
                        (agenda . 5)
                        (registers . 5)))		
  (dashboard-setup-startup-hook)

(show-paren-mode)
(electric-pair-mode)

(use-package lsp-mode
  :defer t
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config)

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-position 'bottom))

(add-hook 'after-init-hook 'global-company-mode)
(use-package company
  :after lsp-mode
  :config
  (company-tng-mode 0)
  :custom (company-minimum-prefix-length 2)
  :bind (:map company-active-map
	      ("<tab>" . company-complete-selection))
	(:map lsp-mode-map
	      ("<tab>" . company-indent-or-complete-common)))







(use-package python-mode
   :ensure t
   :defer t
   :hook (python-mode . lsp-deferred)
   :custom
   (python-shell-interpreter "python3"))

(use-package rustic
  :mode ("\\.rs\\'" . rustic-mode)
  :hook (rustic-mode . lsp-deferred))

(use-package haskell-mode)
(use-package lsp-haskell)
(require 'lsp-haskell)
(add-hook 'haskell-mode-hook 'lsp)
(add-hook 'haskell-literate-mode-hook 'lsp)
 

