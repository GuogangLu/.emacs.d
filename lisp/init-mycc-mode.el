;; 代码折叠
(load-library "hideshow")
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)

;; 调用google-c-style风格
(require 'google-c-style)
(add-hook 'c-mode-hook 'google-c-style)

;; 设置Tab键缩进，设置c语言代码缩进
(defun my-c-mode-hook ()
  (setq c-indent-level 4
      c-argdecl-indent 4
      c-continued-statement-offset 4
      c-brace-offset 4
      c-lable-offset 0
      c-basic-offset 4		;;基本缩进宽度4个字符
      indent-tabs-mode t	;;禁止空格替换Tab
      c-lable-offset 0))
(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'c++-mode-hook 'my-c-mode-hook)
;; <F12>在头文件和源文件件跳转
(global-set-key (kbd "<f12>") 'ff-find-other-file)
;; <F8>注释和取消注释
(global-set-key (kbd "<f8>") 'comment-or-uncomment-region)
(provide 'init-mycc-mode)

;; cc-mode快捷键
;; C-M-q 格式化这一对括号中的代码，注意，光标一定要置于左括号上。
;; C-c C-q  格式化一个函数。
;; untabify  将tab替换成空格。这个不知是不是cc-mode的命令。

;; 第二个要说的就是移动功能，前面已经说过一些通用的移动命令，这里说的是C里面用到的特殊的命令。
;; C-M-a 跳到函数的开始。
;; C-M-e 跳到函数的结尾。
;; M-a 跳到上一个语句。
;; M-e 跳到下一个语句。
;; C-M-b 当光标置于｝的后面时，跳转到与之匹配的｛。
;; C-M-f  当光标置于｛的后面时，跳转到与之匹配的｝。
;; C-c C-u 跳转到上一个条件编译的条件处。
