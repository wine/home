(setq gc-cons-threshold-original gc-cons-threshold)
(setq gc-cons-threshold most-positive-fixnum)
(add-hook 'emacs-startup-hook
	  (lambda ()
	    (setq gc-cons-threshold (* 1024 1024 100))))

(setq file-name-handler-alist-original file-name-handler-alist)
(setq file-name-handler-alist nil)
(add-hook 'emacs-startup-hook
	  (lambda ()
	    (setq file-name-handler-alist file-name-handler-alist-original)))

(setq read-process-output-max (* 1024 1024))

(setq package-enable-at-startup nil)
(setq inhibit-splash-screen t)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
