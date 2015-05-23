(require-package 'w3m)

(require 'w3m)
(require 'w3m-lnum)
(require 'w3m-bookmark)
;;(require 'html-helper-mode)

;; 设置w3m主页
(setq w3m-home-page "http://www.baidu.com")

;; 默认显示图片
(setq w3m-default-display-inline-images t)
(setq w3m-default-toggle-inline-images t)

;; 使用cookies
(setq w3m-use-cookies t)

;;设定w3m运行的参数，分别为使用cookie和使用框架
(setq w3m-command-arguments '("-cookie" "-F"))

;; 使用w3m作为默认浏览器
(setq browse-url-browser-function 'w3m-browse-url)
(setq w3m-view-this-url-new-session-in-background t)

;;显示图标
(setq w3m-show-graphic-icons-in-header-line t)
(setq w3m-show-graphic-icons-in-mode-line t)

;;C-c C-p 打开，这个好用
;; (setq w3m-view-this-url-new-session-in-background t)

(add-hook 'w3m-fontify-after-hook 'remove-w3m-output-garbages)

(defun remove-w3m-output-garbages ()
  "去掉w3m输出的垃圾."
  (interactive)
  (let ((buffer-read-only))
    (setf (point) (point-min))
    (while (re-search-forward "[\200-\240]" nil t)
      (replace-match " "))
    (set-buffer-multibyte t))
  (set-buffer-modified-p nil))

;;设置w3m使用的快捷键
;下一个标签
(define-key w3m-mode-map  ";l" 'w3m-tab-next-buffer)
;上一个标签
(define-key w3m-mode-map  ";h" 'w3m-tab-previous-buffer)
;返回上一个页面
(define-key w3m-mode-map  ";k" 'w3m-view-previous-page)
;跳到下一个页面
(define-key w3m-mode-map  ";j" 'w3m-view-next-page)
;删除标签
(define-key w3m-mode-map  ";d" 'w3m-delete-buffer)
;新增一个标签
(define-key w3m-mode-map  ";n" 'w3m-goto-new-session-url)
;查看书签
(define-key w3m-mode-map  ";b" 'w3m-bookmark-view)
;行跳转
(define-key w3m-mode-map  ";g" 'goto-line)

;; 使用evil模式的快捷键选中和复制
(define-key w3m-mode-map  "v" 'evil-visual-char)
(define-key w3m-mode-map  "y" 'evil-yank)
(define-key w3m-mode-map  "Y" 'evil-yank-line)

(provide 'init-w3m)
