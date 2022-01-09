;;; ../.dotfiles/doom.d/autoload.el -*- lexical-binding: t; -*-

(defun +go--spawn (cmd)
  (save-selected-window
    (compile cmd)))

(defun +go--run-tests (args)
  (let ((cmd (concat "go test " args)))
    (+go--spawn cmd)))

;;;###autoload
(defun +go/test-single-verbose ()
  (interactive)
  (if (string-match "_test\\.go" buffer-file-name)
      (save-excursion
        (re-search-backward "^func[ ]+\\(([[:alnum:]]*?[ ]?[*]?[[:alnum:]]+)[ ]+\\)?\\(Test[[:alnum:]_]+\\)(.*)")
        (+go--run-tests (concat "-v -run" "='" (match-string-no-properties 2) "'")))
    (error "Must be in a _test.go file")))

;;;###autoload
(defun +default/org-roam-search (query)
  "Perform a text search on `org-roam-directory'."
  (interactive
   (list (if (doom-region-active-p)
             (buffer-substring-no-properties
              (doom-region-beginning)
              (doom-region-end))
           "")))
  (require 'org)
  (+default/search-project-for-symbol-at-point
   query org-roam-directory))
