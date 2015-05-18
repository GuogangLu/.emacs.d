;; add ac-sources for latex mode
(require-package 'ac-math)
(require 'ac-math)
(add-to-list 'ac-modes 'latex-mode)
(defun ac-latex-mode-setup ()
  (setq ac-sources
        (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
                ac-sources))
  )
(add-hook 'latex-mode-hook 'ac-latex-mode-setup)
(add-hook 'LaTeX-mode-hook 'ac-latex-mode-setup)

;; add ac-source for clang
;;(require-package 'auto-complete-clang)
;;(require 'auto-complete-clang)
;;(setq ac-clang-flags
;;      (append '("-std=c++11")
;;              (mapcar (lambda (item) (concat "-I" item))
;;                      (split-string
;;                       "
;; /usr/lib/gcc/i686-redhat-linux/4.4.7/../../../../include/c++/4.4.7
;; /usr/lib/gcc/i686-redhat-linux/4.4.7/../../../../include/c++/4.4.7/i686-redhat-linux
;; /usr/lib/gcc/i686-redhat-linux/4.4.7/../../../../include/c++/4.4.7/backward
;; /usr/local/include
;; /usr/lib/gcc/i686-redhat-linux/4.4.7/include
;; /usr/include
;;"
;;                       ))))
;;(defun my-ac-cc-mode-setup ()
;;  (setq ac-sources (append '(ac-source-clang) ac-sources)))
;;(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)

;; 启用clang来自动补全代码
(require 'auto-complete-clang)
(add-to-list 'ac-dictionary-directories "~/emacs.d/elpa/auto-complete-20150408.1132/dict")
(setq ac-auto-start t)
(setq ac-quick-help-delay 0.5)
;; (ac-set-trigger-key "TAB")
;; (define-key ac-mode-map  [(control tab)] 'auto-complete)
(define-key ac-mode-map  [(control tab)] 'auto-complete)
(setq ac-clang-flags
      (mapcar (lambda (item)(concat "-I" item))
              (split-string
;; 以下路径源自命令>> echo "" | g++ -v -x c++ -E -
               "
 /usr/lib/gcc/i686-redhat-linux/4.4.7/../../../../include/c++/4.4.7
 /usr/lib/gcc/i686-redhat-linux/4.4.7/../../../../include/c++/4.4.7/i686-redhat-linux
 /usr/lib/gcc/i686-redhat-linux/4.4.7/../../../../include/c++/4.4.7/backward
 /usr/local/include
 /usr/lib/gcc/i686-redhat-linux/4.4.7/include
 /usr/include
"
               )))
(defun my-ac-config ()
  (setq-default ac-sources '(ac-source-abbrev 
			     ac-source-dictionary 
			     ac-source-words-in-same-mode-buffers))
  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
  (add-hook 'css-mode-hook 'ac-css-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))
(defun my-ac-cc-mode-setup ()
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))
(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
;; ac-source-gtags
(my-ac-config)

(provide 'init-ac-source)
