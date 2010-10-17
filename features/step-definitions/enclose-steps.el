(Given "^enclose mode is active$"
       (lambda ()
         (enclose-mode 1)))

(Given "^remove pair option is disabled$"
       (lambda ()
         (setq enclose-remove-pair nil)))

;; TODO: Submit to Espuds
(Then "^the cursor should be between \"\\(.+\\)\" and \"\\(.+\\)\"$"
      (lambda (left right)
        (should
         (and
         (looking-back (regexp-quote left))
         (looking-at (regexp-quote right))))))

;; TODO: Submit to Espuds
(When "^I place the cursor between \"\\(.+\\)\" and \"\\(.+\\)\"$"
      (lambda (left right)
        (goto-char (point-min))
        (should (search-forward (concat left right) nil t))
        (backward-char (length right))))

;; TODO: Submit to Espuds
(When "^I move the cursor$"
      (lambda ()
        (should (> (buffer-size) 0))
        (save-excursion
          (call-interactively
           (if (eobp) 'backward-char 'forward-char)))))

;; TODO: Submit to Espuds
(When "^I go to beginning of buffer$" 'beginning-of-buffer)

;; TODO: Submit to Espuds
(When "^I go to end of buffer$" 'end-of-buffer)
