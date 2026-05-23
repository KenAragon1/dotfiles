(require 'package)
(setq custom-file "~/.emacs.custom.el")
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(load-theme 'gruber-darker t)

(setq inhibit-startup-screen t
      display-line-numbers-type 'relative
      scroll-conservatively 101
      scroll-margin 8
      indent-line-function 'insert-tab
      c-basic-offset 4
      ido-enable-flex-matching t
      ido-everywhere t
      split-width-threshold nil
      compilation-scroll-output t
      make-backup-files nil
      dired-listing-switches "-alh"
      whitespace-style '(face tabs spaces trailing space-before-tab
                              indentation empty space-after-tab space-mark tab-mark)
      mmm-submode-decoration-level 0)

(setq-default indent-tabs-mode nil
              tab-width 4)

(set-frame-font "Iosevka Term 15" nil t)

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(show-paren-mode 1)
(global-display-line-numbers-mode 1)

(ido-mode 1)
(global-company-mode 1)
(editorconfig-mode 1)

(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

;; Keybinds
(global-set-key (kbd "C-h") 'delete-backward-char)


(add-hook 'eglot-managed-mode-hook
          (lambda ()
            (eglot-inlay-hints-mode -1)))

(require 'eldoc-box)
(setq eldoc-echo-area-prefer-doc-buffer 1)


;; Languages
(defun setup-whitespace-mode ()
    (whitespace-mode 1))

;; C, C++
(add-to-list 'load-path "~/.emacs.local/")
(require 'simpc-mode)
(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . c-ts-mode))

(setq c-ts-mode-indent-offset 4)

(add-hook 'c-ts-mode-hook 'setup-whitespace-mode)
(add-hook 'simpc-mode-hook 'setup-whitespace-mode)

;; Typescript
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
(add-hook 'typescript-ts-mode-hook 'setup-whitespace-mode)

(setq typescript-ts-mode-indent-offset 4)

;; Prisma
(add-to-list 'auto-mode-alist '("\\.prisma\\'" . prisma-ts-mode))

;; Vue
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
