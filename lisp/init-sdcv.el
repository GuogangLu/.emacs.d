;; 字典使用插件
;; 使用字典需要安装星际译王和sdcv两个软件，同时需要安装字典
;; 所有资源在dict.tar.gz中
(require-package 'showtip)
(require 'showtip)
(require 'sdcv)

(setq sdcv-dictionary-simple-list
    ;星际译王屏幕取词词典，简单，快捷
      '("牛津现代英汉双解词典"
      "英汉计算机词汇"))

(setq sdcv-dictionary-complete-list
    ;星际译王屏幕取词词典，简单，快捷
      '("牛津现代英汉双解词典"
      "英汉计算机词汇"
      "英汉双解计算机词典"
      "美国传统词典[双解]"
      "计算机词汇"))

(evil-leader/set-key
;; 添加l为翻译快捷键
   "l" 'sdcv-search-pointer+
;; 添加p为翻译快捷键
   "p" 'sdcv-search-pointer
;; 添加i为翻译快捷键
   "i" 'sdcv-search-input)
(provide 'init-sdcv)
