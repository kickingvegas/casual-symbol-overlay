;;; casual-symbol-overlay-settings.el --- Casual Bookmarks Settings -*- lexical-binding: t; -*-

;; Copyright (C) 2024 Charles Choi

;; Author: Charles Choi <kickingvegas@gmail.com>
;; Keywords: tools

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
;;

;;; Code:
(require 'casual-lib)
(require 'casual-symbol-overlay-version)

(transient-define-prefix casual-symbol-overlay-settings-tmenu ()
  "Casual Symbol Overlay settings menu."
  ["Symbol Overlay: Settings"
   ["Customize"
    ("G" "Symbol Overlay Group" casual-symbol-overlay--customize-group)
   (casual-lib-customize-unicode)
   (casual-lib-customize-hide-navigation)]]

  [:class transient-row
   (casual-lib-quit-one)
   ("a" "About" casual-symbol-overlay-about :transient nil)
   ("v" "Version" casual-symbol-overlay-version :transient nil)
   (casual-lib-quit-all)])

(defun casual-symbol-overlay--customize-group ()
  "Customize Symbol Overlay group."
  (interactive)
  (customize-group "symbol-overlay"))

(defun casual-symbol-overlay-about-symbol-overlay ()
  "Casual Symbol Overlay is a Transient user interface for Symbol Overlay.

Learn more about using Casual Symbol Overlay at our discussion
group on GitHub. Any questions or comments about it should be
made there.
URL `https://github.com/kickingvegas/casual-symbol-overlay/discussions'

If you find a bug or have an enhancement request, please file an issue.
Our best effort will be made to answer it.
URL `https://github.com/kickingvegas/casual-symbol-overlay/issues'

If you enjoy using Casual Symbol Overlay, consider making a
modest financial contribution to help support its development and
maintenance. URL `https://www.buymeacoffee.com/kickingvegas'

Casual Symbol Overlay was conceived and crafted by Charles Choi in
San Francisco, California.

Thank you for using Casual Symbol Overlay.

Always choose love."
  (ignore))

(defun casual-symbol-overlay-about ()
  "About information for Casual Symbol Overlay."
  (interactive)
  (describe-function #'casual-symbol-overlay-about-symbol-overlay))

(provide 'casual-symbol-overlay-settings)
;;; casual-symbol-overlay-settings.el ends here
