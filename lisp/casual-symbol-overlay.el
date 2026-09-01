;;; casual-symbol-overlay.el --- Transient UI for Symbol Overlay -*- lexical-binding: t; -*-

;; Copyright (C) 2024-2026  Charles Choi

;; Author: Charles Choi <kickingvegas@gmail.com>
;; URL: https://github.com/kickingvegas/casual-symbol-overlay
;; Keywords: tools
;; Version: 3.0.2-rc.1
;; Package-Requires: ((emacs "30.1") (casual "3.0.0") (symbol-overlay "4.2"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; Casual Symbol Overlay is a Transient user interface for Symbol Overlay.

;; INSTALL

;; Refer to “Install” section in the Casual Symbol Overlay User Guide in `info'
;; for guidance on installation and setup.

;;; Code:
(require 'symbol-overlay)
(require 'casual-lib)
(require 'casual-symbol-overlay-utils)
(require 'casual-symbol-overlay-settings)

(defvar symbol-overlay-scope) ;; added to suppress lint warning


;;;###autoload (autoload 'casual-symbol-overlay-init "casual-symbol-overlay" nil t)
(defun casual-symbol-overlay-init ()
  "Initialize and configure Casual Symbol Overlay."
  (interactive)
  (add-hook 'symbol-overlay-mode-hook #'casual-symbol-overlay-setup))

(defun casual-symbol-overlay-setup ()
  "Setup `symbol-overlay-mode' for Casual.

To see what keybindings are set by this function, press ‘s’ to view its
source."
  (keymap-set symbol-overlay-map casual-keybinding-primary #'casual-symbol-overlay-tmenu))


;;;###autoload (autoload 'casual-symbol-overlay-tmenu "casual-symbol-overlay" nil t)
(transient-define-prefix casual-symbol-overlay-tmenu ()
  ["Symbol Overlay"
   ["Operations"
    ("w" "Copy symbol" symbol-overlay-save-symbol)
    ("r" "Rename symbol…" symbol-overlay-rename)
    ("q" "Query replace…" symbol-overlay-query-replace)]

   ["Display"
    ("i" "Toggle highlight" symbol-overlay-put :transient t)
    ("t" "Toggle in scope" symbol-overlay-toggle-in-scope
     :description (lambda () (casual-lib-checkbox-label symbol-overlay-scope "In Scope"))
     :transient t)
    ("k" "Remove all" symbol-overlay-remove-all)]

   ["Search"
    ("s" "I-Search" symbol-overlay-isearch-literally)]]

  ["Navigation"
   [("p" "Jump previous" symbol-overlay-jump-prev
     :description (lambda ()
                    (format "%s %s"
                            (casual-symbol-overlay-unicode-get :jump)
                            (casual-symbol-overlay-unicode-get :previous)))
     :transient t)
    ("n" "Jump next" symbol-overlay-jump-next
     :description (lambda ()
                    (format "%s %s"
                            (casual-symbol-overlay-unicode-get :jump)
                            (casual-symbol-overlay-unicode-get :next)))
     :transient t)]

   [("<" "Jump first" symbol-overlay-jump-first
     :description (lambda ()
                    (format "%s %s"
                            (casual-symbol-overlay-unicode-get :jump)
                            (casual-symbol-overlay-unicode-get :first)))
     :transient t)
    (">" "Jump last" symbol-overlay-jump-last
     :description (lambda ()
                    (format "%s %s"
                            (casual-symbol-overlay-unicode-get :jump)
                            (casual-symbol-overlay-unicode-get :last)))
     :transient t)]

   [("M-p" "Switch previous" symbol-overlay-switch-backward
     :description (lambda ()
                    (format "%s %s"
                            (casual-symbol-overlay-unicode-get :switch)
                            (casual-symbol-overlay-unicode-get :previous)))
     :transient t)
    ("M-n" "Switch next" symbol-overlay-switch-forward
     :description (lambda ()
                    (format "%s %s"
                            (casual-symbol-overlay-unicode-get :switch)
                            (casual-symbol-overlay-unicode-get :next)))
     :transient t)]

   [("d" "Jump to definition" symbol-overlay-jump-to-definition
     :description (lambda ()
                    (format "%s to definition"
                            (casual-symbol-overlay-unicode-get :jump))))
    ("e" "Jump to last mark" symbol-overlay-echo-mark
     :description (lambda ()
                    (format "%s to last mark"
                            (casual-symbol-overlay-unicode-get :jump))))]]

  [:class transient-row
   (casual-lib-quit-one)
   ("RET" "Done" transient-quit-all)
   ("," "Settings›" casual-symbol-overlay-settings-tmenu)
   (casual-lib-quit-all)])


(provide 'casual-symbol-overlay)
;;; casual-symbol-overlay.el ends here
