;;; setup-emacs.el --- Configures Emacs              -*- lexical-binding: t; -*-

;; Copyright (C) 2022  Ossian Winter

;; Author: Ossian Winter <ossian@hey.com>
;; Keywords: 

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

;;; Code:

(use-package emacs
  :init
  (setq user-full-name "Ossian Winter")
  (setq user-mail-address "ossian@hey.com")

  (setq make-backup-files nil)
  (setq auto-save-default nil)
  (setq create-lockfiles nil)

  (defalias 'y-r-n-p 'yes-or-no-p))

(provide 'setup-emacs)
;;; setup-emacs.el ends here
