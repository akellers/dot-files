;;
;; Global Settings and Key Bindings
;;

;; Use always 'y-or-n-p instead of 'yes-or-no-p
(fset 'y-or-n-p 'yes-or-no-p)

;; Directional window-selection routines
(windmove-default-keybindings 'meta)

;;
;; Package Configurations
;;
(package-initialize)

;; Package CSV
(use-package csv-mode
  :mode ("\\.[Cc][Ss][Vv]\\'" . csv-mode))

;; Package MARKDOWN
(use-package markdown-mode
  :ensure t)

;; Package GRAPHVIZ-DOT
(use-package graphviz-dot-mode
  :ensure t)

;; Package POPUP-IMENU
(use-package popup-imenu
  :bind (("M-i" . popup-imenu)))

;; Package MAGIT
(use-package magit
  :bind (([f10] . magit-status)))

;; Package DIFF-HL
(use-package diff-hl
  :hook (
	 (magit-post-refresh-hook . diff-hl-magit-post-refresh)
	 (prog-mode-hook . turn-on-diff-hl-mode)
	 (vc-dir-mode-hook . turn-on-diff-hl-mode)
	 (org-mode-hook . turn-on-diff-hl-mode)))

;; Package NEOTREE
(use-package neotree
  :bind (([f12] . neotree))
  :config
  (setq
   neo-hide-cursor t
   neo-smart-open t
   neo-theme (quote classic)
   neo-window-fixed-size nil))

;; Package PARI
(use-package pari
  :load-path "/usr/local/share/emacs/site-lisp/pari"
  :mode ("\\.gp\\'" . gp-script-mode)
  :interpreter ("gp" . gp-mode)
  :init (setq gp-language 'english))

;; Package ORG
(use-package org
  :init
  (setq
   org-adapt-indentation t
   org-list-allow-alphabetical t
   org-src-fontify-natively t
   org-startup-folded nil
   org-support-shift-select t
   org-confirm-babel-evaluate nil
   org-export-backends (quote
			(ascii html latex md odt))
   org-babel-load-languages (quote
			     ((dot . t)
			      (emacs-lisp . t)
			      (latex . t)
			      (python . t)
			      (shell . t)))
   org-latex-listings (quote minted)
   org-babel-python-command "python3.7"
   org-latex-minted-langs (quote
			   ((emacs-lisp "common-lisp")
			    (shell-script "bash")
			    (python "python")
			    (dot "dot")))
   org-latex-minted-options (quote
			     (("frame" "single")
			      ("framesep" "2mm")
			      ("breaklines" "true")
			      ("fontsize" "\\footnotesize")))
   org-latex-packages-alist (quote
			     (("" "minted" t)
			      ("" "tikz" t)))
   org-latex-pdf-process (quote
			  ("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f" "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f" "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(wombat))
 '(default-frame-alist '((width . 175) (height . 55) (alpha . 95)))
 '(ediff-split-window-function 'split-window-horizontally)
 '(fringe-mode '(nil . 0) nil (fringe))
 '(global-auto-revert-mode t)
 '(global-hi-lock-mode t)
 '(indicate-empty-lines t)
 '(inhibit-startup-screen t)
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("org" . "https://orgmode.org/elpa/")
     ("melpa-stable" . "https://stable.melpa.org/packages/")))
 '(package-selected-packages
   '(csv-mode flycheck markdown-mode graphviz-dot-mode minimap expand-region use-package diff-hl magit neotree))
 '(python-shell-interpreter "python3")
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(use-dialog-box nil)
 '(use-file-dialog nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#242424" :foreground "#f6f3e8" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :foundry "outline" :family "Consolas"))))
 '(cursor ((t (:background "red"))))
 '(font-lock-doc-face ((t (:inherit font-lock-string-face :foreground "gray")))))
