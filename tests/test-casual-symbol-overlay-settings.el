;;; test-casual-symbol-overlay-settings.el --- Casual IBuffer Settings Tests  -*- lexical-binding: t; -*-

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
(require 'casual-symbol-overlay-settings)

(ert-deftest test-casual-symbol-overlay-settings-tmenu ()
  (casualt-setup)
  (cl-letf ()
    (let ((test-vectors
           '((:binding "G" :command casual-symbol-overlay--customize-group)
             (:binding "u" :command casual-lib-customize-casual-lib-use-unicode)
             (:binding "n" :command casual-lib-customize-casual-lib-hide-navigation)

             (:binding "a" :command casual-symbol-overlay-about)
             (:binding "v" :command casual-symbol-overlay-version))))

      (casualt-suffix-testcase-runner test-vectors
                                      #'casual-symbol-overlay-settings-tmenu
                                      '(lambda () (random 5000)))))
  (casualt-breakdown t))

(ert-deftest test-casual-symbol-overlay-about ()
  (should (stringp (casual-symbol-overlay-about))))

(provide 'test-casual-symbol-overlay-settings)
;;; test-casual-symbol-overlay-setttings.el ends here
