;;; init.el --- EMACS customizations
;;; Commentary:
;;;

;;; Code:

;; Set keybindings for ‘windmove’ to Meta (Alt-Key)
(windmove-default-keybindings 'meta)

;; Use y-or-n instead of yes-or-no
(fset 'yes-or-no-p 'y-or-n-p)

;; Manually adapt `load-path'.
;;
;; Package management doesn't work due to proxy restrictions.
;; Download packages manuelly and add it to `load-path'.
;;
;; Final installation requires the following steps:
;; * install package using `package-install-file'.
;; * optionally byte-compile Emacs lisp files (*.el)
;;
(eval-when-compile
  (add-to-list 'load-path "~/.emacs.d/elpa/use-package-2.4.4")
  (add-to-list 'load-path "~/.emacs.d/elpa/bind-key-2.4.4")
  (add-to-list 'load-path "~/.emacs.d/elpa/markdown-mode-2.5")
  (add-to-list 'load-path "~/.emacs.d/elpa/flycheck-32")
  (add-to-list 'load-path "~/.emacs.d/elpa/dash-2.19.1")
  (add-to-list 'load-path "~/.emacs.d/elpa/pkg-info-0.6")
  (add-to-list 'load-path "~/.emacs.d/elpa/epl-0.9")
  (add-to-list 'load-path "~/.emacs.d/elpa/magit-3.3.0")
  (add-to-list 'load-path "~/.emacs.d/elpa/git-commit-3.3.0")
  (add-to-list 'load-path "~/.emacs.d/elpa/transient-0.3.7")
  (add-to-list 'load-path "~/.emacs.d/elpa/with-editor-3.2.0")
  (add-to-list 'load-path "~/.emacs.d/elpa/magit-section-3.3.0")
  (add-to-list 'load-path "~/.emacs.d/elpa/graphviz-dot-mode-0.4.2")
  (add-to-list 'load-path "~/.emacs.d/elpa/company-0.9.13")
  (add-to-list 'load-path "~/.emacs.d/elpa/minimap-1.3")
  (add-to-list 'load-path "~/.emacs.d/elpa/htmlize-1.56")
  (add-to-list 'load-path "~/.emacs.d/elpa/diff-hl-1.8.8")
  (add-to-list 'load-path "~/.emacs.d/elpa/pariemacs-3.20")
  (add-to-list 'load-path "~/.emacs.d/elpa/csv-mode-1.17")
  ;; Added by package
  (package-initialize)
  (require 'use-package))

;; Use package `csv-mode'
(use-package csv-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.[Cc][Ss][Vv]\\'" . csv-mode))
  (autoload 'csv-mode "csv-mode"
    "Major mode for editing comma-separated value files." t))

;; Use package `pari'
(use-package pari
  :init
  (add-to-list 'auto-mode-alist '("\\.gp$" . gp-script-mode))
  (setq gp-language (quote english))
  (autoload 'gp-mode "pari" nil t)
  (autoload 'gp-script-mode "pari" nil t)
  (autoload 'gp "pari" nil t)
  (autoload 'gpman "pari" nil t))

;; Use package `diff-hl'
(use-package diff-hl
  :ensure t
  :hook ((prog-mode . turn-on-diff-hl-mode)
	 (magit-pre-refresh . diff-hl-magit-pre-refresh)
         (magit-post-refresh . diff-hl-magit-post-refresh)))

;; Use package `minimap'
(use-package minimap
  :ensure t
  :config
  (setq minimap-window-location (quote right)))

;; Use package `graphviz-dot-mode'
(use-package graphviz-dot-mode
  :ensure t)

;; Use package `flycheck'.
(use-package flycheck
  :ensure t
  :config (global-flycheck-mode))

;; Use package `org-mode'.
(use-package org
  :init
  (progn
    (setq org-babel-load-languages
	  (quote
	   ((emacs-lisp . t)
	    (python . t)
	    (dot . t)
	    (shell . t))))
    (setq org-babel-python-command "python3.7")
    (setq org-confirm-babel-evaluate nil)
    (setq org-export-backends (quote (ascii html latex md odt)))
    (require 'ox-latex)
    (setq org-latex-listings (quote minted))
    (setq org-latex-minted-langs
	  (quote
	   ((emacs-lisp "common-lisp")
	    (shell-script "bash")
	    (python "python")
	    (dot "dot"))))
    (setq org-latex-minted-options
	  (quote
	   (("frame" "single")
	    ("framesep" "2mm")
	    ("breaklines" "true")
	    ("fontsize" "\\footnotesize"))))
    (setq org-latex-packages-alist (quote (("" "minted" t))))
    (setq org-latex-pdf-process
	  (quote
	   ("%latex -shell-escape -interaction nonstopmode -output-directory %o %f" "%latex -shell-escape -interaction nonstopmode -output-directory %o %f" "%latex -shell-escape -interaction nonstopmode -output-directory %o %f")))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes (quote (wombat)))
 '(default-frame-alist (quote ((width . 120) (height . 55) (alpha . 95))))
 '(indicate-empty-lines t)
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (csv-mode htmlize minimap demap company graphviz-dot-mode magit magit-section git-commit with-editor transient markdown-mode pkg-info epl dash bind-key use-package flycheck)))
 '(python-shell-interpreter "python3.7")
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(use-dialog-box nil)
 '(use-file-dialog nil)
 '(word-wrap t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight normal :height 98 :width normal))))
 '(cursor ((t (:background "firebrick"))))
 '(font-lock-comment-face ((t (:foreground "light gray"))))
 '(font-lock-doc-face ((t (:inherit font-lock-string-face :foreground "light gray")))))

;;; init.el ends here
