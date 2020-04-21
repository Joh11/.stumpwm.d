(in-package :stumpwm)

(require :swank)
(swank-loader:init)
(swank:create-server :port 4004
                     :style swank:*communication-style*
                     :dont-close t)

;; Swap the ctrl and caps-lock keys
(run-shell-command "setxkbmap -option ctrl:swapcaps")
