;; 代码折叠
(load-library "hideshow")
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)
;;(global-set-key (kbd "SPC") 'hs-hide-block)
;; (global-set-key (kbd "C-=") 'hs-show-block)
(global-set-key (kbd "C-M--") 'hs-hide-all)
(global-set-key (kbd "C-M-=") 'hs-show-all)
;; <F12>在头文件和源文件件跳转
(global-set-key (kbd "<f12>") 'ff-find-other-file)

;; 设置Tab键缩进，设置c语言代码缩进
(setq c-indent-level 4
      c-argdecl-indent 4
      c-continued-statement-offset 4
      c-brace-offset 4
      c-basic-offset 4
      c-lable-offset 0
      standard-indent 4
      indent-tabs-mode nil
      tab-width 4)

(provide 'init-mycc-mode)
