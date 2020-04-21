(in-package :stumpwm)

(require :swank)
(swank-loader:init)
(swank:create-server :port 4004
                     :style swank:*communication-style*
                     :dont-close t)

;; Swap the ctrl and caps-lock keys
(run-shell-command "setxkbmap -option ctrl:swapcaps")

;; Run emacs as a daemon
(run-shell-command "emacs --daemon")
;; Remap C-t C-e and C-t e to emacsclient
(defcommand emacsclient-launch () ()
  (run-shell-command "emacsclient -c"))

(define-key *root-map* (kbd "e") "emacsclient-launch")
(define-key *root-map* (kbd "C-e") "emacsclient-launch")

;; Run emacsclient on startup
(emacsclient-launch)
