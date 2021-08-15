(in-package #:nyxt-user)

;; Vim mode keybindings
(DEFINE-CONFIGURATION (BUFFER WEB-BUFFER)
((DEFAULT-MODES (APPEND '(	NYXT::VI-NORMAL-MODE
							dark-mode
						 ) %SLOT-DEFAULT%))))

;; Dark mode
;; (define-configuration buffer
  ;; ((default-modes (append '(dark-mode) %slot-default%))))

;; Zoom ratio
(DEFINE-CONFIGURATION BUFFER
((CURRENT-ZOOM-RATIO 0.9)))

;; Import Files
(dolist (file (list (nyxt-init-file "statusline.lisp")
					(nyxt-init-file "style-test.lisp")
                    (nyxt-init-file "stylesheet.lisp")))
  (load file))

(echo "Init file loaded.")
