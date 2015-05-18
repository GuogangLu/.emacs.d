(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
;; (defconst *is-a-mac* (eq system-type 'darwin))

;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
;; (require 'init-compat)
(require 'init-utils)

;; Needed for Emacs version < 24. must come before elpa, as it may provide package.el
;; (require 'init-site-lisp)

;; Machinery for installing required packages.
;; explicitly call 'package-initialize to set up all packages installed via ELPA.
;; should come before all package-related config files
(require 'init-elpa)
;; (require 'init-exec-path) ;; Set up $PATH

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------

;; (REQUIRE-package 'wgrep)
;; (require-package 'project-local-variables)
;; (require-package 'diminish)
;; (require-package 'scratch)
;; (require-package 'mwe-log-commands)

;; (require 'init-frame-hooks)
;; (require 'init-xterm)
;;;;;;;;;;(require 'init-themes)
;; (require 'init-osx-keys)
;; (require 'init-gui-frames)
;; (require 'init-proxies)
;; (require 'init-dired)
;; (require 'init-isearch)
;; (require 'init-uniquify)
;; (require 'init-ibuffer)
;; (require 'init-flycheck)

;;;;;;;;;;(require 'init-recentf)
(require 'init-ido)
(require 'init-yasnippet)
;;;;;;;;;;(require 'init-hippie-expand)
(require 'init-auto-complete)
;; (require 'init-windows)
;; (require 'init-sessions)
;;;;;;;;;;;(require 'init-fonts)
;; (require 'init-mmm)
(require 'init-tabbar)
;;;;;;;;;;;;;(require 'init-editing-utils)
;;;;;;;;;;;;(require 'init-matlab)

;; (require 'init-vc)
;; (require 'init-darcs)
(require 'init-git)

;; (require 'init-crontab)
;; (require 'init-textile)
;;;;;;;;;;;(require 'init-markdown)
;;;;;;;;;;(require 'init-auctex)
;; (require 'init-csv)
;; (require 'init-erlang)
;; (require 'init-javascript)
;; (require 'init-php)
(require 'init-org)
;; (require 'init-nxml)
;; (require 'init-html)
;; (require 'init-css)
;; (require 'init-haml)
;; (require 'init-python-mode)
;;;;;;;;;;(require 'init-haskell)
;; (require 'init-ruby-mode)
;; (require 'init-rails)
;; (require 'init-sql)

;; (require 'init-paredit)
;; (require 'init-lisp)
;; (require 'init-slime)
;; (require 'init-clojure)
;; (when (>= emacs-major-version 24)
;;   (require 'init-clojure-cider))
;; (require 'init-common-lisp)

;; (when *spell-check-support-enabled*
;;   (require 'init-spelling))

;; (require 'init-marmalade)
;; (require 'init-misc)

;; (require 'init-dash)
;; (require 'init-ledger)
;; ;; Extra packages which don't require any configuration

;; (require-package 'gnuplot)
;; (require-package 'lua-mode)
;; (require-package 'htmlize)
;; (require-package 'dsvn)
;; (when *is-a-mac*
;;   (require-package 'osx-location))
;; (require-package 'regex-tool)

;; ;;----------------------------------------------------------------------------
;; ;; Allow access from emacsclient
;; ;;----------------------------------------------------------------------------
;; (require 'server)
;; (unless (server-running-p)
;;   (server-start))


;; ;;----------------------------------------------------------------------------
;; ;; Variables configured via the interactive 'customize' interface
;; ;;----------------------------------------------------------------------------
;; (setq custom-file (expand-file-name "custom.el" user-emacs-directory))
;; (when (file-exists-p custom-file)
;;   (load custom-file))


;; ;;----------------------------------------------------------------------------
;; ;; Allow users to provide an optional "init-local" containing personal settings
;; ;;----------------------------------------------------------------------------
;; (when (file-exists-p (expand-file-name "init-local.el" user-emacs-directory))
;;   (error "Please move init-local.el to ~/.emacs.d/lisp"))
;; (require 'init-local nil t)


;; ;;----------------------------------------------------------------------------
;; ;; Locales (setting them earlier in this file doesn't work in X)
;; ;;----------------------------------------------------------------------------
;; (require 'init-locales)

;; (add-hook 'after-init-hook
;;            (lambda ()
;;              (message "init completed in %.2fms"
;;                       (sanityinc/time-subtract-millis after-init-time before-init-time))))


;; evil 设置
(require 'init-evil)
(require 'init-evil-leader)

;; 代码折叠
(load-library "hideshow")
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)
;; (global-set-key (kbd "C--") 'hs-hide-block)
;; (global-set-key (kbd "C-=") 'hs-show-block)
(global-set-key (kbd "C-M--") 'hs-hide-all)
(global-set-key (kbd "C-M-=") 'hs-show-all)
;; <F12>在头文件和源文件件跳转
(global-set-key (kbd "<f12>") 'ff-find-other-file)

;; 设置Tab键缩进，设置c语言代码缩进
(setq c-indent-level 4)
(setq c-argdecl-indent 4)
(setq c-continued-statement-offset 4)
(setq c-brace-offset 4)
(setq c-basic-offset 4)
(setq c-lable-offset 0)
(setq standard-indent 4)
(setq indent-tabs-mode nil)
(setq tab-width 4)

;; shift+箭头 在不同窗口中切换
(windmove-default-keybindings)
(global-set-key (kbd "C-S-h") 'windmove-left)
(global-set-key (kbd "C-S-l") 'windmove-right)
(global-set-key (kbd "C-S-j") 'windmove-down)
(global-set-key (kbd "C-S-k") 'windmove-up)

;; 显示行号
(setq line-number-mode t)
;; 显示文本行号
(require 'linum)
(global-linum-mode t)

;; 显示匹配的括号对
(show-paren-mode t)

;; 关闭emacs启动时的画面
(setq inhibit-startup-message 1)
(setq guns-inhibit-startup-message 1)


(provide 'init)
(put 'narrow-to-region 'disabled nil)
