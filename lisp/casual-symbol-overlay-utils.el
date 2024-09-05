;;; casual-symbol-overlay-utils.el --- Casual Bookmarks Utils -*- lexical-binding: t; -*-

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
(require 'transient)
(require 'casual-lib)

(defconst casual-symbol-overlay-unicode-db
  '((:previous . '("↑" "previous"))
    (:next . '("↓" "next"))
    (:first . '("⤒" "first"))
    (:last . '("⤓" "last"))
    (:switch . '("⇄" "Switch"))
    (:jump . '("🚀" "Jump")))
  "Unicode symbol DB to use for Bookmarks Transient menus.")

(defun casual-symbol-overlay-unicode-get (key)
  "Lookup Unicode symbol for KEY in DB.

- KEY symbol used to lookup Unicode symbol in DB.

If the value of customizable variable `casual-lib-use-unicode'
is non-nil, then the Unicode symbol is returned, otherwise a
plain ASCII-range string."
  (casual-lib-unicode-db-get key casual-symbol-overlay-unicode-db))

(provide 'casual-symbol-overlay-utils)
;;; casual-symbol-overlay-utils.el ends here
