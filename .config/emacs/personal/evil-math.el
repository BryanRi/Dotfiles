(defun evil-math (math-operator count)
  "Apply MATH-OPERATOR to the first number found the a line and count. After
finishing the computation set the point to the beginning of the match."
    (when (re-search-forward "-?[[:digit:]]+" (line-end-position) t 1)
      (replace-match
        (number-to-string
	  (funcall math-operator (string-to-number (match-string 0))
	  	   		 count)))
      (setf (point) (match-beginning 0))))

(defun evil-sub (&optional prefix)
  "Call evil-math with subtraction and where the default for count=1 or
count=PREFIX if a prefix is given."
  (interactive "p")
  (let ((count (or prefix 1)))
    (evil-math #'- count)))

(defun evil-add (&optional prefix)
  "Call evil-math with addition and where the default for count=1 or
count=PREFIX if a prefix is given."
  (interactive "p")
  (let ((count (or prefix 1)))
    (evil-math #'+ count)))
