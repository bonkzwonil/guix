;;; Guix --- Nix package management from Guile.         -*- coding: utf-8 -*-
;;; Copyright (C) 2012 Nikita Karetnikov <nikita@karetnikov.org>
;;;
;;; This file is part of Guix.
;;;
;;; Guix is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or (at
;;; your option) any later version.
;;;
;;; Guix is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with Guix.  If not, see <http://www.gnu.org/licenses/>.

(define-module (distro packages cpio)
  #:use-module (distro)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system gnu))

(define-public cpio
  (package
    (name "cpio")
    (version "2.11")
    (source
     (origin
      (method url-fetch)
      (uri (string-append "mirror://gnu/cpio/cpio-"
                          version ".tar.bz2"))
      (sha256
       (base32
        "1gavgpzqwgkpagjxw72xgxz52y1ifgz0ckqh8g7cckz7jvyhp0mv"))))
    (build-system gnu-build-system)
    (arguments
     `(#:patches (list (assoc-ref %build-inputs
                                  "patch/gets"))))
    (inputs
     `(("patch/gets" ,(search-patch "cpio-gets-undeclared.patch"))))
    (home-page "https://www.gnu.org/software/cpio/")
    (synopsis
     "A program to create or extract from cpio archives")
    (description
     "GNU Cpio copies files into or out of a cpio or tar archive. The
archive can be another file on the disk, a magnetic tape, or a pipe.

GNU Cpio supports the following archive formats: binary, old ASCII, new
ASCII, crc, HPUX binary, HPUX old ASCII, old tar, and POSIX.1 tar. The
tar format is provided for compatability with the tar program. By
default, cpio creates binary format archives, for compatibility with
older cpio programs. When extracting from archives, cpio automatically
recognizes which kind of archive it is reading and can read archives
created on machines with a different byte-order.")
    (license "GPLv3+")))