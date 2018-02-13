(defun new-shell (servername loginname)
  "MC: Opens a new shell buffer to specified servername with login loginname.
Based on https://www.quora.com/What-does-Tikhon-Jelviss-Emacs-setup-look-like."
  (interactive "sRemote Server: \nsLogin Name: ")
  (pop-to-buffer (concat "*" servername "*"))
  (unless (eq major-mode 'shell-mode)
    (shell (current-buffer))
    (sleep-for 0 200)
    (delete-region (point-min) (point-max))
    (comint-simple-send (get-buffer-process (current-buffer))
                        (concat "plink " loginname "@" servername ":"))))
