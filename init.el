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

;; (require-package 'diminish)
;; (require 'init-themes)
;; (require 'init-dired)

(require 'init-recentf)
(require 'init-ido)
(require 'init-yasnippet)
;; (require 'init-hippie-expand)
(require 'init-auto-complete)
;; (require 'init-fonts)
(require 'init-tabbar)
(require 'init-editing-utils)

(require 'init-git)

;; (require 'init-markdown)
;; (require 'init-auctex)
;; (require 'init-javascript)
;; (require 'init-php)
(require 'init-org)
;; (require 'init-nxml)
;; (require 'init-html)
;; (require 'init-css)
;; (require 'init-haml)
;; (require 'init-python-mode)
;; (require 'init-haskell)

;; (when *spell-check-support-enabled*
;;   (require 'init-spelling))

;; (add-hook 'after-init-hook
;;            (lambda ()
;;              (message "init completed in %.2fms"
;;                       (sanityinc/time-subtract-millis after-init-time before-init-time))))

;; evil 设置
(require 'init-evil)
(require 'init-evil-leader)

;; 设置浏览器
(require 'init-w3m)

;; 设置词典
;; (require 'init-sdcv)

;; 设置cc-mode运行的一些添加配置
(require 'init-mycc-mode)

;; 关闭emacs启动时的画面
(setq inhibit-startup-message 1)
(setq guns-inhibit-startup-message 1)

(provide 'init)
(put 'narrow-to-region 'disabled nil)
