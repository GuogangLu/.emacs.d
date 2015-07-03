(require-package 'org-fstree)
; (require-package 'org-magit)
(require-package 'toc-org)


(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

;; Various preferences
(setq org-log-done t
      org-completion-use-ido t
      org-edit-timestamp-down-means-later t
      org-agenda-start-on-weekday nil
      org-agenda-span 14
      org-agenda-include-diary t
      org-agenda-window-setup 'current-window
      org-fast-tag-selection-single-key 'expert
      org-export-kill-product-buffer-when-displayed t
      org-tags-column 80
      org-startup-indented t)


; Refile targets include this file and any file contributing to the agenda - up to 5 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 5) (org-agenda-files :maxlevel . 5))))
; Targets start with the file name - allows creating level 1 tasks
(setq org-refile-use-outline-path (quote file))
; Targets complete in steps so we start with filename, TAB shows the next level of targets etc
(setq org-outline-path-complete-in-steps t)


(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "STARTED(s)" "|" "DONE(d!/!)")
                                (sequence "WAITING(w@/!)" "SOMEDAY(S)" "PROJECT(P@)" "|" "CANCELLED(c@/!)"))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org clock
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Save the running clock and all clock history when exiting Emacs, load it on startup
(setq org-clock-persistence-insinuate t)
(setq org-clock-persist t)
(setq org-clock-in-resume t)

;; Change task state to STARTED when clocking in
(setq org-clock-in-switch-to-state "STARTED")
;; Save clock data and notes in the LOGBOOK drawer
(setq org-clock-into-drawer t)
;; Removes clocked tasks with 0:00 duration
(setq org-clock-out-remove-zero-time-clocks t)

;; Show the clocked-in task - if any - in the header line
(defun sanityinc/show-org-clock-in-header-line ()
  (setq-default header-line-format '((" " org-mode-line-string " "))))

(defun sanityinc/hide-org-clock-from-header-line ()
  (setq-default header-line-format nil))

(add-hook 'org-clock-in-hook 'sanityinc/show-org-clock-in-header-line)
(add-hook 'org-clock-out-hook 'sanityinc/hide-org-clock-from-header-line)
(add-hook 'org-clock-cancel-hook 'sanityinc/hide-org-clock-from-header-line)

(eval-after-load 'org-clock
  '(progn
     (define-key org-clock-mode-line-map [header-line mouse-2] 'org-clock-goto)
     (define-key org-clock-mode-line-map [header-line mouse-1] 'org-clock-menu)))

(after-load 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((R . t)
     (emacs-lisp . t)
     (gnuplot . t)
     (haskell . nil)
     (latex . t)
     (octave . t)
     (python . t)
     (ruby . t)
     (sh . t))))

;; use org-toc
(add-hook 'org-mode-hook 'toc-org-enable)

;; enable markdown-exporting to the export menu
(eval-after-load "org" '(require 'ox-md nil t))

;; 配置org发布系统
;; 注意网上很多资料publishing-function org-publish-org-to-html
;; 现在的版本更为 org-html-publish-to-html
(setq org-publish-project-alist
      '(("idev-docs"
         :base-directory "~/design/idev/doc"
         :base-extension "org"
         :publishing-directory "~/idevhtml"
         :publishing-function org-html-publish-to-html
         :exclude "*.org"
         :headline-levels 3
         :section-numbers nil
         :with-toc t
         :html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"css/org1.css\"/>"
         :html-preamble t)
        ("style"
         :base-directory "~/.emacs.d/lisp/custom-themes/css"
         :base-extension "css\\|el"
         :publishing-directory "~/idevhtml/css"
         :publishing-function org-publish-attachment)
        ("idev" :components("idev-docs" "style"))))

;---------------------- GTD配置开始 --------------------------------------------
;; 配置org-capture<原org-remember> orgmode8以后使用org-capture
(require 'org-capture)
;TODO     最基本的任务状态，现在想做，但还没有计划做的时间
;NEXT     下一步行动，还没有开始计划
;SOMEDAY  想法，还没有决定是否开始行动
;WAITTING 等待其他人完成
;DONE     已经完成，需要记录完成实际和备注说明，转移到Finished.org的相应节点
;ABORT    取消的任务，需要说明取消的理由，转移到Trash.org的相应节点
(setq org-todo-keywords
      '((sequence "TODO(t!)"
                  "NEXT(n)"
                  "SOMEDAY(s)"
                  "WAITTING(w)"
                  "|"
                  "DONE(d@/!)"
                  "ABORT(a@/!)")))
;New      收集未整理的信息
;Task     待办事项，所有未完成的事项
;Calendar 日程安排，具有明确时间的待办事项，可以是周期性任务
;Idea     想法、愿望
;Finished 所有完成的事项
;Project  项目任务
(setq org-capture-templates
      '(("n" "New" entry (file "~/GTD/inbox.org") "* TODO %?\n %i\n %T\n%a")
        ("t" "Task" entry (file+headline "~/GTD/task.org" "Task") "* TODO %?\n %i\n %T\n%a")
        ("c" "Calendar" entry (file+headline "~/GTD/task.org" "Calendar") "* TODO %?\n %i\n %T\n%a")
        ("d" "Idea" entry (file+headline "~/GTD/task.org" "Idea") "* TODO %?\n %i\n %T\n%a")
        ("f" "Finished" entry (file "~/GTD/finished.org") "* TODO %?\n %i\n %T\n%a")
        ("p" "Project" entry (file "~/GTD/project.org") "* TODO %?\n %i\n %T\n%a")))
(global-set-key "\C-cc" 'org-capture)
;; 设置org-agenda  Trash.org保存被丢弃的任务
(setq org-agenda-files
      (list "~/GTD/inbox.org"
            "~/GTD/task.org"
            "~/GTD/finished.org"
            "~/GTD/project.org"
            "~/GTD/trash.org"))
;; 配置mobileorg
(setq  org-mobile-directory "~/GTD"
       org-directory "~/GTD")
(setq org-mobile-files (quote "~/GTD/inbox.org"))
;---------------------- GTD配置结束 --------------------------------------------

(provide 'init-org)
