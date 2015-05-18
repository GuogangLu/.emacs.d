(require-package 'evil-leader)
(global-evil-leader-mode t)
(evil-leader/set-leader ";")
(evil-leader/set-key
;; 将org-cycle绑定在;;上
   ";" 'org-cycle
;; 文件查找绑定在;f上
   "f" 'find-file
;; 添加b为查看buffer快捷键
   "b" 'switch-to-buffer
;; 关闭一个buffer
   "k" 'kill-buffer
;; 添加r为查找替换快捷键
   "r" 'query-replace-regexp
;; 添加t为查找tags快捷键
   "t" 'find-tag-regexp
;; 添加o为打开所有折叠快捷键
   "s" 'hs-show-all
;; 添加c为隐藏所有折叠快捷键
   "h" 'hs-hide-all
;; 添加m为打开菜单栏快捷键
   "m" 'menu-bar-open
;; 添加.为切换最近使用的buffer叠快捷键
   "." 'evil-buffer
;; 添加w为保存文件快捷键
   "w" 'save-buffer)

(provide 'init-evil-leader)
