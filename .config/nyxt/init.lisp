(in-package #:nyxt-user)

;; Import Files
(dolist (file (list (nyxt-init-file "statusline.lisp")
                    (nyxt-init-file "stylesheet.lisp")))
  (load file))

;; Vim mode keybindings
;; (DEFINE-CONFIGURATION (BUFFER WEB-BUFFER)
;; ((DEFAULT-MODES (APPEND '(NYXT::VI-NORMAL-MODE) %SLOT-DEFAULT%))))

;; Dark mode
(define-configuration buffer
  ((default-modes (append '(dark-mode) %slot-default%))))


;; Zoom ratio
;; (DEFINE-CONFIGURATION BUFFER
  ;; ((CURRENT-ZOOM-RATIO 0.9)))
