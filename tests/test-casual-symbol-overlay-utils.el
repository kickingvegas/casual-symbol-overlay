;;; test-casual-symbol-overlay-utils.el --- Casual IBuffer Utils Tests  -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Charles Choi

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
(require 'ert)
(require 'casual-symbol-overlay-test-utils)
(require 'casual-symbol-overlay-utils)

(defun casualt-unicode-db-assert (key control cmd)
  (let ((test (funcall cmd key)))
    (should (string= test control))))

(defun casualt-symbol-overlay-unicode-assert (key control)
  (casualt-unicode-db-assert key control #'casual-symbol-overlay-unicode-get))

(ert-deftest test-casual-symbol-overlay-unicode-get ()
  (let ((casual-lib-use-unicode nil))
    (casualt-symbol-overlay-unicode-assert :previous "previous")
    (casualt-symbol-overlay-unicode-assert :next "next")
    (casualt-symbol-overlay-unicode-assert :first "first")
    (casualt-symbol-overlay-unicode-assert :last "last")
    (casualt-symbol-overlay-unicode-assert :switch "Switch")
    (casualt-symbol-overlay-unicode-assert :jump "Jump"))

  (let ((casual-lib-use-unicode t))
    (casualt-symbol-overlay-unicode-assert :previous "↑")
    (casualt-symbol-overlay-unicode-assert :next "↓")
    (casualt-symbol-overlay-unicode-assert :first "⤒")
    (casualt-symbol-overlay-unicode-assert :last "⤓")
    (casualt-symbol-overlay-unicode-assert :switch "⇄")
    (casualt-symbol-overlay-unicode-assert :jump "🚀")))

(provide 'test-casual-symbol-overlay-utils)
;;; test-casual-symbol-overlay-utils.el ends here
