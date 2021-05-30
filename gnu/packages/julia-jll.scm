;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2021 Nicolò Balzarotti <nicolo@nixo.xyz>
;;; Copyright © 2021 Simon Tournier <zimon.toutoune@gmail.com>
;;; Copyright © 2021 Efraim Flashner <efraim@flashner.co.il>
;;;
;;; This file is part of GNU Guix.
;;;
;;; GNU Guix is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or (at
;;; your option) any later version.
;;;
;;; GNU Guix is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with GNU Guix.  If not, see <http://www.gnu.org/licenses/>.

(define-module (gnu packages julia-jll)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix utils)
  #:use-module (guix build-system julia)
  #:use-module (gnu packages)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages fribidi)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages image)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages julia)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xiph))

;;; TODO: Remove this autogenerated source package
;;; and build it from realse source using <https://github.com/JuliaPackaging/Yggdrasil/>

(define-public julia-bzip2-jll
  (package
    (name "julia-bzip2-jll")
    (version "1.0.7+0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/JuliaBinaryWrappers/Bzip2_jll.jl")
             (commit (string-append "Bzip2-v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "188ngx4axdqr55ahv2xssl3cf699l1sxi41j336m9sw8plf4hhk8"))))
    (build-system julia-build-system)
    (arguments
     '(#:tests? #f                      ; No runtests.jl
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'override-binary-path
           (lambda* (#:key inputs #:allow-other-keys)
             (map
              (lambda (wrapper)
                (substitute* wrapper
                  (("generate_wrapper_header.*")
                   (string-append
                    "generate_wrapper_header(\"Bzip2\", \""
                    (assoc-ref inputs "bzip2") "\")\n"))))
              ;; There's a Julia file for each platform, override them all
              (find-files "src/wrappers/" "\\.jl$"))
             #t)))))
    (inputs
     `(("bzip2" ,bzip2)))
    (propagated-inputs
     `(("julia-jllwrappers" ,julia-jllwrappers)))
    (home-page "https://github.com/JuliaBinaryWrappers/Bzip2_jll.jl")
    (synopsis "Bzip2 binary wrappers")
    (description "This Julia module provides a wrapper for the @code{Bzip2}
compression program.")
    (license license:expat)))

(define-public julia-compilersupportlibraries-jll
  (package
    (name "julia-compilersupportlibraries-jll")
    (version "0.4.0+1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/JuliaBinaryWrappers/CompilerSupportLibraries_jll.jl")
             (commit (string-append "CompilerSupportLibraries-v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "03j6xdvps259mhdzpjqf41l65w2l9sahvxg4wrp34hcf69wkrzpy"))))
    (build-system julia-build-system)
    (arguments
     `(#:tests? #f                      ; no runtests.jl
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'override-binary-path
           (lambda* (#:key inputs #:allow-other-keys)
             (map
              (lambda (wrapper)
                (substitute* wrapper
                  (("generate_wrapper_header.*")
                   (string-append
                    "generate_wrapper_header(\"CompilerSupportLibraries\", \""
                    (assoc-ref inputs "gfortran:lib") "\")\n"))))
              ;; There's a Julia file for each platform, override them all
              (find-files "src/wrappers/" "\\.jl$"))
             #t)))))
    (inputs                             ;required by artifacts
     `(("gfortran:lib" ,gfortran "lib")))
    (propagated-inputs
     `(("julia-jllwrappers" ,julia-jllwrappers)))
    (home-page "https://github.com/JuliaBinaryWrappers/CompilerSupportLibraries_jll.jl")
    (synopsis "Internal wrappers")
    (description "This package provides compiler support for libraries.  It is
an autogenerated source package constructed using @code{BinaryBuilder.jl}. The
originating @code{build_tarballs.jl} script can be found on the community
build tree Yggdrasil.")
    (license license:expat)))

(define-public julia-freetype2-jll
  (package
    (name "julia-freetype2-jll")
    (version "2.10.4+0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/JuliaBinaryWrappers/FreeType2_jll.jl")
             (commit (string-append "FreeType2-v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "03lgmb59lipc3bi7z22j4a53bbjmcwkf0xzpwan889p1ix3ry1lr"))))
    (build-system julia-build-system)
    (arguments
     '(#:tests? #f                      ; No runtests.jl
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'override-binary-path
           (lambda* (#:key inputs #:allow-other-keys)
             (map
              (lambda (wrapper)
                (substitute* wrapper
                  (("generate_wrapper_header.*")
                   (string-append
                    "generate_wrapper_header(\"FreeType2\", \""
                    (assoc-ref inputs "freetype") "\")\n"))))
              ;; There's a Julia file for each platform, override them all
              (find-files "src/wrappers/" "\\.jl$"))
             #t)))))
    (inputs
     `(("freetype" ,freetype)))
    (propagated-inputs
     `(("julia-jllwrappers" ,julia-jllwrappers)
       ("julia-bzip2-jll" ,julia-bzip2-jll)
       ("julia-zlib-jll" ,julia-zlib-jll)))
    (home-page "https://github.com/JuliaBinaryWrappers/FreeType2_jll.jl")
    (synopsis "Freetype2 binary wrappers")
    (description "This Julia module provides a wrapper for the freetype font
rendering library.")
    (license license:expat)))

(define-public julia-fribidi-jll
  (package
    (name "julia-fribidi-jll")
    (version "1.0.5+5")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/JuliaBinaryWrappers/FriBidi_jll.jl")
               (commit (string-append "FriBidi-v" version))))
        (file-name (git-file-name name version))
        (sha256
         (base32 "1nmaqhsnm51hyvnbr9riqfp3f636xyxn2ybych598xpkhhjqldwh"))))
    (build-system julia-build-system)
    (arguments
     '(#:tests? #f ; no runtests
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'override-binary-path
           (lambda* (#:key inputs #:allow-other-keys)
             (map
               (lambda (wrapper)
                 (substitute* wrapper
                   (("artifact\"FriBidi\"")
                    (string-append "\"" (assoc-ref inputs "fribidi") "\""))))
               ;; There's a Julia file for each platform, override them all
               (find-files "src/wrappers/" "\\.jl$")))))))
    (inputs
     `(("fribidi" ,fribidi)))
    (propagated-inputs
     `(("julia-jllwrappers" ,julia-jllwrappers)))
    (home-page "https://github.com/JuliaBinaryWrappers/FriBidi_jll.jl")
    (synopsis "Fribidi library wrappers")
    (description "This package provides a wrapper for the fribidi library.")
    (license license:expat)))

(define-public julia-gumbo-jll
  (package
    (name "julia-gumbo-jll")
    (version "0.10.1+1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/JuliaBinaryWrappers/Gumbo_jll.jl")
             (commit (string-append "Gumbo-v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "00a182x5hfpjzyvrxdn8wh4h67q899p5dzqp19a5s22si4g41k76"))))
    (build-system julia-build-system)
    (arguments
     '(#:tests? #f ; no runtests
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'override-binary-path
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((gumbo (string-append (assoc-ref inputs "gumbo-parser"))))
               (for-each
                (lambda (wrapper)
                  (substitute* wrapper
                    (("(const libgumbo = )\"(.*)\"" all const libname)
                     (string-append const "\"" gumbo "/lib/" libname "\"\n"))
                    (("(global artifact_dir =).*" all m)
                     (string-append m " \"" gumbo "\""))))
                ;; There's a Julia file for each platform, override them all
                (find-files "src/wrappers/" "\\.jl$"))))))))
    (inputs
     `(("gumbo-parser" ,gumbo-parser)))
    (propagated-inputs
     `(("julia-jllwrappers" ,julia-jllwrappers)))
    (home-page "https://github.com/JuliaBinaryWrappers/Gumbo_jll.jl")
    (synopsis "Gumbo HTML parsing library wrappers")
    (description "This package provides a wrapper for Gumbo HTML parsing library.")
    (license license:expat)))

(define-public julia-imagemagick-jll
  (package
    (name "julia-imagemagick-jll")
    (version "6.9.10-12+3")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/JuliaBinaryWrappers/ImageMagick_jll.jl")
               (commit (string-append "ImageMagick-v" version))))
        (file-name (git-file-name name version))
        (sha256
         (base32
          "1a0vnnjl52yqi7jgpr0dmx5ah5nlpylv5hc8aw2l89b9f36ff8jg"))))
    (build-system julia-build-system)
    (arguments
     '(#:tests? #f ; no runtests
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'override-binary-path
           (lambda* (#:key inputs #:allow-other-keys)
             (map
               (lambda (wrapper)
                 (substitute* wrapper
                   ;; Make sure we match the current library.
                   (("libMagickWand-6.Q16.so.6") "libMagickWand-6.Q16.so.7")
                   (("artifact\"ImageMagick\"")
                    (string-append "\"" (assoc-ref inputs "imagemagick") "\""))))
               ;; There's a Julia file for each platform, override them all
               (find-files "src/wrappers/" "\\.jl$")))))))
    (propagated-inputs
     `(("julia-jllwrappers" ,julia-jllwrappers)
       ("julia-jpegturbo-jll" ,julia-jpegturbo-jll)
       ("julia-libpng-jll" ,julia-libpng-jll)
       ("julia-libtiff-jll" ,julia-libtiff-jll)
       ("julia-zlib-jll" ,julia-zlib-jll)))
    (inputs
     `(("imagemagick" ,imagemagick)))
    (home-page "https://github.com/JuliaBinaryWrappers/ImageMagick_jll.jl")
    (synopsis "Imagemagick library wrappers")
    (description "This package provides a wrapper for Imagemagick.")
    (license license:expat)))

(define-public julia-jllwrappers
  (package
    (name "julia-jllwrappers")
    (version "1.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/JuliaPackaging/JLLWrappers.jl")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0v7xhsv9z16d657yp47vgc86ggc01i1wigqh3n0d7i1s84z7xa0h"))))
    (arguments
     ;; Wants to download stuff
     '(#:tests? #f
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'custom-override-path
           (lambda* (#:key inputs #:allow-other-keys)
             ;; Make @generate_wrapper_header take an optional argument that
             ;; guix packagers can pass to override the default "override"
             ;; binary path.  This won't be needed when something like
             ;; https://github.com/JuliaPackaging/JLLWrappers.jl/pull/27
             ;; will be merged.
             (substitute* "src/wrapper_generators.jl"
               (("generate_wrapper_header.*")
                "generate_wrapper_header(src_name, override_path = nothing)\n")
               (("pkg_dir = .*" all)
                (string-append
                 all "\n" "override = something(override_path,"
                 "joinpath(dirname(pkg_dir), \"override\"))\n"))
               (("@static if isdir.*") "@static if isdir($override)\n")
               (("return joinpath.*") "return $override\n"))
             #t)))))
    (build-system julia-build-system)
    (home-page "https://github.com/JuliaPackaging/JLLWrappers.jl")
    (synopsis "Julia macros used by JLL packages")
    (description "This package contains Julia macros that enable JLL packages
to generate themselves.  It is not intended to be used by users, but rather is
used in autogenerated packages via @code{BinaryBuilder.jl}.")
    (license license:expat)))

(define-public julia-jpegturbo-jll
  (package
    (name "julia-jpegturbo-jll")
    (version "2.0.1+2")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/JuliaBinaryWrappers/JpegTurbo_jll.jl")
               (commit (string-append "JpegTurbo-v" version))))
        (file-name (git-file-name name version))
        (sha256
         (base32
          "1xp1x0hrj337bgwwffwpyq7xg031j2a38fim29lixqa0a0y80x6y"))))
    (build-system julia-build-system)
    (arguments
     '(#:tests? #f  ; no runtests
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'override-binary-path
           (lambda* (#:key inputs #:allow-other-keys)
             (map
               (lambda (wrapper)
                 (substitute* wrapper
                   (("artifact\"JpegTurbo\"")
                    (string-append "\"" (assoc-ref inputs "libjpeg-turbo") "\""))))
               ;; There's a Julia file for each platform, override them all
               (find-files "src/wrappers/" "\\.jl$")))))))
    (inputs
     `(("libjpeg-turbo" ,libjpeg-turbo)))
    (propagated-inputs
     `(("julia-jllwrappers" ,julia-jllwrappers)))
    (home-page "https://github.com/JuliaBinaryWrappers/JpegTurbo_jll.jl")
    (synopsis "Libjpeg-turbo library wrappers")
    (description "This package provides a wrapper for the libjpeg-turbo library.")
    (license license:expat)))

(define-public julia-lame-jll
  (package
    (name "julia-lame-jll")
    (version "3.100.0+1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/JuliaBinaryWrappers/LAME_jll.jl")
               (commit (string-append "LAME-v" version))))
        (file-name (git-file-name name version))
        (sha256
         (base32 "1ck14hwrapcn5wiazf4m2brkqmlpiqpyr0468p467418av837y1c"))))
    (build-system julia-build-system)
    (arguments
     '(#:tests? #f ; no runtests
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'override-binary-path
           (lambda* (#:key inputs #:allow-other-keys)
             (map
               (lambda (wrapper)
                 (substitute* wrapper
                   (("artifact\"LAME\"")
                    (string-append "\"" (assoc-ref inputs "lame") "\""))))
               ;; There's a Julia file for each platform, override them all
               (find-files "src/wrappers/" "\\.jl$")))))))
    (inputs
     `(("lame" ,lame)))
    (propagated-inputs
     `(("julia-jllwrappers" ,julia-jllwrappers)))
    (home-page "https://github.com/JuliaBinaryWrappers/LAME_jll.jl")
    (synopsis "Lame library wrappers")
    (description "This package provides a wrapper for the lame audio encoder.")
    (license license:expat)))

(define-public julia-libfdk-aac-jll
  (package
    (name "julia-libfdk-aac-jll")
    (version "0.1.6+2")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/JuliaBinaryWrappers/libfdk_aac_jll.jl")
               (commit (string-append "libfdk_aac-v" version))))
        (file-name (git-file-name name version))
        (sha256
         (base32 "0jinb205dn1yfvl0mx7dsah4xj3r8vc3ig8yl72langjc7vrwdn0"))))
    (build-system julia-build-system)
    (arguments
     '(#:tests? #f ; no runtests
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'override-binary-path
           (lambda* (#:key inputs #:allow-other-keys)
             (map
               (lambda (wrapper)
                 (substitute* wrapper
                   (("artifact\"libfdk_aac\"")
                    (string-append "\"" (assoc-ref inputs "libfdk") "\""))))
               ;; There's a Julia file for each platform, override them all
               (find-files "src/wrappers/" "\\.jl$")))))))
    (inputs
     `(("libfdk" ,libfdk)))
    (propagated-inputs
     `(("julia-jllwrappers" ,julia-jllwrappers)))
    (home-page "https://github.com/JuliaBinaryWrappers/libfdk_aac_jll.jl")
    (synopsis "FDK library wrappers")
    (description "This package provides a wrapper for the libfdk audio library.")
    (license license:expat)))

(define-public julia-libpng-jll
  (package
    (name "julia-libpng-jll")
    (version "1.6.37+5")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/JuliaBinaryWrappers/LibPNG_jll.jl")
               (commit (string-append "libpng-v" version))))
        (file-name (git-file-name name version))
        (sha256
         (base32 "10azxv26j8r193dg9i9x7ajm3frhwbhj8zzi40fj59fxm81xz6dx"))))
    (build-system julia-build-system)
    (arguments
     '(#:tests? #f  ; no runtests
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'override-binary-path
           (lambda* (#:key inputs #:allow-other-keys)
             (map
               (lambda (wrapper)
                 (substitute* wrapper
                   (("artifact\"libpng\"")
                    (string-append "\"" (assoc-ref inputs "libpng") "\""))))
               ;; There's a Julia file for each platform, override them all
               (find-files "src/wrappers/" "\\.jl$")))))))
    (inputs
     `(("libpng" ,libpng)))
    (propagated-inputs
     `(("julia-jllwrappers" ,julia-jllwrappers)
       ("julia-zlib-jll" ,julia-zlib-jll)))
    (home-page "https://github.com/JuliaBinaryWrappers/LibPNG_jll.jl")
    (synopsis "Libpng library wrappers")
    (description "This package provides a wrapper for the libpng library.")
    (license license:expat)))

(define-public julia-libtiff-jll
  (package
    (name "julia-libtiff-jll")
    (version "4.1.0+1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/JuliaBinaryWrappers/Libtiff_jll.jl")
               (commit (string-append "Libtiff-v" version))))
        (file-name (git-file-name name version))
        (sha256
         (base32 "07zzhmwmh2g4645ghv76z40hza2ghlb7sw15b1pii7f9kfcsgf45"))))
    (build-system julia-build-system)
    (arguments
     '(#:tests? #f  ; no runtests
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'override-binary-path
           (lambda* (#:key inputs #:allow-other-keys)
             (map
               (lambda (wrapper)
                 (substitute* wrapper
                   (("artifact\"Libtiff\"")
                    (string-append "\"" (assoc-ref inputs "libtiff") "\""))))
               ;; There's a Julia file for each platform, override them all
               (find-files "src/wrappers/" "\\.jl$")))))))
    (inputs
     `(("libtiff" ,libtiff)))
    (propagated-inputs
     `(("julia-jllwrappers" ,julia-jllwrappers)
       ("julia-jpegturbo-jll" ,julia-jpegturbo-jll)
       ("julia-zlib-jll" ,julia-zlib-jll)
       ("julia-zstd-jll" ,julia-zstd-jll)))
    (home-page "https://github.com/JuliaBinaryWrappers/Libtiff_jll.jl")
    (synopsis "Libtiff library wrappers")
    (description "This package provides a wrapper for libtiff")
    (license license:expat)))

(define-public julia-mbedtls-jll
  (package
    (name "julia-mbedtls-jll")
    ;; version 2.25.0+0 is not compatible with current mbedtls 2.23.0,
    ;; upgrade this when mbedtls is updated in guix
    (version "2.24.0+1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/JuliaBinaryWrappers/MbedTLS_jll.jl")
             (commit (string-append "MbedTLS-v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0kk9dlxdh7yms21npgrdfmjbj8q8ng6kdhrzw3jr2d7rp696kp99"))))
    (build-system julia-build-system)
    (arguments
     '(#:tests? #f                      ; No runtests.jl
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'override-binary-path
           (lambda* (#:key inputs #:allow-other-keys)
             (map
              (lambda (wrapper)
                (substitute* wrapper
                  (("generate_wrapper_header.*")
                   (string-append
                    "generate_wrapper_header(\"MbedTLS\", \""
                    (assoc-ref inputs "mbedtls-apache") "\")\n"))))
              ;; There's a Julia file for each platform, override them all
              (find-files "src/wrappers/" "\\.jl$"))
             #t)))))
    (inputs `(("mbedtls-apache" ,mbedtls-apache)))
    (propagated-inputs `(("julia-jllwrappers" ,julia-jllwrappers)))
    (home-page "https://github.com/JuliaBinaryWrappers/MbedTLS_jll.jl")
    (synopsis "Apache's mbed TLS binary wrappers")
    (description "This Julia module provides @code{mbed TLS} libraries and
wrappers.")
    (license license:expat)))

(define-public julia-ogg-jll
  (package
    (name "julia-ogg-jll")
    (version "1.3.4+0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/JuliaBinaryWrappers/Ogg_jll.jl")
               (commit (string-append "Ogg-v" version))))
        (file-name (git-file-name name version))
        (sha256
         (base32 "0p27wgy48gfw8g0hzlvcxrp0346nqnyxa88pydm87ll3sfx9b4ww"))))
    (build-system julia-build-system)
    (arguments
     '(#:tests? #f ; no runtests
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'override-binary-path
           (lambda* (#:key inputs #:allow-other-keys)
             (map
               (lambda (wrapper)
                 (substitute* wrapper
                   (("artifact\"Ogg\"")
                    (string-append "\"" (assoc-ref inputs "libogg") "\""))))
               ;; There's a Julia file for each platform, override them all
               (find-files "src/wrappers/" "\\.jl$")))))))
    (inputs
     `(("libogg" ,libogg)))
    (propagated-inputs
     `(("julia-jllwrappers" ,julia-jllwrappers)))
    (home-page "https://github.com/JuliaBinaryWrappers/Ogg_jll.jl")
    (synopsis "Libogg library wrappers")
    (description "This package provides a wrapper for the libogg library.")
    (license license:expat)))

(define-public julia-openspecfun-jll
  (let ((commit "6c505cce3bdcd9cd2b15b4f9362ec3a42c4da71c"))
    (package
      (name "julia-openspecfun-jll")
      (version "0.5.3+4")                 ;tag not created upstream
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/JuliaBinaryWrappers/OpenSpecFun_jll.jl")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0bl2gcgndsbiwhwy8fl070cjm1fyf9kxj6gkikgirmzgjl29iakn"))))
      (build-system julia-build-system)
      (arguments
       `(#:tests? #f                      ; no runtests.jl
         #:phases
         (modify-phases %standard-phases
           (add-after 'unpack 'override-binary-path
             (lambda* (#:key inputs #:allow-other-keys)
               (map
                (lambda (wrapper)
                  (substitute* wrapper
                    (("generate_wrapper_header.*")
                     (string-append
                      "generate_wrapper_header(\"OpenSpecFun\", \""
                      (assoc-ref inputs "openspecfun") "\")\n"))))
                ;; There's a Julia file for each platform, override them all
                (find-files "src/wrappers/" "\\.jl$"))
               #t)))))
      (inputs
       `(("openspecfun" ,openspecfun)))
      (propagated-inputs
       `(("julia-jllwrappers" ,julia-jllwrappers)
         ("julia-compilersupportlibraries-jll" ,julia-compilersupportlibraries-jll)))
      (home-page "https://github.com/JuliaBinaryWrappers/OpenSpecFun_jll.jl")
      (synopsis "Internal wrappers")
      (description "This package provides a wrapper for OpenSpecFun.  It is an
autogenerated source package constructed using @code{BinaryBuilder.jl}. The
originating @code{build_tarballs.jl} script can be found on the community
build tree Yggdrasil.")
      (license license:expat))))

(define-public julia-x264-jll
  (package
    (name "julia-x264-jll")
    (version "2020.7.14+0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/JuliaBinaryWrappers/x264_jll.jl")
               (commit (string-append "x264-v" version))))
        (file-name (git-file-name name version))
        (sha256
         (base32 "131srmmcwhp9f2x4dq3dw4pzv2z0428mdrb923yzzlm7a89nf28p"))))
    (build-system julia-build-system)
    (arguments
     `(#:tests? #f ; no runtests
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'override-binary-path
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((libx264 (assoc-ref inputs "libx264")))
              (map
               (lambda (wrapper)
                 (substitute* wrapper
                   ;; Make sure we match the current library.
                   (("libx264.so.157")
                    (string-append "libx264.so."
                                   ,(version-major (package-version libx264))))
                   (("artifact\"x264\"")
                    (string-append "\"" libx264 "\""))))
               ;; There's a Julia file for each platform, override them all
               (find-files "src/wrappers/" "\\.jl$"))))))))
    (inputs
     `(("libx264" ,libx264)))
    (propagated-inputs
     `(("julia-jllwrappers" ,julia-jllwrappers)))
    (home-page "https://github.com/JuliaBinaryWrappers/x264_jll.jl")
    (synopsis "x264 library wrappers")
    (description "This package provides a wrapper for the x264 video library.")
    (license license:expat)))

(define-public julia-zlib-jll
  (package
    (name "julia-zlib-jll")
    (version "1.2.12+1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/JuliaBinaryWrappers/Zlib_jll.jl")
               (commit (string-append "Zlib-v" version))))
        (file-name (git-file-name name version))
        (sha256
         (base32 "05ih0haqapkzr40swvq63cafnqlc4yp6yfa1wvdyq8v3n4kxhfqa"))))
    (build-system julia-build-system)
    (arguments
     '(#:tests? #f  ; no runtests
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'override-binary-path
           (lambda* (#:key inputs #:allow-other-keys)
             (map
               (lambda (wrapper)
                 (substitute* wrapper
                   (("generate_wrapper_header.*")
                    (string-append
                      "generate_wrapper_header(\"Zlib\", \""
                      (assoc-ref inputs "zlib") "\")\n"))))
               ;; There's a Julia file for each platform, override them all
               (find-files "src/wrappers/" "\\.jl$")))))))
    (inputs
     `(("zlib" ,zlib)))
    (propagated-inputs
     `(("julia-jllwrappers" ,julia-jllwrappers)))
    (home-page "https://github.com/JuliaBinaryWrappers/Zlib_jll.jl")
    (synopsis "Zlib library wrappers")
    (description "This package provides a wrapper for Zlib.")
    (license license:expat)))

(define-public julia-zstd-jll
  (package
    (name "julia-zstd-jll")
    (version "1.5.0+0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/JuliaBinaryWrappers/Zstd_jll.jl")
               (commit (string-append "Zstd-v" version))))
        (file-name (git-file-name name version))
        (sha256
         (base32 "15g5wsvga4p9bjmx97xqwqdnfzfbwfl6c4a9iaphcncwgcrnw6y6"))))
    (build-system julia-build-system)
    (arguments
     '(#:tests? #f  ; no runtests
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'override-binary-path
           (lambda* (#:key inputs #:allow-other-keys)
             (map
               (lambda (wrapper)
                 (substitute* wrapper
                   (("generate_wrapper_header.*")
                    (string-append
                      "generate_wrapper_header(\"Zstd\", \""
                      (assoc-ref inputs "zstd:lib") "\")\n"))))
               ;; There's a Julia file for each platform, override them all
               (find-files "src/wrappers/" "\\.jl$")))))))
    (inputs
     `(("zstd:lib" ,zstd "lib")))
    (propagated-inputs
     `(("julia-jllwrappers" ,julia-jllwrappers)))
    (home-page "https://github.com/JuliaBinaryWrappers/Zstd_jll.jl")
    (synopsis "Zstd library wrappers")
    (description "This package provides a wrapper for the zstd library.")
    (license license:expat)))
