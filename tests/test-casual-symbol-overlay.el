;;; test-casual-symbol-overlay.el --- Casual IBuffer Tests -*- lexical-binding: t; -*-

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
(require 'casual-lib-test-utils)
(require 'casual-symbol-overlay)

(ert-deftest test-casual-symbol-overlay-tmenu ()
  (casualt-setup)
  (cl-letf (
            (casualt-mock #'symbol-overlay-put)
            (casualt-mock #'symbol-overlay-save-symbol)
            (casualt-mock #'symbol-overlay-rename)
            (casualt-mock #'symbol-overlay-query-replace)
            (casualt-mock #'symbol-overlay-jump-to-definition)
            (casualt-mock #'symbol-overlay-jump-prev)
            (casualt-mock #'symbol-overlay-jump-next)
            (casualt-mock #'symbol-overlay-jump-first)
            (casualt-mock #'symbol-overlay-jump-last)
            (casualt-mock #'symbol-overlay-switch-backward)
            (casualt-mock #'symbol-overlay-switch-forward)
            (casualt-mock #'symbol-overlay-echo-mark)
            (casualt-mock #'symbol-overlay-toggle-in-scope)
            (casualt-mock #'symbol-overlay-remove-all)
            (casualt-mock #'symbol-overlay-isearch-literally))

    (let ((test-vectors
           '((:binding "w" :command symbol-overlay-save-symbol)
             (:binding "r" :command symbol-overlay-rename)
             (:binding "q" :command symbol-overlay-query-replace)

             (:binding "i" :command symbol-overlay-put)
             (:binding "t" :command symbol-overlay-toggle-in-scope)
             (:binding "k" :command symbol-overlay-remove-all)
             (:binding "s" :command symbol-overlay-isearch-literally)

             (:binding "p" :command symbol-overlay-jump-prev)
             (:binding "n" :command symbol-overlay-jump-next)
             (:binding "<" :command symbol-overlay-jump-first)
             (:binding ">" :command symbol-overlay-jump-last)
             (:binding "M-p" :command symbol-overlay-switch-backward)
             (:binding "M-n" :command symbol-overlay-switch-forward)

             (:binding "d" :command symbol-overlay-jump-to-definition)
             (:binding "e" :command symbol-overlay-echo-mark)
             (:binding "RET" :command transient-quit-all))))

      (casualt-suffix-testcase-runner test-vectors
                                      #'casual-symbol-overlay-tmenu
                                      '(lambda () (random 5000)))))
  (casualt-breakdown t))


(provide 'test-casual-symbol-overlay)
;;; test-casual-symbol-overlay.el ends here
