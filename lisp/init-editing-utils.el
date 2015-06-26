(add-to-list 'load-path (expand-file-name "lisp/editing-utils" user-emacs-directory))

;; dimish minor mode name to save mode line space
(require-package 'diminish)

;;关闭光标闪烁
(blink-cursor-mode 0)
;; some default value
(setq-default
 ;; 下面两个变量设置光标闪烁，需要打开光标闪烁模式才有效
 blink-cursor-delay 0
 blink-cursor-interval 0.4
 ;; 设置菜单栏中，显示的最大长度
 buffers-menu-max-size 20
 ;;
 case-fold-search t
 ;; 显示光标行坐标
 line-number-mode t
 ;; 显示光标列坐标
 column-number-mode t
 ;; 关于编译的选项，含义不清楚
 compilation-scroll-output t
 delete-selection-mode t
 grep-scroll-output t
 ;;
 indent-tabs-mode nil
 line-spacing 0.2
 ;; 取消emacs自动备份文件
 make-backup-files nil
 mouse-yank-at-point t
 save-interprogram-paste-before-kill t
 scroll-preserve-screen-position 'always
 scroll-step 1
 scroll-margin 3
 scroll-conservatively 10000
 set-mark-command-repeat-pop t
 show-trailing-whitespace t
 tooltip-delay 1.5
 truncate-lines nil
 truncate-partial-width-windows nil
 ;; 闪烁屏幕提示警告
 visible-bell nil)

(set-scroll-bar-mode nil)
(tool-bar-mode 0)

;;关于缩进调整
(setq standard-indent 4
      indent-tabs-mode nil
      tab-width 4)

;; auto-revert
(global-auto-revert-mode)
(setq global-auto-revert-non-file-buffers t
      auto-revert-verbose t)

;; enable auto-pairing
(require 'init-autopair)
(diminish 'autopair-mode)

;; some personal key bindings
(global-set-key (kbd "C-c r") 'replace-string)

;; newline behavior
(global-set-key (kbd "RET") 'newline-and-indent)
(defun sanityinc/newline-at-end-of-line ()
  "Move to end of line, enter a newline, and reindent."
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent))

(global-set-key (kbd "<S-return>") 'sanityinc/newline-at-end-of-line)

;; change yes-or-no to y-or-n
;; (fset 'yes-or-no-p 'y-or-n-p)

;; 在提示信息栏显示时间和日期
(display-time-mode t)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

;; display line number
;; (require 'linum)
(require-package 'hlinum)
;; (require 'hlinum)
(hlinum-activate)
(global-linum-mode t)

;; visual line
(global-visual-line-mode t)
;; (diminish 'global-visual-line-mode)
(diminish 'visual-line-mode)

;; expand-region
(require-package 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; enable uppercase and lowercase transform for region
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; whole-line-or-region-mode
(require-package 'whole-line-or-region)
(whole-line-or-region-mode t)
(diminish 'whole-line-or-region-mode)
(make-variable-buffer-local 'whole-line-or-region-mode)

;; enable cua mode without prefix key
(cua-selection-mode t)

;; use page-break-line to handle the ^L page-breaking symbol
(require-package 'page-break-lines)
(global-page-break-lines-mode)
(diminish 'page-break-lines-mode)

;; enable subword-mode
;; (global-subword-mode t)

;; multiple-cursors-mode
;; (require-package 'multiple-cursors)
;; multiple-cursors
;; (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
;; (global-set-key (kbd "C->") 'mc/mark-next-like-this)
;; (global-set-key (kbd "C-+") 'mc/mark-next-like-this)
;; (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
;; From active region to multiple cursors:
;; (global-set-key (kbd "C-c c r") 'set-rectangular-region-anchor)
;; (global-set-key (kbd "C-c c c") 'mc/edit-lines)
;; (global-set-key (kbd "C-c c e") 'mc/edit-ends-of-lines)
;; (global-set-key (kbd "C-c c a") 'mc/edit-beginnings-of-lines)

;; switch-window
(require 'init-switch-window)
;; Set "C-x p" to select the previous window
(defun other-window-backward (&optional n)
  "Select the Nth previous window"
  (interactive "P")
  (other-window (- (prefix-numeric-value n))))
(global-set-key "\C-xp" 'other-window-backward)


;; undo-tree
(require 'init-undo-tree)
(diminish 'undo-tree-mode)

;; outline-minor-mode
(require 'init-outl-minor)

;; use C-u C-u C-s/r to trigger the flexible search action
(require 'init-flex-isearch)

;; set some compilation shortcuts
(require 'init-compile)

;; 设置中英文混合的地方
;; (require-package 'chinese-fonts-setup)

(provide 'init-editing-utils)
