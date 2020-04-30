;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2019 Ivan Petkov <ivanppetkov@gmail.com>
;;; Copyright © 2019, 2020 Efraim Flashner <efraim@flashner.co.il>
;;; Copyright © 2019 Nicolas Goaziou <mail@nicolasgoaziou.fr>
;;; Copyright © 2019 Giacomo Leidi <goodoldpaul@autistici.org>
;;; Copyright © 2019 Tobias Geerinckx-Rice <me@tobias.gr>
;;; Copyright © 2019, 2020 John Soo <jsoo1@asu.edu>
;;; Copyright © 2020 Jakub Kądziołka <kuba@kadziolka.net>
;;; Copyright © 2020 Leo Famulari <leo@famulari.name>
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

(define-module (gnu packages crates-io)
  #:use-module (guix build-system cargo)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (gnu packages)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages jemalloc)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg))

;;;
;;; Please: Try to add new module packages in alphabetic order.
;;;

(define-public rust-abomonation-0.7
  (package
    (name "rust-abomonation")
    (version "0.7.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "abomonation" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1cjg3hjf028n447pdj7zcdgrkngx30as8ndxlxx947wvr49jkrsn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-recycler" ,rust-recycler-0.1))))
    (home-page "https://github.com/TimelyDataflow/abomonation")
    (synopsis "High performance and very unsafe serialization library")
    (description
     "This package provides a high performance and very unsafe serialization
library in Rust.")
    (license license:expat)))

(define-public rust-addr2line-0.11
  (package
    (name "rust-addr2line")
    (version "0.11.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "addr2line" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0sk5g8cb2yynlcm0wcqff9l9c9ml69rqgfrrbii0ybgdc236jkhw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f      ; Not all test files included.
       #:cargo-inputs
       (("rust-rustc-demangle" ,rust-rustc-demangle-0.1)
        ("rust-object" ,rust-object-0.17)
        ("rust-fallible-iterator" ,rust-fallible-iterator-0.2)
        ("rust-cpp-demangle" ,rust-cpp-demangle-0.2)
        ("rust-gimli" ,rust-gimli-0.20)
        ("rust-smallvec" ,rust-smallvec-1)
        ("rust-lazycell" ,rust-lazycell-1.2))
       #:cargo-development-inputs
       (("rust-backtrace" ,rust-backtrace-0.3)
        ("rust-clap" ,rust-clap-2)
        ("rust-findshlibs" ,rust-findshlibs-0.5)
        ("rust-memmap" ,rust-memmap-0.7)
        ("rust-rustc-test" ,rust-rustc-test-0.3))))
    (home-page "https://github.com/gimli-rs/addr2line")
    (synopsis "Symbolication library written in Rust, using gimli")
    (description
     "This package provides a cross-platform symbolication library written in
Rust, using gimli.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-addr2line-0.9
  (package
    (inherit rust-addr2line-0.11)
    (name "rust-addr2line")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "addr2line" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "17rlf04nx3g3rcy661v24ksnmpk6vqn680g5b5sp8lk20iih2xnx"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-cpp-demangle" ,rust-cpp-demangle-0.2)
        ("rust-fallible-iterator" ,rust-fallible-iterator-0.2)
        ("rust-gimli" ,rust-gimli-0.18)
        ("rust-intervaltree" ,rust-intervaltree-0.2)
        ("rust-lazycell" ,rust-lazycell-1.2)
        ("rust-object" ,rust-object-0.12)
        ("rust-rustc-demangle" ,rust-rustc-demangle-0.1)
        ("rust-smallvec" ,rust-smallvec-0.6))
       #:cargo-development-inputs
       (("rust-backtrace" ,rust-backtrace-0.3)
        ("rust-clap" ,rust-clap-2)
        ;("rust-findshlibs" ,rust-findshlibs-0.4)
        ("rust-memmap" ,rust-memmap-0.7)
        ("rust-rustc-test" ,rust-rustc-test-0.3))))))

(define-public rust-adler32-1.0
  (package
    (name "rust-adler32")
    (version "1.0.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "adler32" version))
        (file-name
          (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1hnan4fgmnidgn2k84hh2i67c3wp2c5iwd5hs61yi7gwwx1p6bjx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-development-inputs
       (("rust-rand" ,rust-rand-0.4))))
    (home-page "https://github.com/remram44/adler32-rs")
    (synopsis "Implementation of the Adler32 rolling hash algorithm")
    (description
     "This library is an implementation of the Adler32 rolling hash algorithm in
the Rust programming language.")
    (license (list license:bsd-3
                   license:zlib))))

(define-public rust-afl-0.5
  (package
    (name "rust-afl")
    (version "0.5.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "afl" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0azpi917l8nhvx25n2v670nvkxkrhcwmddfi85qnr6kchmi6y946"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-rustc-version" ,rust-rustc-version-0.2)
        ("rust-cc" ,rust-cc-1.0)
        ("rust-xdg" ,rust-xdg-2.2)
        ("rust-clap" ,rust-clap-2))))
    (home-page "https://github.com/rust-fuzz/afl.rs")
    (synopsis
     "Fuzzing Rust code with american-fuzzy-lop")
    (description
     "Fuzz Rust code with american-fuzzy-lop.")
    (license license:asl2.0)))

(define-public rust-afl-0.4
  (package
    (name "rust-afl")
    (version "0.4.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "afl" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0g2chc18ji7qxi0d03n2ai140qdcww958v5si6rcjnnhmri1vyfb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-cc" ,rust-cc-1.0)
        ("rust-clap" ,rust-clap-2)
        ("rust-rustc-version" ,rust-rustc-version-0.2)
        ("rust-xdg" ,rust-xdg-2.2))))
    (home-page "https://github.com/rust-fuzz/afl.rs")
    (synopsis
     "Fuzzing Rust code with american-fuzzy-lop")
    (description
     "Fuzz Rust code with american-fuzzy-lop.")
    (license license:asl2.0)))

(define-public rust-aho-corasick-0.7
  (package
    (name "rust-aho-corasick")
    (version "0.7.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "aho-corasick" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1nka9509afjgal6lpymn8w2lq11dmjwxs8yjcmzys966if5l05l7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-memchr" ,rust-memchr-2.3))
       #:cargo-development-inputs
       (("rust-doc-comment" ,rust-doc-comment-0.3))))
    (home-page "https://github.com/BurntSushi/aho-corasick")
    (synopsis "Fast multiple substring searching")
    (description
     "Fast multiple substring searching.")
    (license (list license:unlicense license:expat))))

(define-public rust-aho-corasick-0.6
  (package
    (inherit rust-aho-corasick-0.7)
    (name "rust-aho-corasick")
    (version "0.6.10")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "aho-corasick" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "19f8v503ibvlyr824g5ynicrh1lsmp2i0zmpszr8lqay0qw3vkl1"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-memchr" ,rust-memchr-2.2))
       #:cargo-development-inputs
       (("rust-csv" ,rust-csv-1.1)
        ("rust-docopt" ,rust-docopt-1.1)
        ("rust-memmap" ,rust-memmap-0.6)
        ("rust-quickcheck" ,rust-quickcheck-0.7)
        ("rust-rand" ,rust-rand-0.5)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0))))))

(define-public rust-aho-corasick-0.5
  (package
    (inherit rust-aho-corasick-0.6)
    (name "rust-aho-corasick")
    (version "0.5.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "aho-corasick" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0rnvdmlajikq0i4zdy1p3pv699q6apvsxfc7av7byhppllp2r5ya"))))
    (arguments
     `(#:cargo-inputs
       (("rust-memchr" ,rust-memchr-0.1))
       #:cargo-development-inputs
       (("rust-csv" ,rust-csv-0.14)
        ("rust-docopt" ,rust-docopt-0.6)
        ("rust-memmap" ,rust-memmap-0.2)
        ("rust-quickcheck" ,rust-quickcheck-0.2)
        ("rust-rand" ,rust-rand-0.3)
        ("rust-rustc-serialize" ,rust-rustc-serialize-0.3))))))

(define-public rust-alga-0.9
  (package
    (name "rust-alga")
    (version "0.9.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "alga" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1wl4z8ini9269x04g8wwdz1nn3hmmvaaysq4jwhymikyg81kv0jg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-approx" ,rust-approx-0.3)
        ("rust-decimal" ,rust-decimal-2.0)
        ("rust-num-complex" ,rust-num-complex-0.2)
        ("rust-num-traits" ,rust-num-traits-0.2))
       #:cargo-development-inputs
       (("rust-alga-derive" ,rust-alga-derive-0.9)
        ("rust-quickcheck" ,rust-quickcheck-0.8))))
    (home-page "https://github.com/rustsim/alga")
    (synopsis "Abstract algebra for Rust")
    (description "Alga aims to provide solid mathematical abstractions to
algebra-focused applications.  It defines and organizes through trait
inheritance the basic building blocks of general algebraic structures.
Specific implementations of algebraic structure traits are left to other
crates.  Higher-level traits for specialized domains of algebra (like linear
algebra) are also provided and will prove useful for applications that include
code that is generic with regard to the algebraic entity types.")
    (license license:asl2.0)))

(define-public rust-alga-derive-0.9
  (package
    (name "rust-alga-derive")
    (version "0.9.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "alga-derive" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0a2594j6blczz18vfg85agr7vsjrbq6900d3xwxw0zzbqj9j2adz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-edit-distance" ,rust-edit-distance-2.1)
        ("rust-proc-macro2" ,rust-proc-macro2-1.0)
        ("rust-quickcheck" ,rust-quickcheck-0.9)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-1.0))))
    (home-page "https://github.com/rustsim/alga")
    (synopsis "Dutomatic deriving of abstract algebra traits")
    (description "Derive attribute for implementing algebraic traits from the
@code{alga} crate.")
    (license license:asl2.0)))

(define-public rust-andrew-0.2
  (package
    (name "rust-andrew")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "andrew" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0pmklwcwy8g1jras46fz8xcny779zfqpg4riksrbdhkjk3w0jzwv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-line-drawing" ,rust-line-drawing-0.7)
        ("rust-rusttype" ,rust-rusttype-0.7)
        ("rust-walkdir" ,rust-walkdir-2.2)
        ("rust-xdg" ,rust-xdg-2.2)
        ("rust-xml-rs" ,rust-xml-rs-0.8))
       #:cargo-development-inputs
       (("rust-smithay-client-toolkit" ,rust-smithay-client-toolkit-0.4))))
    (inputs
     `(("wayland" ,wayland)))
    (home-page "https://github.com/trimental/andrew")
    (synopsis "Provides convenient drawing of objects to buffers")
    (description
     "The @code{andrew} crate provides convenient drawing of objects such as
shapes, lines and text to buffers.")
    (license license:expat)))

(define-public rust-android-glue-0.2
  (package
    (name "rust-android-glue")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "android-glue" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "01y495x4i9vqkwmklwn2xk7sqg666az2axjcpkr4iwngdwi48100"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/tomaka/android-rs-glue")
    (synopsis "Glue for the Android JNI")
    (description "This package provides the glue for the Android JNI.")
    (license license:expat)))

(define-public rust-ansi-term-0.12
  (package
    (name "rust-ansi-term")
    (version "0.12.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "ansi_term" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1ljmkbilxgmhavxvxqa7qvm6f3fjggi7q2l3a72q9x0cxjvrnanm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-serde" ,rust-serde-1.0)
        ("rust-winapi" ,rust-winapi-0.3))
       #:cargo-development-inputs
       (("rust-doc-comment" ,rust-doc-comment-0.3)
        ("rust-regex" ,rust-regex-1.3)
        ("rust-serde-json" ,rust-serde-json-1.0))))
    (home-page "https://github.com/ogham/rust-ansi-term")
    (synopsis "Library for ANSI terminal colours and styles")
    (description
     "This is a library for controlling colours and formatting, such as red bold
text or blue underlined text, on ANSI terminals.")
    (license license:expat)))

(define-public rust-ansi-term-0.11
  (package
    (inherit rust-ansi-term-0.12)
    (name "rust-ansi-term")
    (version "0.11.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "ansi_term" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "16wpvrghvd0353584i1idnsgm0r3vchg8fyrm0x8ayv1rgvbljgf"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-winapi" ,rust-winapi-0.3))))))

(define-public rust-antidote-1.0
  (package
    (name "rust-antidote")
    (version "1.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "antidote" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "19g2sw2qa2ibnh4x7j1snk46593jgx6y7rnvva496ynq61af5z9l"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/sfackler/rust-antidote")
    (synopsis "Poison-free Mutex and RwLock types")
    (description
     "These types expose identical APIs to the standard library @code{Mutex} and
@code{RwLock} except that they do not return @code{PoisonError}s.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-anyhow-1.0
  (package
    (name "rust-anyhow")
    (version "1.0.26")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "anyhow" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0g6mzcxyj88k8bv8rr3zx4yczgimqvvgr12n14a29sqj6s1zc9bq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-development-inputs
       (("rust-futures" ,rust-futures-0.3)
        ("rust-rustversion" ,rust-rustversion-1.0)
        ("rust-thiserror" ,rust-thiserror-1.0)
        ("rust-trybuild" ,rust-trybuild-1.0))))
    (home-page "https://github.com/dtolnay/anyhow")
    (synopsis "Flexible concrete Error type")
    (description "This package provides a flexible concrete Error type built on
@code{std::error::Error}.")
    (license (list license:expat license:asl2.0))))

(define-public rust-aom-sys-0.1
  (package
    (name "rust-aom-sys")
    (version "0.1.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "aom-sys" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0ix3djcf84kk53h6fac73n7jc614745n7kbmikxwi3s73b6vzgsr"))))
    (build-system cargo-build-system)
    (arguments
     `(;#:skip-build? #t
       #:cargo-inputs
       (("rust-bindgen" ,rust-bindgen-0.51)
        ("rust-metadeps" ,rust-metadeps-1.1))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'set-environmental-variable
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((clang (assoc-ref inputs "libclang")))
               (setenv "LIBCLANG_PATH"
                       (string-append clang "/lib")))
             #t)))))
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (inputs
     `(("libaom" ,libaom)
       ("libclang" ,clang)
       ("llvm" ,llvm)))
    (home-page "https://github.com/rust-av/aom-rs")
    (synopsis "FFI bindings to aom")
    (description "This package provides FFI bindings to aom.")
    (license license:expat)))

(define-public rust-approx-0.3
  (package
    (name "rust-approx")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "approx" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1hx580xjdxl3766js9b49rnbnmr8gw8c060809l43k9f0xshprph"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-num-complex" ,rust-num-complex-0.2)
        ("rust-num-traits" ,rust-num-traits-0.2))))
    (home-page "https://github.com/brendanzab/approx")
    (synopsis
     "Approximate floating point equality comparisons and assertions")
    (description
     "Approximate floating point equality comparisons and assertions.")
    (license license:asl2.0)))

(define-public rust-approx-0.1
  (package
    (inherit rust-approx-0.3)
    (name "rust-approx")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "approx" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "153awzwywmb61xg857b80l63b1x6hifx2pha7lxf6fck9qxwraq8"))))
    (arguments '())))

(define-public rust-arbitrary-0.2
  (package
    (name "rust-arbitrary")
    (version "0.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "arbitrary" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1i3fhcdyjq4isn22xx2svmpfr5hwyzi0wavbm07fs8i2dv5pdkv4"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/nagisa/rust_arbitrary/")
    (synopsis "Trait for generating structured data from unstructured data")
    (description
     "The trait for generating structured data from unstructured data.")
    (license (list license:expat license:asl2.0))))

(define-public rust-arc-swap-0.4
  (package
    (name "rust-arc-swap")
    (version "0.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "arc-swap" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1zwswfi9n7n3hiq51w1xv34572k2diazx680rrxlc9w07c9akf6p"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-crossbeam-utils" ,rust-crossbeam-utils-0.6)
        ("rust-itertools" ,rust-itertools-0.8)
        ("rust-model" ,rust-model-0.1)
        ("rust-num-cpus" ,rust-num-cpus-1.11)
        ("rust-once-cell" ,rust-once-cell-1.2)
        ("rust-proptest" ,rust-proptest-0.8)
        ("rust-version-sync" ,rust-version-sync-0.8))))
    (home-page "https://github.com/vorner/arc-swap")
    (synopsis "Atomically swappable Arc")
    (description "This package provides an atomically swappable Arc.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-arc-swap-0.3
  (package
    (inherit rust-arc-swap-0.4)
    (name "rust-arc-swap")
    (version "0.3.11")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "arc-swap" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ha8724dpki985v52ifq5sd98xvpa5q51hyma52di75dbqbn4imw"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-development-inputs
       (("rust-crossbeam" ,rust-crossbeam-0.7)
        ("rust-crossbeam-utils" ,rust-crossbeam-utils-0.6)
        ("rust-itertools" ,rust-itertools-0.8)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-model" ,rust-model-0.1)
        ("rust-num-cpus" ,rust-num-cpus-1.10)
        ("rust-parking-lot" ,rust-parking-lot-0.8)
        ("rust-proptest" ,rust-proptest-0.9)
        ("rust-version-sync" ,rust-version-sync-0.8))))))

(define-public rust-arg-enum-proc-macro-0.3
  (package
    (name "rust-arg-enum-proc-macro")
    (version "0.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "arg_enum_proc_macro" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "021rr6j3n031ynfbm7kwb3j3bxvbsz40n0nqi78k47d3p92rihcv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1.0)
        ("rust-syn" ,rust-syn-1.0)
        ("rust-quote" ,rust-quote-1.0))))
    (home-page "https://github.com/lu-zero/arg_enum_proc_macro")
    (synopsis "Procedural macro compatible with clap arg_enum")
    (description
     "This package provides a procedural macro compatible with clap's
@code{arg_enum}.")
    (license license:expat)))

(define-public rust-argon2rs-0.2
  (package
    (name "rust-argon2rs")
    (version "0.2.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "argon2rs" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "14mkgkrjd4b4zy92pflz6yb4j1wn2chbd8jczxknxbkdm2vb0rrz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-blake2-rfc" ,rust-blake2-rfc-0.2)
        ("rust-scoped-threadpool" ,rust-scoped-threadpool-0.1))
       #:cargo-development-inputs
       (("rust-cargon" ,rust-cargon-0.0))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-cargo-toml
           (lambda _
             (substitute* "Cargo.toml"
               (("\\{ path =.*,") "{"))
             #t)))))
    (home-page "https://github.com/bryant/argon2rs")
    (synopsis "Rust password hashing library that runs on Argon2")
    (description "This package provides a pure Rust password hashing library
that runs on Argon2.")
    (license license:expat)))

(define-public rust-arrayref-0.3
  (package
    (name "rust-arrayref")
    (version "0.3.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "arrayref" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1vphy316jbgmgckk4z7m8csvlyc8hih9w95iyq48h8077xc2wf0d"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-development-inputs
       (("rust-quickcheck" ,rust-quickcheck-0.6))))
    (home-page "https://github.com/droundy/arrayref")
    (synopsis "Macros to take array references of slices")
    (description
     "Macros to take array references of slices.")
    (license license:bsd-2)))

(define-public rust-arrayvec-0.5
  (package
    (name "rust-arrayvec")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "arrayvec" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1f5mca8kiiwhvhxd1mbnq68j6v6rk139sch567zwwzl6hs37vxyg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-bencher" ,rust-bencher-0.1)
        ("rust-matches" ,rust-matches-0.1)
        ("rust-serde-test" ,rust-serde-test-1.0))))
    (home-page "https://github.com/bluss/arrayvec")
    (synopsis "Vector with fixed capacity")
    (description
     "This package provides a vector with fixed capacity, backed by an
array (it can be stored on the stack too).  Implements fixed capacity
ArrayVec and ArrayString.")
    (license (list license:expat license:asl2.0))))

(define-public rust-arrayvec-0.4
  (package
    (inherit rust-arrayvec-0.5)
    (name "rust-arrayvec")
    (version "0.4.12")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "arrayvec" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1fdiv5m627gh6flp4mpmi1mh647imm9x423licsr11psz97d97yd"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-nodrop" ,rust-nodrop-0.1)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-bencher" ,rust-bencher-0.1)
        ("rust-matches" ,rust-matches-0.1)
        ("rust-serde-test" ,rust-serde-test-1.0))))))

(define-public rust-ascii-1.0
  (package
    (name "rust-ascii")
    (version "1.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "ascii" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0281gc828q4j692gb66jfdr5k16gyszgqflylh0pp30rllv63xdv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-serde" ,rust-serde-1.0)
        ("rust-serde-test" ,rust-serde-test-1.0))))
    (home-page "https://github.com/tomprogrammer/rust-ascii")
    (synopsis "ASCII-only equivalents to `char`, `str` and `String`.")
    (description
     "A rust library that provides ASCII-only string and character types,
equivalent to the @code{char}, @code{str} and @code{String} types in the
standard library.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-ascii-0.9
  (package
    (inherit rust-ascii-1.0)
    (name "rust-ascii")
    (version "0.9.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ascii" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0km3zzkhrr22drf9p1zcblqirlxkdc7zra25acpi0h8qax5c1cga"))))
    (arguments
     `(#:cargo-inputs
       (("rust-quickcheck" ,rust-quickcheck-0.6)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-test" ,rust-serde-test-1.0))))))

(define-public rust-assert-matches-1.3
  (package
    (name "rust-assert-matches")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "assert_matches" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1rar61v00gz2aniid0mylxcr4q98s6l77c3hvbszmg57kj10msvx"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/murarth/assert_matches")
    (synopsis "Asserts that a value matches a pattern")
    (description
     "This package asserts that a value matches a pattern in Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-aster-0.41
  (package
    (name "rust-aster")
    (version "0.41.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "aster" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1q704kn23wnwnrxml7w1mxw6a3xb6386x5wgys6ibnyramrxzksc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-clippy" ,rust-clippy-0.0)
        ("rust-compiletest-rs" ,rust-compiletest-rs-0.2)
        ("rust-syntex-syntax" ,rust-syntex-syntax-0.58))))
    (home-page "https://github.com/serde-rs/aster")
    (synopsis "Libsyntax ast builder")
    (description "This package provides a libsyntax ast builder.")
    (license (list license:expat license:asl2.0))))

(define-public rust-atty-0.2
  (package
    (name "rust-atty")
    (version "0.2.14")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "atty" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1s7yslcs6a28c5vz7jwj63lkfgyx8mx99fdirlhi9lbhhzhrpcyr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-hermit-abi" ,rust-hermit-abi-0.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/softprops/atty")
    (synopsis "Simple interface for querying atty")
    (description
     "This package provides a simple interface for querying atty.")
    (license license:expat)))

(define-public rust-autocfg-1.0
  (package
    (name "rust-autocfg")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "autocfg" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "17cv6pwb4q08s0ynpr4n8hv5299hcmhdgvdchzixfpw8y5qcgapq"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/cuviper/autocfg")
    (synopsis
     "Automatic cfg for Rust compiler features")
    (description
     "Automatic cfg for Rust compiler features.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-autocfg-0.1
  (package
    (inherit rust-autocfg-1.0)
    (name "rust-autocfg")
    (version "0.1.7")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "autocfg" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1chwgimpx5z7xbag7krr9d8asxfqbh683qhgl9kn3hxk2l0djj8x"))))
    (arguments '(#:skip-build? #t))))

(define-public rust-average-0.9
  (package
    (name "rust-average")
    (version "0.9.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "average" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1f8ya00bv6qki9m7b4lb3bn845rj473mx02qpm7wgy5qc1yp75xs"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-conv" ,rust-conv-0.3)
        ("rust-float-ord" ,rust-float-ord-0.2)
        ("rust-num-integer" ,rust-num-integer-0.1)
        ("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-big-array" ,rust-serde-big-array-0.1)
        ("rust-serde-derive" ,rust-serde-derive-1.0))
       #:cargo-development-inputs
       (("rust-bencher" ,rust-bencher-0.1)
        ("rust-quantiles" ,rust-quantiles-0.7)
        ("rust-rand" ,rust-rand-0.6)
        ("rust-serde-json" ,rust-serde-json-1.0)
        ("rust-streaming-stats" ,rust-streaming-stats-0.2))))
    (home-page "https://github.com/vks/average")
    (synopsis "Calculate statistics iteratively")
    (description "This crate provides for calculating statistics iteratively
in Rust.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-backtrace-0.3
  (package
    (name "rust-backtrace")
    (version "0.3.46")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "backtrace" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "17hh1vrhfd01qpjilrdpy7q0lf2j2qv36achpg37q92rff4r5rmi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-addr2line" ,rust-addr2line-0.11)
        ("rust-backtrace-sys" ,rust-backtrace-sys-0.1)
        ("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
        ("rust-cpp-demangle" ,rust-cpp-demangle-0.2)
        ("rust-findshlibs" ,rust-findshlibs-0.5)
        ("rust-goblin" ,rust-goblin-0.2)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-memmap" ,rust-memmap-0.7)
        ("rust-rustc-demangle" ,rust-rustc-demangle-0.1)
        ("rust-rustc-serialize" ,rust-rustc-serialize-0.3)
        ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1.0)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/rust-lang/backtrace-rs")
    (synopsis
     "Acquire a stack trace (backtrace) at runtime in a Rust program")
    (description
     "This package provides a library to acquire a stack
trace (backtrace) at runtime in a Rust program.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-backtrace-sys-0.1
  (package
    (name "rust-backtrace-sys")
    (version "0.1.35")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "backtrace-sys" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "066iviphi72mx9hd3njzsplk5v45jhi10mrccbbyij391ahsps3x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
        ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1.0)
        ("rust-cc" ,rust-cc-1.0))))
    (home-page "https://github.com/rust-lang/backtrace-rs")
    (synopsis "Bindings to the libbacktrace gcc library")
    (description
     "This package provides bindings to the libbacktrace gcc library.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-base64-0.11
  (package
    (name "rust-base64")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "base64" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1iqmims6yvr6vwzyy54qd672zw29ipjj17p8klcr578c9ajpw6xl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-criterion" ,rust-criterion-0.3)
        ("rust-doc-comment" ,rust-doc-comment-0.3)
        ("rust-rand" ,rust-rand-0.6))))
    (home-page "https://github.com/marshallpierce/rust-base64")
    (synopsis "Encodes and decodes base64 as bytes or utf8")
    (description
     "This package encodes and decodes base64 as bytes or utf8.")
    (license (list license:expat license:asl2.0))))

(define-public rust-base64-0.10
  (package
    (inherit rust-base64-0.11)
    (name "rust-base64")
    (version "0.10.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "base64" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "13k6bvd3n6dm7jqn9x918w65dd9xhx454bqphbnv0bkd6n9dj98b"))))
    (arguments
     `(#:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1.3))
       #:cargo-development-inputs
       (("rust-criterion" ,rust-criterion-0.2)
        ("rust-rand" ,rust-rand-0.4))))))

(define-public rust-base-x-0.2
  (package
    (name "rust-base-x")
    (version "0.2.6")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "base-x" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1hfy0wv7j5ynd73yk1vyr32pqa77rp15lkrc54f8ky9c6hcbc80v"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-development-inputs
       (("rust-bencher" ,rust-bencher-0.1)
        ("rust-json" ,rust-json-0.11)
        ("rust-rand" ,rust-rand-0.3))))
    (home-page "https://github.com/OrKoN/base-x-rs")
    (synopsis "Encode/decode any base")
    (description "This library provides for encoding and decoding any base.")
    (license license:expat)))

(define-public rust-bencher-0.1
  (package
    (name "rust-bencher")
    (version "0.1.5")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "bencher" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1x8p2xblgqssay8cdykp5pkfc0np0jk5bs5cx4f5av097aav9zbx"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/bluss/bencher/")
    (synopsis "Port of the libtest benchmark runner to Rust stable")
    (description "This package provides a port of the libtest (unstable Rust)
benchmark runner to Rust stable releases.  Supports running benchmarks and
filtering based on the name.  Benchmark execution works exactly the same way
and no more (caveat: black_box is still missing!).")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-better-panic-0.2
  (package
    (name "rust-better-panic")
    (version "0.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "better-panic" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0xl48v6pd9ys7wp0ni62i6q73xpd1nhf92z09sjc9n3lrj0ac4ix"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-backtrace" ,rust-backtrace-0.3)
        ("rust-console" ,rust-console-0.9)
        ("rust-syntect" ,rust-syntect-3.3))))
    (home-page "https://github.com/mitsuhiko/better-panic")
    (synopsis "Pretty backtraces inspired by Python's tracebacks")
    (description
     "This package provides pretty panic backtraces inspired by Python's
tracebacks.")
    (license (list license:expat license:asl2.0))))

(define-public rust-bincode-1.2
  (package
    (name "rust-bincode")
    (version "1.2.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "bincode" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1gvxm3n67xv1874fwxmnlircdlphlk1hcw75ykrrnw9l2nky4lsp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-serde" ,rust-serde-1.0)
        ("rust-byteorder" ,rust-byteorder-1.3))
       #:cargo-development-inputs
       (("rust-serde-bytes" ,rust-serde-bytes-0.11)
        ("rust-serde-derive" ,rust-serde-derive-1.0))))
    (home-page "https://github.com/servo/bincode")
    (synopsis
     "Binary serialization/deserialization strategy")
    (description
     "This package provides a binary serialization/deserialization strategy
that uses Serde for transforming structs into bytes and vice versa!")
    (license license:expat)))

(define-public rust-bincode-1.1
  (package
    (inherit rust-bincode-1.2)
    (name "rust-bincode")
    (version "1.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bincode" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1xx6bp39irvsndk6prnmmq8m1l9p6q2qj21j6mfks2y81pjsa14z"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-autocfg" ,rust-autocfg-0.1)
        ("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-serde-bytes" ,rust-serde-bytes-0.11)
        ("rust-serde-derive" ,rust-serde-derive-1.0))))))

(define-public rust-bindgen-0.52
  (package
    (name "rust-bindgen")
    (version "0.52.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "bindgen" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0mzy2gjiaggl602yn4a11xzrxfj18kl7pwqa5yv32njkxd257j7i"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-shlex" ,rust-shlex-0.1)
        ("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-peeking-take-while"
         ,rust-peeking-take-while-0.1)
        ("rust-clang-sys" ,rust-clang-sys-0.28)
        ("rust-cexpr" ,rust-cexpr-0.3)
        ("rust-log" ,rust-log-0.4)
        ("rust-env-logger" ,rust-env-logger-0.7)
        ("rust-proc-macro2" ,rust-proc-macro2-1.0)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-rustc-hash" ,rust-rustc-hash-1.1)
        ("rust-bitflags" ,rust-bitflags-1)
        ("rust-lazycell" ,rust-lazycell-1.2)
        ("rust-regex" ,rust-regex-1.3)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-clap" ,rust-clap-2)
        ("rust-which" ,rust-which-3.1))
       #:cargo-development-inputs
       (("rust-clap" ,rust-clap-2)
        ("rust-diff" ,rust-diff-0.1)
        ("rust-shlex" ,rust-shlex-0.1))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'set-environmental-variable
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((clang (assoc-ref inputs "libclang")))
               (setenv "LIBCLANG_PATH"
                       (string-append clang "/lib")))
             #t)))))
    (inputs
     `(("libclang" ,clang)))
    (home-page "https://rust-lang.github.io/rust-bindgen/")
    (synopsis
     "Automatically generates Rust FFI bindings to C and C++ libraries")
    (description
     "Automatically generates Rust FFI bindings to C and C++ libraries.")
    (license license:bsd-3)))

(define-public rust-bindgen-0.51
  (package
    (inherit rust-bindgen-0.52)
    (name "rust-bindgen")
    (version "0.51.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "bindgen" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0x9gndlnwmxsihxvsc3izyyss7g8b2djn0daafshj1gcy69i7mzb"))))
    (arguments
     `(#:cargo-inputs
       (("rust-shlex" ,rust-shlex-0.1)
        ("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-peeking-take-while"
         ,rust-peeking-take-while-0.1)
        ("rust-clang-sys" ,rust-clang-sys-0.28)
        ("rust-cexpr" ,rust-cexpr-0.3)
        ("rust-log" ,rust-log-0.4)
        ("rust-env-logger" ,rust-env-logger-0.6)
        ("rust-proc-macro2" ,rust-proc-macro2-1.0)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-rustc-hash" ,rust-rustc-hash-1.1)
        ("rust-bitflags" ,rust-bitflags-1)
        ("rust-regex" ,rust-regex-1.3)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-clap" ,rust-clap-2)
        ("rust-which" ,rust-which-3.1))
       #:cargo-development-inputs
       (("rust-clap" ,rust-clap-2)
        ("rust-diff" ,rust-diff-0.1)
        ("rust-shlex" ,rust-shlex-0.1))))
    (inputs `())))

(define-public rust-bindgen-0.50
  (package
    (inherit rust-bindgen-0.51)
    (name "rust-bindgen")
    (version "0.50.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bindgen" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1fp98x0k4cawil3rqxsfrb58pq3mb5mn37rp745zxfmjfigml3nb"))))
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-cexpr" ,rust-cexpr-0.3)
        ("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-clang-sys" ,rust-clang-sys-0.28)
        ("rust-clap" ,rust-clap-2)
        ("rust-env-logger" ,rust-env-logger-0.6)
        ("rust-fxhash" ,rust-fxhash-0.2)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-log" ,rust-log-0.4)
        ("rust-peeking-take-while" ,rust-peeking-take-while-0.1)
        ("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-0.6)
        ("rust-regex" ,rust-regex-1.1)
        ("rust-shlex" ,rust-shlex-0.1)
        ("rust-which" ,rust-which-2.0))
       #:cargo-development-inputs
       (("rust-clap" ,rust-clap-2)
        ("rust-diff" ,rust-diff-0.1)
        ("rust-shlex" ,rust-shlex-0.1))))))

(define-public rust-bindgen-0.37
  (package
    (inherit rust-bindgen-0.50)
    (name "rust-bindgen")
    (version "0.37.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "bindgen" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "08f2cyzr8fc027mzj2lhmn5j3w318g2ql7yfw5ngxa3yhy1an98v"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-peeking-take-while"
         ,rust-peeking-take-while-0.1)
        ("rust-cexpr" ,rust-cexpr-0.2)
        ("rust-clang-sys" ,rust-clang-sys-0.23)
        ("rust-proc-macro2" ,rust-proc-macro2-0.3)  ; 0.3.5
        ("rust-log" ,rust-log-0.4)
        ("rust-env-logger" ,rust-env-logger-0.5)
        ("rust-quote" ,rust-quote-0.5)
        ("rust-which" ,rust-which-1.0)
        ("rust-regex" ,rust-regex-1.3)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-clap" ,rust-clap-2))
       #:cargo-development-inputs
       (("rust-clap" ,rust-clap-2)
        ("rust-diff" ,rust-diff-0.1)
        ("rust-shlex" ,rust-shlex-0.1))))))

(define-public rust-bindgen-0.33
  (package
    (inherit rust-bindgen-0.50)
    (name "rust-bindgen")
    (version "0.33.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bindgen" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0vnw5fb74gl9pgnimgbrkac1xgwrjz86pqilx20rbkia77cdhgk0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cexpr" ,rust-cexpr-0.2)
        ("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-clang-sys" ,rust-clang-sys-0.22)
        ("rust-clap" ,rust-clap-2)
        ("rust-env-logger" ,rust-env-logger-0.5)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-log" ,rust-log-0.4)
        ("rust-peeking-take-while" ,rust-peeking-take-while-0.1)
        ("rust-quote" ,rust-quote-0.3)
        ("rust-regex" ,rust-regex-0.2)
        ("rust-which" ,rust-which-1.0))
       #:cargo-development-inputs
       (("rust-clap" ,rust-clap-2)
        ("rust-diff" ,rust-diff-0.1)
        ("rust-shlex" ,rust-shlex-0.1))))))

(define-public rust-bit-set-0.5
  (package
    (name "rust-bit-set")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bit-set" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "100ac8867bvbx9kv634w4xjk98b71i8nq4wdcvpf3cf4ha4j6k78"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-bit-vec" ,rust-bit-vec-0.5))
       #:cargo-development-inputs
       (("rust-rand" ,rust-rand-0.4))))
    (home-page "https://github.com/contain-rs/bit-set")
    (synopsis "Set of bits")
    (description
     "This package provides a set of bits.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-bit-vec-0.5
  (package
    (name "rust-bit-vec")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bit-vec" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1fyh8221s6cxlmng01v8v2ljhavzawqqs8r1xjc66ap5sjavx6zm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-serde-json" ,rust-serde-json-1.0))))
    (home-page "https://github.com/contain-rs/bit-vec")
    (synopsis "Vector of bits")
    (description
     "This package provides a vector of bits.")
    (license (list license:expat license:asl2.0))))

(define-public rust-bitflags-1
  (package
    (name "rust-bitflags")
    (version "1.2.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "bitflags" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "14qnd5nq8p2almk79m4m8ydqhd413yaxsyjp5xd19g3mikzf47fg"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/bitflags/bitflags")
    (synopsis "Macro to generate structures which behave like bitflags")
    (description "This package provides a macro to generate structures which
behave like a set of bitflags.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-bitflags-0.8
  (package
    (inherit rust-bitflags-1)
    (name "rust-bitflags")
    (version "0.8.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bitflags" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1x5z8hmirpnapkx6sww8gkc6x0q8ppni0lbsigm3mrba5byfjw0k"))))))

(define-public rust-bitflags-0.7
  (package
    (inherit rust-bitflags-1)
    (name "rust-bitflags")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bitflags" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0v8hh6wdkpk9my8z8442g4hqrqf05h0qj53dsay6mv18lqvqklda"))))))

(define-public rust-bitstream-io-0.8
  (package
    (name "rust-bitstream-io")
    (version "0.8.5")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "bitstream-io" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "00a6wy54s1dmadm5xz8k2cbsd7ixvm48mlc45bk0fdy0pbra6jk1"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
      "https://github.com/tuffy/bitstream-io")
    (synopsis
      "Library for reading/writing un-aligned values from/to streams in big-endian and little-endian formats.")
    (description
      "Library for reading/writing un-aligned values from/to streams in big-endian and little-endian formats.")
    (license (list license:expat license:asl2.0))))

(define-public rust-blake2-0.8
  (package
    (name "rust-blake2")
    (version "0.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "blake2" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0c4k11j04kqhkci6i9b7lz6p13kpcv228pdqixgrawvavaq0gjwl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-byte-tools" ,rust-byte-tools-0.3)
        ("rust-crypto-mac" ,rust-crypto-mac-0.7)
        ("rust-digest" ,rust-digest-0.8)
        ("rust-opaque-debug" ,rust-opaque-debug-0.2))
       #:cargo-development-inputs
       (("rust-crypto-mac" ,rust-crypto-mac-0.7)
        ("rust-digest" ,rust-digest-0.8)
        ("rust-hex-literal" ,rust-hex-literal-0.1))))
    (home-page "https://github.com/RustCrypto/hashes")
    (synopsis "BLAKE2 hash functions")
    (description "This package provides BLAKE2 hash functions in Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-blake2-rfc-0.2
  (package
    (name "rust-blake2-rfc")
    (version "0.2.18")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "blake2-rfc" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0034g47hyq2bzmk40895ill1mbnpmmjakdq3dmm9clidvl5m6vax"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-arrayvec" ,rust-arrayvec-0.4)
        ("rust-clippy" ,rust-clippy-0.0)
        ("rust-constant-time-eq" ,rust-constant-time-eq-0.1))
       #:cargo-development-inputs
       (("rust-data-encoding" ,rust-data-encoding-2.1))))
    (home-page "https://github.com/cesarb/blake2-rfc")
    (synopsis "Rust implementation of BLAKE2 based on RFC 7693")
    (description
     "This package provides a pure Rust implementation of BLAKE2 based on RFC
7693.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-blake2b-simd-0.5
  (package
    (name "rust-blake2b-simd")
    (version "0.5.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "blake2b-simd" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "12icvk8ixlivv3jv5nyrg01sajp4s279zb1kmif0nfja4ms2vyyq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-arrayref" ,rust-arrayref-0.3)
        ("rust-arrayvec" ,rust-arrayvec-0.5)
        ("rust-constant-time-eq" ,rust-constant-time-eq-0.1))))
    (home-page "https://github.com/oconnor663/blake2_simd")
    (synopsis "Pure Rust BLAKE2b implementation with dynamic SIMD")
    (description
     "This package provides a pure Rust implementation of the BLAKE2b and
BLAKE2bp hash functions.")
    (license license:expat)))

(define-public rust-blas-sys-0.7
  (package
    (name "rust-blas-sys")
    (version "0.7.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "blas-sys" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0h14zjycwc76v15h8qll9z1xiryvmpvsb5gam97pqpdjrrwv5c8k"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/blas-lapack-rs/blas-sys")
    (synopsis "Bindings to BLAS (Fortran)")
    (description
     "Ths package provides bindings to BLAS (Fortran).")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-blobby-0.1
  (package
    (name "rust-blobby")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "blobby" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1xicpf3s2mi5xqnx8ps5mdych4ib5nh2nfsbrsg8ar8bjk1girbg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1.3))
       #:cargo-development-inputs
       (("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-hex" ,rust-hex-0.3))))
    (home-page "https://github.com/RustCrypto/utils")
    (synopsis "Iterator over simple binary blob storage")
    (description
     "Iterator over simple binary blob storage.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-block-0.1
  (package
    (name "rust-block")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "block" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "16k9jgll25pzsq14f244q22cdv0zb4bqacldg3kx6h89d7piz30d"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-development-inputs
       (("rust-objc-test-utils" ,rust-objc-test-utils-0.0))))
    (home-page "http://github.com/SSheldon/rust-block")
    (synopsis "Rust interface for Apple's C language extension of blocks")
    (description "This package provides a rust interface for Apple's C language
extension of blocks.")
    (license license:expat)))

(define-public rust-block-buffer-0.7
  (package
    (name "rust-block-buffer")
    (version "0.7.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "block-buffer" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "12v8wizynqin0hqf140kmp9s38q223mp1b0hkqk8j5pk8720v560"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-block-padding" ,rust-block-padding-0.1)
        ("rust-byte-tools" ,rust-byte-tools-0.3)
        ("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-generic-array" ,rust-generic-array-0.12))))
    (home-page "https://github.com/RustCrypto/utils")
    (synopsis "Fixed size buffer for block processing of data")
    (description
     "Fixed size buffer for block processing of data.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-block-padding-0.1
  (package
    (name "rust-block-padding")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "block-padding" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "02fz9wx5dmgpc79ndrb9xfxqlrkk7lg5wki2blz2zqg27spw6kbd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-byte-tools" ,rust-byte-tools-0.3))))
    (home-page "https://github.com/RustCrypto/utils")
    (synopsis "Padding and unpadding of messages divided into blocks")
    (description
     "Padding and unpadding of messages divided into blocks.")
    (license (list license:asl1.1 license:expat))))

(define-public rust-bresenham-0.1
  (package
    (name "rust-bresenham")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bresenham" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1mvg3zcyll0m3z79jwbg183ha4kb7bw06rd286ijwvgn4mi13hdz"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/mbr/bresenham-rs")
    (synopsis
     "Iterator-based integer-only implementation of Bresenham's line algorithm")
    (description
     "This package provides a fast, iterator-based integer-only implementation of
Bresenham's line algorithm.")
    (license license:expat)))

(define-public rust-bstr-0.2
  (package
    (name "rust-bstr")
    (version "0.2.12")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bstr" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0hazfback6i2k3vhhwyj8h46id3y58zxqh22pz46hj9r1zayd298"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-memchr" ,rust-memchr-2.2)
        ("rust-regex-automata" ,rust-regex-automata-0.1)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-quickcheck" ,rust-quickcheck-0.8)
        ("rust-ucd-parse" ,rust-ucd-parse-0.1)
        ("rust-unicode-segmentation" ,rust-unicode-segmentation-1.3))))
    (home-page "https://github.com/BurntSushi/bstr")
    (synopsis
     "String type that is not required to be valid UTF-8")
    (description
     "This package provides a string type that is not required to be valid
UTF-8.")
    (license (list license:expat license:asl2.0))))

(define-public rust-bstr-0.1
  (package
    (inherit rust-bstr-0.2)
    (name "rust-bstr")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bstr" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0nzi9vqhl56ws8gq39f3aj4qjrr4l3g5lbkkcj8xq1x4cb74wq2r"))))))

(define-public rust-bumpalo-3
  (package
    (name "rust-bumpalo")
    (version "3.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bumpalo" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "11silgpsnfv6ir7j2nh7a69564f92vq20k9ha7zcbynpiav9vbhj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f      ; cargo_readme_up_to_date test fails
       #:cargo-development-inputs
       (("rust-criterion" ,rust-criterion-0.3)
        ("rust-quickcheck" ,rust-quickcheck-0.9))))
    (home-page "https://github.com/fitzgen/bumpalo")
    (synopsis "Fast bump allocation arena for Rust")
    (description
     "This package provides a fast bump allocation arena for Rust.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-bumpalo-2.5
  (package
    (inherit rust-bumpalo-3)
    (name "rust-bumpalo")
    (version "2.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bumpalo" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "018b5calz3895v04shk9bn7i73r4zf8yf7p1dqg92s3xya13vm1c"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-development-inputs
       (("rust-criterion" ,rust-criterion-0.2)
        ("rust-quickcheck" ,rust-quickcheck-0.8))))))

(define-public rust-byte-tools-0.3
  (package
    (name "rust-byte-tools")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "byte-tools" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1mqi29wsm8njpl51pfwr31wmpzs5ahlcb40wsjyd92l90ixcmdg3"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/RustCrypto/utils")
    (synopsis "Bytes related utility functions")
    (description "Bytes related utility functions.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-bytecount-0.5
  (package
    (name "rust-bytecount")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bytecount" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0z6a280kiy4kg5v3qw97pbyvwycr17fsm41804i8zpq7nmads3xy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-packed-simd" ,rust-packed-simd-0.3))
       #:cargo-development-inputs
       (("rust-criterion" ,rust-criterion-0.2)
        ("rust-quickcheck" ,rust-quickcheck-0.8)
        ("rust-rand" ,rust-rand-0.4))))
    (home-page "https://github.com/llogiq/bytecount")
    (synopsis "Count occurrences of a given byte")
    (description
     "Count occurrences of a given byte, or the number of UTF-8 code points,
in a byte slice, fast.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-bytecount-0.4
  (package
    (name "rust-bytecount")
    (version "0.4.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "bytecount" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "13qpy38z5wx0rzcdvr2h0ixbfgi1dbrif068il3hwn3k2mah88mr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-packed-simd" ,rust-packed-simd-0.3))
       #:cargo-development-inputs
       (("rust-criterion" ,rust-criterion-0.2)
        ("rust-quickcheck" ,rust-quickcheck-0.6)
        ("rust-rand" ,rust-rand-0.4))))
    (home-page "https://github.com/llogiq/bytecount")
    (synopsis "Counting bytes really fast")
    (description
     "This package counts occurrences of a given byte, or the number of UTF-8
code points, in a byte slice, fast.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-byteorder-1.3
  (package
    (name "rust-byteorder")
    (version "1.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "byteorder" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1pkjfhgjnq898g1d38ygcfi0msg3m6756cwv0sgysj1d26p8mi08"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-doc-comment" ,rust-doc-comment-0.3)
        ("rust-quickcheck" ,rust-quickcheck-0.8)
        ("rust-rand" ,rust-rand-0.6))))
    (home-page
     "https://github.com/BurntSushi/byteorder")
    (synopsis
     "Reading/writing numbers in big-endian and little-endian")
    (description
     "Library for reading/writing numbers in big-endian and
little-endian.")
    (license (list license:expat license:unlicense))))

(define-public rust-byteorder-0.5
  (package
    (inherit rust-byteorder-1.3)
    (name "rust-byteorder")
    (version "0.5.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "byteorder" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ma8pkyz1jbglr29m1yzlc9ghmv6672nvsrn7zd0yn5jqs60xh8g"))))
    (arguments
     `(#:tests? #f
       #:cargo-development-inputs
       (("rust-quickcheck" ,rust-quickcheck-0.2)
        ("rust-rand" ,rust-rand-0.3))))))

(define-public rust-bytes-0.4
  (package
    (name "rust-bytes")
    (version "0.4.12")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bytes" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0768a55q2fsqdjsvcv98ndg9dq7w2g44dvq1avhwpxrdzbydyvr0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-either" ,rust-either-1.5)
        ("rust-iovec" ,rust-iovec-0.1)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-serde-test" ,rust-serde-test-1.0))))
    (home-page "https://github.com/tokio-rs/bytes")
    (synopsis
     "Types and traits for working with bytes")
    (description
     "Types and traits for working with bytes.")
    (license license:expat)))

(define-public rust-bytes-0.3
  (package
    (inherit rust-bytes-0.4)
    (name "rust-bytes")
    (version "0.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "bytes" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "09vcp9kh12pva2xn2ir79k90v1a0id8f4sdv1abn5ifw2bqsyaf1"))))
    (arguments
     `(#:tests? #f      ; Tests not distributed in crate.
       #:cargo-development-inputs
       (("rust-rand" ,rust-rand-0.3))))))

(define-public rust-bzip2-0.3
  (package
    (name "rust-bzip2")
    (version "0.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bzip2" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0fvfwanp42j1zpig880jhb5mc0na50bijmwd6211p77sy35w7ds2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bzip2-sys" ,rust-bzip2-sys-0.1)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-tokio-io" ,rust-tokio-io-0.1))
       #:cargo-development-inputs
       (("rust-partial-io" ,rust-partial-io-0.2)
        ("rust-quickcheck" ,rust-quickcheck-0.4)
        ("rust-rand" ,rust-rand-0.3)
        ("rust-tokio-core" ,rust-tokio-core-0.1))))
    (home-page "https://github.com/alexcrichton/bzip2-rs")
    (synopsis
     "Rust bindings to libbzip2 for bzip2 compression and decompression")
    (description
     "Bindings to @code{libbzip2} for @code{bzip2} compression and decompression
exposed as Reader/Writer streams.")
    (license (list license:expat license:asl2.0))))

(define-public rust-bzip2-sys-0.1
  (package
    (name "rust-bzip2-sys")
    (version "0.1.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bzip2-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0pz2mdhkk8yphiqdh2kghdxb60kqyd10lfrjym3r4k5dylvam135"))
        (modules '((guix build utils)))
        (snippet
         '(begin
            (delete-file-recursively "bzip2-1.0.6")
            (delete-file "build.rs")
            ;; Inspired by Debian's patch.
            (with-output-to-file "build.rs"
              (lambda _
                (format #t "fn main() {~@
                        println!(\"cargo:rustc-link-lib=bz2\");~@
                        }~%")))
            #t))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-cc" ,rust-cc-1.0))))
    (home-page "https://github.com/alexcrichton/bzip2-rs")
    (synopsis "Rust bindings to libbzip2")
    (description
     "Bindings to @code{libbzip2} for bzip2 compression and decompression
exposed as Reader/Writer streams.")
    (license (list license:expat license:asl2.0))))

(define-public rust-c2-chacha-0.2
  (package
    (name "rust-c2-chacha")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "c2-chacha" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "00a11qdc8mg3z0k613rhprkc9p6xz0y7b1681x32ixg0hr3x0r3x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-ppv-lite86" ,rust-ppv-lite86-0.2)
        ("rust-stream-cipher" ,rust-stream-cipher-0.3))
       #:cargo-development-inputs
       (("rust-hex-literal" ,rust-hex-literal-0.2))))
    (home-page "https://github.com/cryptocorrosion/cryptocorrosion")
    (synopsis "The ChaCha family of stream ciphers")
    (description
     "The ChaCha family of stream ciphers.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-cairo-rs-0.8
  (package
    (name "rust-cairo-rs")
    (version "0.8.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "cairo-rs" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "11303v1fv6hsc9n70ak380gknkf0098phpcxqdhkmahqjsx4jw0m"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-cairo-sys-rs" ,rust-cairo-sys-rs-0.9)
        ("rust-glib" ,rust-glib-0.9)
        ("rust-glib-sys" ,rust-glib-sys-0.9)
        ("rust-gobject-sys" ,rust-gobject-sys-0.9)
        ("rust-libc" ,rust-libc-0.2))
       #:cargo-development-inputs
       (("rust-gtk-rs-lgpl-docs" ,rust-gtk-rs-lgpl-docs-0.1)
        ("rust-tempfile" ,rust-tempfile-3.1))))
    (inputs
     `(("cairo" ,cairo)))
    (home-page "https://gtk-rs.org/")
    (synopsis "Rust bindings for the Cairo library")
    (description
     "Rust bindings for the Cairo library.")
    (license license:expat)))

(define-public rust-cairo-rs-0.7
  (package
    (inherit rust-cairo-rs-0.8)
    (name "rust-cairo-rs")
    (version "0.7.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "cairo-rs" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "171m98g41avp5mmshqir4ka21napp7ma5fx45wi9mw5hwdyv8pg0"))))
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-cairo-sys-rs" ,rust-cairo-sys-rs-0.9)
        ("rust-glib" ,rust-glib-0.8)
        ("rust-glib-sys" ,rust-glib-sys-0.9)
        ("rust-gobject-sys" ,rust-gobject-sys-0.9)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-gtk-rs-lgpl-docs" ,rust-gtk-rs-lgpl-docs-0.1))
       #:cargo-development-inputs
       (("rust-tempfile" ,rust-tempfile-3.1))))))

(define-public rust-cairo-sys-rs-0.9
  (package
    (name "rust-cairo-sys-rs")
    (version "0.9.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "cairo-sys-rs" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0qsdy6s57yvscg2rfm7wdqrlhzbn1aq9lhk3dy1vw5f7r81blrgz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-glib-sys" ,rust-glib-sys-0.9)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-winapi" ,rust-winapi-0.3)
        ("rust-x11" ,rust-x11-2)
        ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (inputs
     `(("cairo" ,cairo)))
    (home-page "https://gtk-rs.org/")
    (synopsis "FFI bindings to libcairo")
    (description "This package provides FFI bindings to libcairo.")
    (license license:expat)))

(define-public rust-calloop-0.4
  (package
    (name "rust-calloop")
    (version "0.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "calloop" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0q6ic9lr0s86886mbyn4yncg68b2sykgwjf3iygdw01swmxhk8ks"))
        (modules '((guix build utils)))
        (snippet
         '(begin
            (substitute* "Cargo.toml"
              (("=1.0.0") "^1.0.0"))
            #t))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-mio" ,rust-mio-0.6)
        ("rust-mio-extras" ,rust-mio-extras-2)
        ("rust-nix" ,rust-nix-0.14))
       #:cargo-development-inputs
       (("rust-lazycell" ,rust-lazycell-1.2))))
    (home-page "https://github.com/Smithay/calloop")
    (synopsis "Callback-based event loop")
    (description
     "This package provides a callback-based event loop")
    (license license:expat)))

(define-public rust-caps-0.3
  (package
    (name "rust-caps")
    (version "0.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "caps" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1vplgzx8nifzr3f0l8ca77jqnz3fdymdg0ickacgdvawc44a3n90"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-errno" ,rust-errno-0.2)
        ("rust-error-chain" ,rust-error-chain-0.12)
        ("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/lucab/caps-rs")
    (synopsis "Pure-Rust library to work with Linux capabilities")
    (description
     "This package provides a pure-Rust library to work with Linux
capabilities")
    (license (list license:expat license:asl2.0))))

(define-public rust-cargo-metadata-0.9
  (package
    (name "rust-cargo-metadata")
    (version "0.9.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "cargo_metadata" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "00pjms89lghvizh4d55lz80hvrih9r55xv9m5wd9vcsgc163gqs6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f
       #:cargo-inputs
       (("rust-semver" ,rust-semver-0.9)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-serde-json" ,rust-serde-json-1.0))
       #:cargo-development-inputs
       (("rust-clap" ,rust-clap-2)
        ("rust-docopt" ,rust-docopt-1.1)
        ("rust-structopt" ,rust-structopt-0.2))))
    (home-page "https://github.com/oli-obk/cargo_metadata")
    (synopsis "Structured access to the output of `cargo metadata`")
    (description
     "This package provides structured access to the output of @code{cargo
metadata}.")
    (license license:expat)))

(define-public rust-cargo-metadata-0.6
  (package
    (inherit rust-cargo-metadata-0.9)
    (name "rust-cargo-metadata")
    (version "0.6.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "cargo_metadata" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1givpi2w7iwqqnl87x5yc15zcm5hs6yw490sb6abkfp1h39v9lg5"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-error-chain" ,rust-error-chain-0.12)
        ("rust-semver" ,rust-semver-0.9)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-serde-json" ,rust-serde-json-1.0))
       #:cargo-development-inputs
       (;("rust-docopt" ,rust-docopt-0.8)
        ("rust-clap" ,rust-clap-2))))))

(define-public rust-cargon-0.0
  (package
    (name "rust-cargon")
    (version "0.0.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "cargon" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1cszlab7jk736p0lb50ag4l9nv72m7j41bwrmygl0lr4iz0350w2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-gcc" ,rust-gcc-0.3))))
    (home-page "https://github.com/bryant/argon2rs")
    (synopsis "Thin wrapper around the Argon2 C library")
    (description
     "This package provides a thin wrapper around the Argon2 C library.  It is
used in argon2rs' bench suite.")
    (license license:wtfpl2)))

(define-public rust-cast-0.2
  (package
    (name "rust-cast")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cast" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1c5z7zryj0zwnhdgs6rw5dfvnlwc1vm19jzrlgx5055alnwk952b"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-rustc-version" ,rust-rustc-version-0.2))
       #:cargo-development-inputs
       (("rust-quickcheck" ,rust-quickcheck-0.9))))
    (home-page "https://github.com/japaric/cast.rs")
    (synopsis
     "Ergonomic, checked cast functions for primitive types")
    (description
     "Ergonomic, checked cast functions for primitive types.")
    (license (list license:expat license:asl2.0))))

(define-public rust-cblas-sys-0.1
  (package
    (name "rust-cblas-sys")
    (version "0.1.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "cblas-sys" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0rgsn3klhhh09d8qf3b87zl4rwk93l2g0qzh9hhb0lff5kcfrzmn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/blas-lapack-rs/cblas-sys")
    (synopsis "Bindings to CBLAS (C)")
    (description
     "The package provides bindings to CBLAS (C).")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-cc-1.0
  (package
    (name "rust-cc")
    (version "1.0.50")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "cc" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1kdqm8ka7xg9h56b694pcz29ka33fsz27mzrphqc78gx96h8zqlm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-jobserver" ,rust-jobserver-0.1))
       #:cargo-development-inputs
       (("rust-tempfile" ,rust-tempfile-3.1))))
    (home-page "https://github.com/alexcrichton/cc-rs")
    (synopsis "Invoke the native C compiler")
    (description
     "This package provides a build-time dependency for Cargo build scripts to
assist in invoking the native C compiler to compile native C code into a static
archive to be linked into Rustcode.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-cexpr-0.3
  (package
    (name "rust-cexpr")
    (version "0.3.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cexpr" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "07fdfj4ff2974y33yixrb657riq9zl9b9h9lr0h7ridhhvxvbrgw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-nom" ,rust-nom-4.2))
       #:cargo-development-inputs
       (("rust-clang-sys" ,rust-clang-sys-0.28))))
    (home-page "https://github.com/jethrogb/rust-cexpr")
    (synopsis "C expression parser and evaluator")
    (description
     "This package provides a C expression parser and evaluator.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-cexpr-0.2
  (package
    (inherit rust-cexpr-0.3)
    (name "rust-cexpr")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cexpr" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0v1xa3758czmj8h97gh548mr8g0v13ixxvrlm1s79nb7jmgc9aj2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-nom" ,rust-nom-3))
       #:cargo-development-inputs
       (("rust-clang-sys" ,rust-clang-sys-0.11))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'set-environmental-variable
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((clang (assoc-ref inputs "libclang")))
               (setenv "LIBCLANG_PATH"
                       (string-append clang "/lib")))
             #t)))))
    (inputs
     `(("libclang" ,clang)))))

(define-public rust-cfg-if-0.1
  (package
    (name "rust-cfg-if")
    (version "0.1.10")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "cfg-if" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "08h80ihs74jcyp24cd75wwabygbbdgl05k6p5dmq8akbr78vv1a7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
        ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1.0))))
    (home-page "https://github.com/alexcrichton/cfg-if")
    (synopsis "Define an item depending on parameters")
    (description "This package provides a macro to ergonomically define an item
depending on a large number of #[cfg] parameters.  Structured like an
@code{if-else} chain, the first matching branch is the item that gets emitted.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-cgl-0.3
  (package
    (name "rust-cgl")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cgl" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1zs7skrsyrsm759vfy2cygkx52fx91b567a12bpaz1sf4d8hbv8c"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t     ; only available on macOS
       #:cargo-inputs (("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/servo/cgl-rs")
    (synopsis "Rust bindings for CGL on Mac")
    (description "Rust bindings for CGL on Mac.")
    (license (list license:expat license:asl2.0))))

(define-public rust-cgl-0.2
  (package
    (inherit rust-cgl-0.3)
    (name "rust-cgl")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cgl" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0j8ayr8pbwvyv6l8r7m5z197rs3pqn97085w9j4rfn7yfh5yrrsm"))))
    (arguments
     `(#:skip-build? #t     ; only available on macOS
       #:cargo-inputs
       (("rust-gleam" ,rust-gleam-0.6)
        ("rust-libc" ,rust-libc-0.2))))))

(define-public rust-cgmath-0.17
  (package
    (name "rust-cgmath")
    (version "0.17.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cgmath" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1rvgila6ivr0dh1bxza450a4yfwdi2pwj3h1vnwg0jy4xk6l8f98"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t     ; Crate won't build without glium.
       #:cargo-inputs
       (("rust-approx" ,rust-approx-0.3)
        ("rust-mint" ,rust-mint-0.5)
        ("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-rand" ,rust-rand-0.6)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-simd" ,rust-simd-0.2))
       #:cargo-development-inputs
       (;("rust-glium" ,rust-glium-0.23)
        ("rust-serde-json" ,rust-serde-json-1.0))))
    (home-page "https://github.com/brendanzab/cgmath")
    (synopsis "Linear algebra and mathematics library")
    (description
     "This package provides a linear algebra and mathematics library
for computer graphics.")
    (license license:asl2.0)))

(define-public rust-cgmath-0.16
  (package
    (inherit rust-cgmath-0.17)
    (name "rust-cgmath")
    (version "0.16.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cgmath" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "07754c03v3srzf64ghsl3fggrdi4kjy6l3vyq2d2wfjfixybb934"))))
    (arguments
     `(#:skip-build? #t     ; Crate won't build without glium.
       #:cargo-inputs
       (("rust-approx" ,rust-approx-0.1)
        ("rust-mint" ,rust-mint-0.5)
        ("rust-num-traits" ,rust-num-traits-0.1)
        ("rust-rand" ,rust-rand-0.4)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-simd" ,rust-simd-0.2))
       #:cargo-development-inputs
       (;("rust-glium" ,rust-glium-0.19)
        ("rust-serde-json" ,rust-serde-json-1.0))))))

(define-public rust-chrono-0.4
  (package
    (name "rust-chrono")
    (version "0.4.11")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "chrono" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1cmmxamkzzs36zncqjjr7qm7xkb6zyrkjslnlj3axdgqki84y2c0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-num-integer" ,rust-num-integer-0.1)
        ("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-js-sys" ,rust-js-sys-0.3)
        ("rust-rustc-serialize" ,rust-rustc-serialize-0.3)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-time" ,rust-time-0.1)
        ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2))
       #:cargo-development-inputs
       (;("rust-bincode" ,rust-bincode-0.8)
        ("rust-criterion" ,rust-criterion-0.2)
        ("rust-doc-comment" ,rust-doc-comment-0.3)
        ("rust-num-iter" ,rust-num-iter-0.1)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-serde-json" ,rust-serde-json-1.0)
        ("rust-wasm-bindgen-test" ,rust-wasm-bindgen-test-0.2))))
    (home-page
     "https://github.com/chronotope/chrono")
    (synopsis "Date and time library for Rust")
    (description "Date and time library for Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ci-info-0.3
  (package
    (name "rust-ci-info")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ci-info" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "00pr17g6q6i752acrkycg0hkq3lm0p634anm41g3m6lqg8q83s75"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0))))
    (home-page "https://github.com/sagiegurari/ci_info")
    (synopsis "Provides current CI environment information")
    (description
     "This package provides current CI environment information.")
    (license license:asl2.0)))

(define-public rust-clang-sys-0.28
  (package
    (name "rust-clang-sys")
    (version "0.28.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "clang-sys" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0ls8zcqi5bmmrvrk3b6r1ym4wlivinbv590d2dvg2xn9f44mbpl1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-glob" ,rust-glob-0.3)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-libloading" ,rust-libloading-0.5))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'set-environmental-variable
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((clang (assoc-ref inputs "libclang")))
               (setenv "LIBCLANG_PATH"
                       (string-append clang "/lib")))
             #t)))))
    (inputs
     `(("libclang" ,clang)))
    (home-page "https://github.com/KyleMayes/clang-sys")
    (synopsis "Rust bindings for libclang")
    (description
     "This package provides Rust bindings for @code{libclang}.")
    (license license:asl2.0)))

(define-public rust-clang-sys-0.26
  (package
    (inherit rust-clang-sys-0.28)
    (name "rust-clang-sys")
    (version "0.26.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "clang-sys" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1r50dwy5hj5gq07dn0qf8222d07qv0970ymx0j8n9779yayc3w3f"))))
    (arguments
     `(#:cargo-inputs
       (("rust-glob" ,rust-glob-0.2)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-libloading" ,rust-libloading-0.5))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'set-environmental-variable
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((clang (assoc-ref inputs "libclang")))
               (setenv "LIBCLANG_PATH"
                       (string-append clang "/lib")))
             #t)))))))

(define-public rust-clang-sys-0.23
  (package
    (inherit rust-clang-sys-0.26)
    (name "rust-clang-sys")
    (version "0.23.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "clang-sys" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1hjr333izzhs6bic84qwnyzy5xzmvasib8f3zkzj4ln3a97c1xyp"))))))

(define-public rust-clang-sys-0.22
  (package
    (inherit rust-clang-sys-0.26)
    (name "rust-clang-sys")
    (version "0.22.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clang-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0f65dw1ydnzq4wrv894fql78n4ikb53jjp53xck0s4hb64s1m6lk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-clippy" ,rust-clippy-0.0)
        ("rust-glob" ,rust-glob-0.2)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-libloading" ,rust-libloading-0.5))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'set-environmental-variable
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((clang (assoc-ref inputs "libclang")))
               (setenv "LIBCLANG_PATH"
                       (string-append clang "/lib")))
             #t)))))))

(define-public rust-clang-sys-0.11
  (package
    (inherit rust-clang-sys-0.22)
    (name "rust-clang-sys")
    (version "0.11.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clang-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "17i47skqp1d9svil2m1wspnhz7ci1x0fipia70ns0qffciwiz48r"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-0.7)
        ("rust-clippy" ,rust-clippy-0.0)
        ("rust-glob" ,rust-glob-0.2)
        ("rust-lazy-static" ,rust-lazy-static-0.2)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-libloading" ,rust-libloading-0.3))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'set-environmental-variable
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((clang (assoc-ref inputs "libclang")))
               (setenv "LIBCLANG_PATH"
                       (string-append clang "/lib")))
             #t)))))))

(define-public rust-clap-2
  (package
    (name "rust-clap")
    (version "2.33.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "clap" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1nf6ld3bims1n5vfzhkvcb55pdzh04bbhzf8nil5vvw05nxzarsh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-ansi-term" ,rust-ansi-term-0.11)
        ("rust-atty" ,rust-atty-0.2)
        ("rust-bitflags" ,rust-bitflags-1)
        ("rust-clippy" ,rust-clippy-0.0)
        ("rust-strsim" ,rust-strsim-0.8)
        ("rust-term-size" ,rust-term-size-0.3)
        ("rust-textwrap" ,rust-textwrap-0.11)
        ("rust-unicode-width" ,rust-unicode-width-0.1)
        ("rust-vec-map" ,rust-vec-map-0.8)
        ("rust-yaml-rust" ,rust-yaml-rust-0.3))
       #:cargo-development-inputs
       (("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-regex" ,rust-regex-1.1)
        ("rust-version-sync" ,rust-version-sync-0.8))))
    (home-page "https://clap.rs/")
    (synopsis "Command Line Argument Parser")
    (description
     "This package provides a simple to use, efficient, and full-featured
Command Line Argument Parser.")
    (license license:expat)))

(define-public rust-clicolors-control-1.0
  (package
    (name "rust-clicolors-control")
    (version "1.0.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "clicolors-control" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "07klix8nbpwk0cg1k4h0kkiijm1jxvrzndqdkr7dqr6xvkjjw24h"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-atty" ,rust-atty-0.2)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/mitsuhiko/clicolors-control")
    (synopsis "Common utility library to control CLI colorization")
    (description
     "This package provides a common utility library to control CLI
colorization.")
    (license license:expat)))

(define-public rust-clipboard-win-2.1
  (package
    (name "rust-clipboard-win")
    (version "2.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clipboard-win" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0431sg4jhabrqf2dliiwhbx9hinb9z4qfcm6914lm5mb17ya5798"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f  ; Tests are for Windows.
       #:cargo-inputs (("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/DoumanAsh/clipboard-win")
    (synopsis "Interact with Windows clipboard")
    (description
     "This package provides simple way to interact with Windows clipboard.")
    (license license:expat)))

(define-public rust-clippy-0.0
  (package
    (name "rust-clippy")
    (version "0.0.302")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clippy" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1562x3sq9mgmc8j39gd34wqm7ybrdvpmj7cc1n450gwsawayw4fr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-term" ,rust-term-0.5))))
    (home-page "https://github.com/rust-lang/rust-clippy")
    (synopsis
     "Lints to avoid common pitfalls in Rust")
    (description
     "This package provides a bunch of helpful lints to avoid common
pitfalls in Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-cloudabi-0.0
  (package
    (name "rust-cloudabi")
    (version "0.0.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "cloudabi" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0kxcg83jlihy0phnd2g8c2c303px3l2p3pkjz357ll6llnd5pz6x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1))))
    (home-page "https://nuxi.nl/cloudabi/")
    (synopsis "Low level interface to CloudABI")
    (description
     "Low level interface to CloudABI.  Contains all syscalls and related types.")
    (license license:bsd-2)))

(define-public rust-cloudflare-zlib-sys-0.2
  (package
    (name "rust-cloudflare-zlib-sys")
    (version "0.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "cloudflare-zlib-sys" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "01lwfd15ijw4d8jsqp87yv4wpmzcp84qm0qqwy3yxmm0fjr5q6by"))))
    ;; This crate bundles cloudflare's fork of zlib, so we don't unbundle it.
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-cc" ,rust-cc-1.0))))
    (home-page "https://github.com/cloudflare/zlib")
    (synopsis
     "Cloudflare fork of zlib with massive performance improvements")
    (description
     "Cloudflare fork of zlib with massive performance improvements.")
    (license
      (list license:expat
            license:asl2.0
            license:zlib))))

(define-public rust-cmake-0.1
  (package
    (name "rust-cmake")
    (version "0.1.42")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "cmake" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0qkwibkvx5xjazvv9v8gvdlpky2jhjxvcz014nrixgzqfyv2byw1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1.0))))
    (home-page "https://github.com/alexcrichton/cmake-rs")
    (synopsis "Rust build dependency for running cmake")
    (description
     "This package provides a build dependency for running @code{cmake} to build
a native library.  The CMake executable is assumed to be @code{cmake} unless the
CMAKE environmental variable is set.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-cocoa-0.19
  (package
    (name "rust-cocoa")
    (version "0.19.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cocoa" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0034vahbfv574q4b63rj241b8rnka5cjiqsqc6wiggnin9l7g7zj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t     ; only for macOS
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-block" ,rust-block-0.1)
        ("rust-core-foundation" ,rust-core-foundation-0.6)
        ("rust-core-graphics" ,rust-core-graphics-0.17)
        ("rust-foreign-types" ,rust-foreign-types-0.3)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-objc" ,rust-objc-0.2))))
    (home-page "https://github.com/servo/core-foundation-rs")
    (synopsis "Bindings to Cocoa for macOS")
    (description "Bindings to Cocoa for macOS.")
    (license (list license:expat license:asl2.0))))

(define-public rust-cocoa-0.18
  (package
    (inherit rust-cocoa-0.19)
    (name "rust-cocoa")
    (version "0.18.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cocoa" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0m6fgdr4d2fp8jhkqvwr23hrqqqjv72g0j9vdgijc58k05j9j1hp"))))))

(define-public rust-color-quant-1.0
  (package
    (name "rust-color-quant")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "color-quant" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ga56jrafnjm80903nnqjkyii4bwd6a7visxh0g8hgi6cmrvbfqd"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/PistonDevelopers/color_quant.git")
    (synopsis
     "Color quantization library to reduce n colors to 256 colors")
    (description
     "Color quantization library to reduce n colors to 256 colors.")
    (license license:expat)))

(define-public rust-colored-1.9
  (package
    (name "rust-colored")
    (version "1.9.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "colored" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0nbc1czs512h1k696y7glv1kjrb2b914zpxraic6q5fgv80wizzl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-atty" ,rust-atty-0.2)
        ("rust-winapi" ,rust-winapi-0.3)
        ("rust-lazy-static" ,rust-lazy-static-1))
       #:cargo-development-inputs
       (("rust-ansi-term" ,rust-ansi-term-0.12)
        ;("rust-rspec" ,rust-rspec-1.0)
        )))
    (home-page "https://github.com/mackwic/colored")
    (synopsis "Add colors in your terminal")
    (description
     "The most simple way to add colors in your terminal.")
    (license license:mpl2.0)))

;; This package requires features which are unavailable
;; on the stable releases of Rust.
(define-public rust-compiler-builtins-0.1
  (package
    (name "rust-compiler-builtins")
    (version "0.1.26")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "compiler_builtins" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1rhj6ccmfkh9gcxnxgjq4fg257yi4f9325nfzsphbmxwkrg06sq3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1.0)
        ("rust-cc" ,rust-cc-1.0))))
    (home-page "https://github.com/rust-lang/compiler-builtins")
    (synopsis "Compiler intrinsics used by the Rust compiler")
    (description
     "This package provides compiler intrinsics used by the Rust compiler.  This
package is primarily useful when building the @code{core} crate yourself and you
need compiler-rt intrinsics.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-compiler-error-0.1
  (package
    (name "rust-compiler-error")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "compiler_error" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0irh7c0gznk2k6mj3cmqw7x4pg59lppmy1y8d6k5xc926rnmz5zg"))))
    (build-system cargo-build-system)
    (arguments '(#:skip-build? #t))
    (home-page "https://github.com/lu-zero/compiler_error")
    (synopsis "Triggerable compiler error")
    (description "This package provides a triggerable compiler error for Rust.")
    (license license:expat)))

(define-public rust-compiletest-rs-0.3
  (package
    (name "rust-compiletest-rs")
    (version "0.3.22")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "compiletest-rs" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1di7kl2zv7jcwqq343aafqhn31gfa600zh4mi6cp10mn6a9wq3pl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-diff" ,rust-diff-0.1)
        ("rust-filetime" ,rust-filetime-0.2)
        ("rust-getopts" ,rust-getopts-0.2)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-miow" ,rust-miow-0.3)
        ("rust-regex" ,rust-regex-1.1)
        ("rust-rustfix" ,rust-rustfix-0.4)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-serde-json" ,rust-serde-json-1.0)
        ("rust-tempfile" ,rust-tempfile-3.0)
        ("rust-tester" ,rust-tester-0.5)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/laumann/compiletest-rs")
    (synopsis "Compiletest utility from the Rust compiler")
    (description
     "The compiletest utility from the Rust compiler as a standalone testing
harness.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-compiletest-rs-0.2
  (package
    (inherit rust-compiletest-rs-0.3)
    (name "rust-compiletest-rs")
    (version "0.2.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "compiletest_rs" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0njz4shbhl1pvb6ngpi1wpz2gr5lf2dcha22lpdk995pzrwd6h97"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-log" ,rust-log-0.3)
        ("rust-rustc-serialize" ,rust-rustc-serialize-0.3)
        ("rust-tempdir" ,rust-tempdir-0.3))))))

(define-public rust-console-0.9
  (package
    (name "rust-console")
    (version "0.9.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "console" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1h765951c9mywff534f0191slazykmif4290g2yarcwhd2cg7q25"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-unicode-width" ,rust-unicode-width-0.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-termios" ,rust-termios-0.3)
        ("rust-encode-unicode" ,rust-encode-unicode-0.3)
        ("rust-winapi" ,rust-winapi-0.3)
        ("rust-clicolors-control" ,rust-clicolors-control-1.0)
        ("rust-regex" ,rust-regex-1.3)
        ("rust-lazy-static" ,rust-lazy-static-1))))
    (home-page "https://github.com/mitsuhiko/console")
    (synopsis "Terminal and console abstraction for Rust")
    (description
     "This package provides a terminal and console abstraction for Rust")
    (license license:expat)))

(define-public rust-console-0.7
  (package
    (name "rust-console")
    (version "0.7.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "console" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0a4n2syzik9lh02v2i4wdazvm05d99bib7dw0lqvz8mq2hn7r9cc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-atty" ,rust-atty-0.2)
        ("rust-clicolors-control" ,rust-clicolors-control-1.0)
        ("rust-encode-unicode" ,rust-encode-unicode-0.3)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-parking-lot" ,rust-parking-lot-0.8)
        ("rust-regex" ,rust-regex-1.1)
        ("rust-termios" ,rust-termios-0.3)
        ("rust-unicode-width" ,rust-unicode-width-0.1)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/mitsuhiko/console")
    (synopsis "Terminal and console abstraction for Rust")
    (description
     "This package provides a terminal and console abstraction for Rust.")
    (license license:expat)))

(define-public rust-console-error-panic-hook-0.1
  (package
    (name "rust-console-error-panic-hook")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "console_error_panic_hook" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "04d2narcrzk9bnddz17rr2l819l82pr0h6d98s2w9q236n87dndq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2))))
    (home-page "https://github.com/rustwasm/console_error_panic_hook")
    (synopsis "Logs panics to console.error")
    (description
     "This package provides a panic hook for @code{wasm32-unknown-unknown}
that logs panics to @code{console.error}.")
    (license (list license:expat license:asl2.0))))

(define-public rust-console-log-0.1
  (package
    (name "rust-console-log")
    (version "0.1.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "console-log" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0j1wd2885m3245bhsb2qjvw08lzplbi1rgg2v3yv0hbljk972y0y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-log" ,rust-log-0.4)
        ("rust-web-sys" ,rust-web-sys-0.3))))
    (home-page "https://github.com/iamcodemaker/console_log")
    (synopsis "Route Rust log messages to the browser's console")
    (description
     "This package provides a logging facility that routes Rust log messages to
the browser's console.")
    (license (list license:expat license:asl2.0))))

(define-public rust-constant-time-eq-0.1
  (package
    (name "rust-constant-time-eq")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "constant_time_eq" version))
       (file-name (string-append name "-" version ".crate"))
       (sha256
        (base32
         "1g3vp04qzmk6cpzrd19yci6a95m7ap6wy7wkwgiy2pjklklrfl14"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/cesarb/constant_time_eq")
    (synopsis
     "Compares two equal-sized byte strings in constant time")
    (description
     "This package compares two equal-sized byte strings in constant time.
It is inspired by the Linux kernel's @code{crypto_memneq}.")
    (license license:cc0)))

(define-public rust-conv-0.3
  (package
    (name "rust-conv")
    (version "0.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "conv" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "168j1npqrif1yqxbgbk0pdrx9shzhs5ylc5a4xw49b6hbxi11zvq"))
        (modules '((guix build utils)))
        (snippet
         '(begin (substitute* "Cargo.toml"
                   (("0.2.21.*") "0.2.21\"\n"))
                 #t))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-custom-derive" ,rust-custom-derive-0.1))
       #:cargo-development-inputs
       (("rust-quickcheck" ,rust-quickcheck-0.2)
        ("rust-winapi" ,rust-winapi-0.2))))
    (home-page "https://github.com/DanielKeep/rust-conv")
    (synopsis "Conversion traits with more specific semantics")
    (description
     "This crate provides a number of conversion traits with more specific
semantics than those provided by @code{as} or @code{From}/@code{Into}.")
    (license license:expat)))

(define-public rust-core-arch-0.1
  (package
    (name "rust-core-arch")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "core_arch" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "04vdvr9vj0f1cv2p54nsszmrrk9w1js4c0z4i0bdlajl1lydslim"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-development-inputs
       (("rust-wasm-bindgen-test" ,rust-wasm-bindgen-test-0.2))))
    (home-page "https://github.com/rust-lang/stdarch")
    (synopsis
     "Rust's core library architecture-specific intrinsics")
    (description
     "@code{core::arch} - Rust's core library architecture-specific
intrinsics.")
    (license (list license:expat license:asl2.0))))

(define-public rust-core-foundation-0.6
  (package
    (name "rust-core-foundation")
    (version "0.6.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "core-foundation" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0va97wf49c8dzm9c8pgyk1jn7z21rl0bj1syf2zz5m2z2hzy1f95"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t     ; only for macOS
       #:cargo-inputs
       (("rust-chrono" ,rust-chrono-0.4)
        ("rust-core-foundation-sys" ,rust-core-foundation-sys-0.6)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-uuid" ,rust-uuid-0.5))))
    (home-page "https://github.com/servo/core-foundation-rs")
    (synopsis
     "Bindings to Core Foundation for macOS")
    (description
     "Bindings to Core Foundation for macOS.")
    (license (list license:expat license:asl2.0))))

(define-public rust-core-foundation-sys-0.6
  (package
    (name "rust-core-foundation-sys")
    (version "0.6.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "core-foundation-sys" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0fzsw1j9g1x598yhwklg59l15hwzc0pyvs01w9fg2kin4598mjp7"))))
    (build-system cargo-build-system)
    (arguments '(#:skip-build? #t))
    (home-page "https://github.com/servo/core-foundation-rs")
    (synopsis "Bindings to Core Foundation for OS X")
    (description
     "Bindings to Core Foundation for OS X.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-core-graphics-0.17
  (package
    (name "rust-core-graphics")
    (version "0.17.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "core-graphics" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1acm3vygngnilzlr6klym5ywh7kfzh2xxrh2l41152hwmdl0jyan"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t     ; only for macOS
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-core-foundation" ,rust-core-foundation-0.6)
        ("rust-foreign-types" ,rust-foreign-types-0.3)
        ("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/servo/core-graphics-rs")
    (synopsis "Bindings to Core Graphics for macOS")
    (description
     "Bindings to Core Graphics for macOS.")
    (license (list license:expat license:asl2.0))))

(define-public rust-core-text-13
  (package
    (name "rust-core-text")
    (version "13.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "core-text" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0v9lxn277p39cf81pb45r7k0lzf17pwgd5cpry1c04ajv556b16v"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t     ; only for macOS
       #:cargo-inputs
       (("rust-core-foundation" ,rust-core-foundation-0.6)
        ("rust-core-graphics" ,rust-core-graphics-0.17)
        ("rust-foreign-types" ,rust-foreign-types-0.3)
        ("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/servo/core-foundation-rs")
    (synopsis "Bindings to the Core Text framework")
    (description
     "Bindings to the Core Text framework.")
    (license (list license:expat license:asl2.0))))

(define-public rust-core-video-sys-0.1
  (package
    (name "rust-core-video-sys")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "core-video-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1l59cg88482hkl95ssb30ac9x65hpbdsmxz9s5r6y222jlhnbh4d"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t     ; only for macOS
       #:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-core-foundation-sys" ,rust-core-foundation-sys-0.6)
        ("rust-core-graphics" ,rust-core-graphics-0.17)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-metal" ,rust-metal-0.14)
        ("rust-objc" ,rust-objc-0.2))))
    (home-page "https://github.com/luozijun/rust-core-video-sys")
    (synopsis
     "Bindings to CoreVideo.framework for macOS and iOS")
    (description
     "Bindings to CoreVideo.framework for macOS and iOS.")
    (license license:expat)))

(define-public rust-cpp-demangle-0.2
  (package
    (name "rust-cpp-demangle")
    (version "0.2.14")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cpp_demangle" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1mm064x84868q06r4m4b7byf999nrkbhx7iyc4nchyssaxpsy5a1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-afl" ,rust-afl-0.4)
        ("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-glob" ,rust-glob-0.3))
       #:cargo-development-inputs
       (("rust-clap" ,rust-clap-2)
        ("rust-diff" ,rust-diff-0.1))))
    (home-page "https://github.com/gimli-rs/cpp_demangle")
    (synopsis "Demangle C++ symbols")
    (description
     "This package provides a crate for demangling C++ symbols.")
    (license (list license:expat license:asl2.0))))

(define-public rust-crates-index-0.13
  (package
    (name "rust-crates-index")
    (version "0.13.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crates-index" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1n7pp6mk59hw3nqlh8irxc9pp0g5ziw7bprqsw2lxvg13cvdp76s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-error-chain" ,rust-error-chain-0.12)
        ("rust-git2" ,rust-git2-0.9)
        ("rust-glob" ,rust-glob-0.3)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-serde-json" ,rust-serde-json-1.0))
       #:cargo-development-inputs
       (("rust-tempdir" ,rust-tempdir-0.3))))
    (home-page
     "https://github.com/frewsxcv/rust-crates-index")
    (synopsis
     "Retrieving and interacting with the crates.io index")
    (description
     "Library for retrieving and interacting with the crates.io index.")
    (license license:asl2.0)))

(define-public rust-crc32fast-1.2
  (package
    (name "rust-crc32fast")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crc32fast" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1c9dhkvf3brrzzplcijaywxi2w8wv5578i0ryhcm7x8dmzi5s4ms"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1))
       #:cargo-development-inputs
       (("rust-bencher" ,rust-bencher-0.1)
        ("rust-quickcheck" ,rust-quickcheck-0.8)
        ("rust-rand" ,rust-rand-0.4))))
    (home-page "https://github.com/srijs/rust-crc32fast")
    (synopsis
     "Fast, SIMD-accelerated CRC32 (IEEE) checksum computation")
    (description
     "Fast, SIMD-accelerated CRC32 (IEEE) checksum computation.")
    (license (list license:expat license:asl2.0))))

(define-public rust-criterion-0.3
  (package
    (name "rust-criterion")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "criterion" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1lgpr82rlmg6rm4gr3c3pla2xgxnakbf8w9sabjsig8jkikmbiqz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-atty" ,rust-atty-0.2)
        ("rust-cast" ,rust-cast-0.2)
        ("rust-clap" ,rust-clap-2)
        ("rust-criterion-plot" ,rust-criterion-plot-0.4)
        ("rust-csv" ,rust-csv-1.1)
        ("rust-itertools" ,rust-itertools-0.8)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-oorandom" ,rust-oorandom-11.1)
        ("rust-plotters" ,rust-plotters-0.2)
        ("rust-rayon" ,rust-rayon-1.3)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-serde-json" ,rust-serde-json-1.0)
        ("rust-tinytemplate" ,rust-tinytemplate-1.0)
        ("rust-walkdir" ,rust-walkdir-2.3))
       #:cargo-development-inputs
       (("rust-approx" ,rust-approx-0.3)
        ("rust-quickcheck" ,rust-quickcheck-0.9)
        ("rust-rand" ,rust-rand-0.7)
        ("rust-tempdir" ,rust-tempdir-0.3))))
    (home-page "https://bheisler.github.io/criterion.rs/book/index.html")
    (synopsis "Statistics-driven micro-benchmarking library")
    (description
     "This package provides a statistics-driven micro-benchmarking library.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-criterion-0.2
  (package
    (inherit rust-criterion-0.3)
    (name "rust-criterion")
    (version "0.2.11")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "criterion" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1543wlpc4p1kz7sqqa7ylr8bkdr8l4f34hy4bxj7krpkahwhaqq3"))))
    (arguments
     `(#:cargo-inputs
       (("rust-atty" ,rust-atty-0.2)
        ("rust-cast" ,rust-cast-0.2)
        ("rust-clap" ,rust-clap-2)
        ("rust-criterion-plot" ,rust-criterion-plot-0.3)
        ("rust-csv" ,rust-csv-1.1)
        ("rust-itertools" ,rust-itertools-0.8)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-rand-core" ,rust-rand-core-0.3)
        ("rust-rand-os" ,rust-rand-os-0.1)
        ("rust-rand-xoshiro" ,rust-rand-xoshiro-0.1)
        ("rust-rayon" ,rust-rayon-1.1)
        ("rust-rayon-core" ,rust-rayon-core-1.5)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-serde-json" ,rust-serde-json-1.0)
        ("rust-tinytemplate" ,rust-tinytemplate-1.0)
        ("rust-walkdir" ,rust-walkdir-2.2))
       #:cargo-development-inputs
       (("rust-approx" ,rust-approx-0.3)
        ("rust-quickcheck" ,rust-quickcheck-0.8)
        ("rust-rand" ,rust-rand-0.6)
        ("rust-tempdir" ,rust-tempdir-0.3))))))

(define-public rust-criterion-plot-0.4
  (package
    (name "rust-criterion-plot")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "criterion-plot" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0id5sfww0hjxlzvkzacdlgbls3lxza8iysqljr7j7s2qxbh1a7m0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cast" ,rust-cast-0.2)
        ("rust-itertools" ,rust-itertools-0.8))
       #:cargo-development-inputs
       (("rust-itertools-num" ,rust-itertools-num-0.1)
        ("rust-num-complex" ,rust-num-complex-0.2)
        ("rust-rand" ,rust-rand-0.4))))
    (home-page "https://github.com/bheisler/criterion.rs")
    (synopsis "Criterion's plotting library")
    (description "This package provides criterion's plotting library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-criterion-plot-0.3
  (package
    (inherit rust-criterion-plot-0.4)
    (name "rust-criterion-plot")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "criterion-plot" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "13pv09z4ryp70qyzablkibwa2mh6c2852qq1sjr9wjigvwnj3ybn"))))
    (arguments
     `(#:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-cast" ,rust-cast-0.2)
        ("rust-itertools" ,rust-itertools-0.8))
       #:cargo-development-inputs
       (("rust-itertools-num" ,rust-itertools-num-0.1)
        ("rust-num-complex" ,rust-num-complex-0.2)
        ("rust-rand" ,rust-rand-0.4))))))

(define-public rust-crossbeam-0.7
  (package
    (name "rust-crossbeam")
    (version "0.7.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crossbeam" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0g5jysq5x4gndc1v5sq9n3f1m97k7qihwdpigw6ar6knj14qm09d"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-crossbeam-channel" ,rust-crossbeam-channel-0.3)
        ("rust-crossbeam-deque" ,rust-crossbeam-deque-0.7)
        ("rust-crossbeam-epoch" ,rust-crossbeam-epoch-0.7)
        ("rust-crossbeam-queue" ,rust-crossbeam-queue-0.1)
        ("rust-crossbeam-utils" ,rust-crossbeam-utils-0.6))
       #:cargo-development-inputs
       (("rust-rand" ,rust-rand-0.4))))
    (home-page "https://github.com/crossbeam-rs/crossbeam")
    (synopsis "Tools for concurrent programming")
    (description "Tools for concurrent programming.")
    (license (list license:expat license:asl2.0))))

(define-public rust-crossbeam-channel-0.4
  (package
    (name "rust-crossbeam-channel")
    (version "0.4.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "crossbeam-channel" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "135ncx9680afs8jkjz8g3iq3naay9rn7942gxrdg2n9m1cxrmv5c"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
        (("rust-crossbeam-utils" ,rust-crossbeam-utils-0.7))
        #:cargo-development-inputs
        (("rust-num-cpus" ,rust-num-cpus-1.10)
         ("rust-rand" ,rust-rand-0.6)
         ("rust-signal-hook" ,rust-signal-hook-0.1))))
    (home-page
     "https://github.com/crossbeam-rs/crossbeam/tree/master/crossbeam-channel")
    (synopsis
     "Multi-producer multi-consumer channels for message passing")
    (description
     "Multi-producer multi-consumer channels for message passing.")
    (license (list license:expat
                   license:asl2.0
                   license:bsd-2))))

(define-public rust-crossbeam-channel-0.3
  (package
    (inherit rust-crossbeam-channel-0.4)
    (name "rust-crossbeam-channel")
    (version "0.3.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crossbeam-channel" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ylyzb1m9qbvd1nd3vy38x9073wdmcy295ncjs7wf7ap476pzv68"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-crossbeam-utils" ,rust-crossbeam-utils-0.6))
       #:cargo-development-inputs
       (("rust-num-cpus" ,rust-num-cpus-1.10)
        ("rust-rand" ,rust-rand-0.6)
        ("rust-signal-hook" ,rust-signal-hook-0.1))))))

(define-public rust-crossbeam-deque-0.7
  (package
    (name "rust-crossbeam-deque")
    (version "0.7.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crossbeam-deque" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1jm3rqb3qfpfywrakyy81f61xnl4jsim7lam9digw6w6cdfr9an3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-crossbeam-epoch" ,rust-crossbeam-epoch-0.8)
        ("rust-crossbeam-utils" ,rust-crossbeam-utils-0.7))
       #:cargo-development-inputs
       (("rust-rand" ,rust-rand-0.6))))
    (home-page
     "https://github.com/crossbeam-rs/crossbeam/tree/master/crossbeam-deque")
    (synopsis "Concurrent work-stealing deque")
    (description "Concurrent work-stealing deque.")
    (license (list license:expat license:asl2.0))))

(define-public rust-crossbeam-deque-0.6
  (package
    (inherit rust-crossbeam-deque-0.7)
    (name "rust-crossbeam-deque")
    (version "0.6.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crossbeam-deque" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "04rcpgjs6ns57vag8a3dzx26190dhbvy2l0p9n22b9p1yf64pr05"))))
    (arguments
     `(#:cargo-inputs
       (("rust-crossbeam-epoch" ,rust-crossbeam-epoch-0.7)
        ("rust-crossbeam-utils" ,rust-crossbeam-utils-0.6))
       #:cargo-development-inputs
       (("rust-rand" ,rust-rand-0.6))))))

(define-public rust-crossbeam-epoch-0.8
  (package
    (name "rust-crossbeam-epoch")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crossbeam-epoch" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1b2mgc2gxxvyzyxgd5wvn9k42gr6f9phi2swwjawpqswy3dynr2h"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-autocfg" ,rust-autocfg-0.1)
        ("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-crossbeam-utils" ,rust-crossbeam-utils-0.7)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-memoffset" ,rust-memoffset-0.5)
        ("rust-scopeguard" ,rust-scopeguard-1.0))
       #:cargo-development-inputs
       (("rust-rand" ,rust-rand-0.6))))
    (home-page
     "https://github.com/crossbeam-rs/crossbeam/tree/master/crossbeam-epoch")
    (synopsis "Epoch-based garbage collection")
    (description "Epoch-based garbage collection.")
    (license (list license:expat license:asl2.0))))

(define-public rust-crossbeam-epoch-0.7
  (package
    (inherit rust-crossbeam-epoch-0.8)
    (name "rust-crossbeam-epoch")
    (version "0.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crossbeam-epoch" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1d408b9x82mdbnb405gw58v5mmdbj2rl28a1h7b9rmn25h8f7j84"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-arrayvec" ,rust-arrayvec-0.4)
        ("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-crossbeam-utils" ,rust-crossbeam-utils-0.6)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-memoffset" ,rust-memoffset-0.2)
        ("rust-scopeguard" ,rust-scopeguard-0.3))
       #:cargo-development-inputs
       (("rust-rand" ,rust-rand-0.4))))))

(define-public rust-crossbeam-queue-0.2
  (package
    (name "rust-crossbeam-queue")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crossbeam-queue" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1nwkjh185bdwjrv1zj2g7an9lglv8sp4459268m4fwvi3v5fx5f6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-crossbeam-utils" ,rust-crossbeam-utils-0.7))
       #:cargo-development-inputs
       (("rust-rand" ,rust-rand-0.6))))
    (home-page
     "https://github.com/crossbeam-rs/crossbeam/tree/master/crossbeam-utils")
    (synopsis "Concurrent queues in Rust")
    (description
     "This crate provides concurrent queues that can be shared among threads.")
    (license (list license:expat
                   license:asl2.0
                   license:bsd-2))))

(define-public rust-crossbeam-queue-0.1
  (package
    (inherit rust-crossbeam-queue-0.2)
    (name "rust-crossbeam-queue")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crossbeam-queue" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0jsa9dbxnwqcxfws09vaschf92d4imlbbikmcn4ka8z7rzb9r5vw"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-crossbeam-utils" ,rust-crossbeam-utils-0.6))
       #:cargo-development-inputs
       (("rust-rand" ,rust-rand-0.4))))))

(define-public rust-crossbeam-utils-0.7
  (package
    (name "rust-crossbeam-utils")
    (version "0.7.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crossbeam-utils" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1a31wbrda1320gj2a6az1lin2d34xfc3xf88da4c17qy5lxcgiy3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-autocfg" ,rust-autocfg-0.1)
        ("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-lazy-static" ,rust-lazy-static-1))
       #:cargo-development-inputs
       (("rust-rand" ,rust-rand-0.6))))
    (home-page
     "https://github.com/crossbeam-rs/crossbeam/tree/master/crossbeam-utils")
    (synopsis "Utilities for concurrent programming")
    (description
     "Utilities for concurrent programming.")
    (license (list license:expat license:asl2.0))))

(define-public rust-crossbeam-utils-0.6
  (package
    (inherit rust-crossbeam-utils-0.7)
    (name "rust-crossbeam-utils")
    (version "0.6.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crossbeam-utils" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0p5aa8k3wpsn17md4rx038ac2azm9354knbxdfvn7dd7yk76yc7q"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-lazy-static" ,rust-lazy-static-1))
       #:cargo-development-inputs
       (("rust-rand" ,rust-rand-0.4))))))

(define-public rust-crypto-mac-0.7
  (package
    (name "rust-crypto-mac")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crypto-mac" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1rbrq6qy9dl0pj4ym2zy33miaaa8vpzdss60p9bdb58xy46l0d24"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-blobby" ,rust-blobby-0.1)
        ("rust-generic-array" ,rust-generic-array-0.12)
        ("rust-subtle" ,rust-subtle-1.0))))
    (home-page "https://github.com/RustCrypto/traits")
    (synopsis "Trait for Message Authentication Code (MAC) algorithms")
    (description "This package provides trait for @dfn{Message Authentication
Code} (MAC) algorithms.")
    (license (list license:expat license:asl2.0))))

(define-public rust-cssparser-0.25
  (package
    (name "rust-cssparser")
    (version "0.25.9")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "cssparser" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "03klvpdzsk4cyh8k0dbnlngzafv7gqywqrnsqqb3gfmrxyj8rqgv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f      ; Some test files missing.
       #:cargo-inputs
       (("rust-cssparser-macros" ,rust-cssparser-macros-0.3)
        ("rust-dtoa-short" ,rust-dtoa-short-0.3)
        ("rust-heapsize" ,rust-heapsize-0.4)
        ("rust-itoa" ,rust-itoa-0.4)
        ("rust-matches" ,rust-matches-0.1)
        ("rust-phf" ,rust-phf-0.7)
        ("rust-procedural-masquerade" ,rust-procedural-masquerade-0.1)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-smallvec" ,rust-smallvec-0.6)
        ("rust-autocfg" ,rust-autocfg-0.1)
        ("rust-proc-macro2" ,rust-proc-macro2-1.0)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-1.0))
       #:cargo-development-inputs
       (("rust-difference" ,rust-difference-2.0)
        ("rust-encoding-rs" ,rust-encoding-rs-0.8)
        ("rust-serde-json" ,rust-serde-json-1.0))))
    (home-page "https://github.com/servo/rust-cssparser")
    (synopsis "Rust implementation of CSS Syntax Level 3")
    (description
     "This package contains a Rust implementation of CSS Syntax Level 3.")
    (license license:mpl2.0)))

(define-public rust-cssparser-macros-0.3
  (package
    (name "rust-cssparser-macros")
    (version "0.3.6")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "cssparser-macros" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1vqyc5xm8a4va92vs1nn0cc46c930l2n21gccijnc5y7hx7cicav"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-phf-codegen" ,rust-phf-codegen-0.7)
        ("rust-proc-macro2" ,rust-proc-macro2-1.0)
        ("rust-procedural-masquerade" ,rust-procedural-masquerade-0.1)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-1.0))))
    (home-page "https://github.com/servo/rust-cssparser")
    (synopsis "Procedural macros for cssparser")
    (description
     "This package provides the procedural macros for rust-cssparser.")
    (license license:mpl2.0)))

(define-public rust-csv-1.1
  (package
    (name "rust-csv")
    (version "1.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "csv" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0yd2z55m2pg4al4yng4nl2y7c9dw2v7yhg5ynihxyrmmd9zzxbq0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-bstr" ,rust-bstr-0.2)
        ("rust-csv-core" ,rust-csv-core-0.1)
        ("rust-itoa" ,rust-itoa-0.4)
        ("rust-ryu" ,rust-ryu-1.0)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-serde" ,rust-serde-1.0))))
    (home-page "https://github.com/BurntSushi/rust-csv")
    (synopsis "Fast CSV parsing with support for serde")
    (description
     "Fast CSV parsing with support for serde.")
    (license (list license:unlicense license:expat))))

(define-public rust-csv-0.14
  (package
    (inherit rust-csv-1.1)
    (name "rust-csv")
    (version "0.14.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "csv" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1g0qvr9fj25fq1fy0p758glrb30yz7x46h18hsysaqyaswaihv16"))))
    (arguments
     `(#:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-0.5)
        ("rust-rustc-serialize" ,rust-rustc-serialize-0.3))
       #:cargo-development-inputs
       (("rust-regex" ,rust-regex-0.1))))))

(define-public rust-csv-core-0.1
  (package
    (name "rust-csv-core")
    (version "0.1.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "csv-core" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "145wcc3560v1kmysqqspvddppiysr2rifqzy4nnlh3r6kxanc91b"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-memchr" ,rust-memchr-2.3))
       #:cargo-development-inputs
       (("rust-arrayvec" ,rust-arrayvec-0.4))))
    (home-page "https://github.com/BurntSushi/rust-csv")
    (synopsis
     "Bare bones CSV parsing with no_std support")
    (description
     "Bare bones CSV parsing with no_std support.")
    (license (list license:unlicense license:expat))))

(define-public rust-ctor-0.1
  (package
    (name "rust-ctor")
    (version "0.1.13")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "ctor" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1qgwkwyxishpp3wkbwq5i27zdxz539ii0sz129xj061ffnnfbia7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-syn" ,rust-syn-1.0)
        ("rust-quote" ,rust-quote-1.0))
       ;#:cargo-development-inputs
       ;(("rust-libc-print" ,rust-libc-print-0.1))
       ))
    (home-page "https://github.com/mmastrac/rust-ctor")
    (synopsis "__attribute__((constructor)) for Rust")
    (description
     "This package provides an @code{__attribute__((constructor))} for Rust.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-ctrlc-3.1
  (package
    (name "rust-ctrlc")
    (version "3.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ctrlc" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0zz8ad4bk28s111af5vy1c5kii4zw0cgh87ivzgj28f8nkcd5py7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-nix" ,rust-nix-0.14)
        ("rust-winapi" ,rust-winapi-0.3))
       #:cargo-development-inputs
       (("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/Detegr/rust-ctrlc")
    (synopsis "Easy Ctrl-C handler for Rust projects")
    (description
     "This package provides an easy Ctrl-C handler for Rust projects.")
    (license (list license:expat license:asl2.0))))

(define-public rust-curl-sys-0.4
  (package
    (name "rust-curl-sys")
    (version "0.4.20")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "curl-sys" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "02542zmvl3fpdqf7ai4cqnamm4albx9j645dkjx5qr1myq8ax42y"))))
    (build-system cargo-build-system)
    ;(arguments
    ; `(#:phases
    ;   (modify-phases %standard-phases
    ;    (add-after 'unpack 'find-openssl
    ;      (lambda* (#:key inputs #:allow-other-keys)
    ;        (let ((openssl (assoc-ref inputs "openssl")))
    ;          (setenv "OPENSSL_DIR" openssl))
    ;        #t)))))
    ;(native-inputs
    ; `(("pkg-config" ,pkg-config)))
    ;(inputs
    ; `(("curl" ,curl)
    ;   ("nghttp2" ,nghttp2)
    ;   ("openssl" ,openssl)
    ;   ("zlib" ,zlib)))
    (home-page "https://github.com/alexcrichton/curl-rust")
    (synopsis "Native bindings to the libcurl library")
    (description
     "This package provides native bindings to the @code{libcurl} library.")
    (properties '((hidden? . #t)))
    (license license:expat)))

(define-public rust-custom-derive-0.1
  (package
    (name "rust-custom-derive")
    (version "0.1.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "custom_derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1f81bavw1wnykwh21hh4yyzigs6zl6f6pkk9p3car8kq95yfb2pg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-development-inputs
       (("rust-rustc-serialize" ,rust-rustc-serialize-0.3))))
    (home-page
     "https://github.com/DanielKeep/rust-custom-derive/tree/custom_derive-master")
    (synopsis "Custom derivation macro for Rust")
    (description
     "This crate provides a macro that enables the use of custom @code{derive}
attributes.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-data-encoding-2.1
  (package
    (name "rust-data-encoding")
    (version "2.1.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "data-encoding" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "15xd6afhsjl08285piwczrafmckpp8i29padj8v12xhahshprx7l"))))
    (build-system cargo-build-system)
    (arguments '(#:skip-build? #t))
    (home-page "https://github.com/ia0/data-encoding")
    (synopsis "Efficient and customizable data-encoding functions")
    (description
     "This library provides encodings for many different common cases, including
hexadecimal, base32, and base64.")
    (license license:expat)))

(define-public rust-data-url-0.1
  (package
    (name "rust-data-url")
    (version "0.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "data-url" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "176wa1n8h71iwyaxhar4sqwrgrvb5sxk26az0fy88vnxrsffjgyk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-matches" ,rust-matches-0.1))
       #:cargo-development-inputs
       (("rust-rustc-test" ,rust-rustc-test-0.3)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-json" ,rust-serde-json-1.0))))
    (home-page "https://github.com/servo/rust-url")
    (synopsis "Processing of data: URL according to WHATWG's Fetch Standard")
    (description
     "Processing of data: URL according to WHATWG's Fetch Standard.")
    (license (list license:expat license:asl2.0))))

(define-public rust-datetime-0.4
  (package
    (name "rust-datetime")
    (version "0.4.7")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "datetime" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1fd74bq48xg8ki5yw1mr1pa5hd3j5lbk4iqc5r0kh3l62b0vci2w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
        (("rust-iso8601" ,rust-iso8601-0.1)
         ("rust-kernel32-sys" ,rust-kernel32-sys-0.2)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-locale" ,rust-locale-0.2)
         ("rust-num-traits" ,rust-num-traits-0.1)
         ("rust-pad" ,rust-pad-0.1)
         ("rust-redox-syscall" ,rust-redox-syscall-0.1)
         ("rust-winapi" ,rust-winapi-0.2))
        #:cargo-development-inputs
        (("rust-regex" ,rust-regex-0.1)
         ("rust-rustc-serialize" ,rust-rustc-serialize-0.3))))
    (home-page "https://github.com/rust-datetime/datetime")
    (synopsis "Library for date and time formatting and arithmetic")
    (description "This package provides a library for date and time formatting
and arithmetic.")
    (license license:expat)))

(define-public rust-dav1d-sys-0.3
  (package
    (name "rust-dav1d-sys")
    (version "0.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "dav1d-sys" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1022czzp3s54r42x6rhr870w1fwzyp7b6qn0zirpz55zmqjpgnwa"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-pkg-config" ,rust-pkg-config-0.3)
        ("rust-bindgen" ,rust-bindgen-0.52)
        ("rust-metadeps" ,rust-metadeps-1.1))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'set-environmental-variable
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((clang (assoc-ref inputs "libclang")))
               (setenv "LIBCLANG_PATH"
                       (string-append clang "/lib")))
             #t)))))
    (inputs
     `(("dav1d" ,dav1d)
       ("pkg-config" ,pkg-config)
       ("libclang" ,clang)
       ("llvm" ,llvm)))
    (home-page "https://github.com/rust-av/dav1d-rs")
    (synopsis "FFI bindings to dav1d")
    (description "FFI bindings to dav1d")
    (license license:expat)))

(define-public rust-decimal-2.0
  (package
    (name "rust-decimal")
    (version "2.0.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "decimal" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1vb3i8vg1dxrw3kzbfiag3gg7rdjd73z80mwbwkq60vnphiqfig6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-ord-subset" ,rust-ord-subset-3)
        ("rust-rustc-serialize" ,rust-rustc-serialize-0.3)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-cc" ,rust-cc-1.0))
       #:cargo-development-inputs
       (("rust-serde-json" ,rust-serde-json-1.0))))
    (home-page "https://github.com/alkis/decimal")
    (synopsis "Decimal floating point arithmetic for Rust")
    (description
     "Decimal floating point arithmetic for Rust.")
    (license license:asl2.0)))

(define-public rust-deflate-0.7
  (package
    (name "rust-deflate")
    (version "0.7.20")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "deflate" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1d7d9fpmgjnznrksmd3vlv3dyw01wsrm11ifil6ag22871xnlyvh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-adler32" ,rust-adler32-1.0)
        ("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-gzip-header" ,rust-gzip-header-0.3)
        ("rust-flate2" ,rust-flate2-1.0))))
    (home-page "https://github.com/image-rs/deflate-rs")
    (synopsis "DEFLATE, zlib and gzip encoder written in rust")
    (description
     "This package provides a DEFLATE, zlib and gzip encoder written in rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-defmac-0.2
  (package
    (name "rust-defmac")
    (version "0.2.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "defmac" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "14cqfvc0f1pkd6gdhjxa2wv3iibqprc0n203ims8lvg96752ynfm"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/bluss/defmac")
    (synopsis "Macro to define lambda-like macros inline")
    (description "A macro to define lambda-like macros inline.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-defmac-0.1
  (package
    (inherit rust-defmac-0.2)
    (name "rust-defmac")
    (version "0.1.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "defmac" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "17giv0n0n1r64z0dahfvkjy3ys517jxyhs8sd9lmgvcljpjyryxa"))))))

(define-public rust-demo-hack-0.0
  (package
    (name "rust-demo-hack")
    (version "0.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "demo-hack" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0m0114p1g0zzrdph5bg03i8m8p70vrwn3whs191jrbjcrmh5lmnp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-demo-hack-impl" ,rust-demo-hack-impl-0.0)
        ("rust-proc-macro-hack" ,rust-proc-macro-hack-0.5))))
    (home-page "https://github.com/dtolnay/proc-macro-hack")
    (synopsis "Demo of proc-macro-hack")
    (description "Demo of proc-macro-hack.")
    (license (list license:expat license:asl2.0))))

(define-public rust-demo-hack-impl-0.0
  (package
    (name "rust-demo-hack-impl")
    (version "0.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "demo-hack-impl" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1f1fdl60xjas9wlmcl9v6f56vgm3mzwr019kcifav5464rx3w3ld"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro-hack" ,rust-proc-macro-hack-0.5)
        ("rust-quote" ,rust-quote-0.6)
        ("rust-syn" ,rust-syn-0.15))))
    (home-page "https://github.com/dtolnay/proc-macro-hack")
    (synopsis "Demo of proc-macro-hack")
    (description "Demo of proc-macro-hack.")
    (license (list license:expat license:asl2.0))))

(define-public rust-diff-0.1
  (package
    (name "rust-diff")
    (version "0.1.12")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "diff" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "16b40bhsa2qgvgvxs983l625pkxyp6m0mzmpwg2605cvj53yl98f"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-development-inputs
       (("rust-quickcheck" ,rust-quickcheck-0.9)
        ("rust-speculate" ,rust-speculate-0.1))))
    (home-page "https://github.com/utkarshkukreti/diff.rs")
    (synopsis
     "LCS based slice and string diffing implementation")
    (description
     "An LCS based slice and string diffing implementation.")
    (license (list license:expat license:asl2.0))))

(define-public rust-difference-2.0
  (package
    (name "rust-difference")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "difference" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1621wx4k8h452p6xzmzzvm7mz87kxh4yqz0kzxfjj9xmjxlbyk2j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-getopts" ,rust-getopts-0.2))
       #:cargo-development-inputs
       (("rust-quickcheck" ,rust-quickcheck-0.8)
        ("rust-term" ,rust-term-0.5))))
    (home-page "https://github.com/johannhof/difference.rs")
    (synopsis "Rust text diffing and assertion library")
    (description
     "This package provides a Rust text diffing and assertion library.")
    (license license:expat)))

(define-public rust-digest-0.8
  (package
    (name "rust-digest")
    (version "0.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "digest" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1madjl27f3kj5ql7kwgvb9c8b7yb7bv7yfgx7rqzj4i3fp4cil7k"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-blobby" ,rust-blobby-0.1)
        ("rust-generic-array" ,rust-generic-array-0.13))))
    (home-page "https://github.com/RustCrypto/traits")
    (synopsis "Traits for cryptographic hash functions")
    (description
     "Traits for cryptographic hash functions.")
    (license (list license:expat license:asl2.0))))

(define-public rust-dirs-2.0
  (package
    (name "rust-dirs")
    (version "2.0.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "dirs" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1qymhyq7w7wlf1dirq6gsnabdyzg6yi2yyxkx6c4ldlkbjdaibhk"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-dirs-sys" ,rust-dirs-sys-0.3))))
    (build-system cargo-build-system)
    (home-page "https://github.com/soc/dirs-rs")
    (synopsis "Abstractions for standard locations for various platforms")
    (description
     "This package provides a tiny low-level library that provides
platform-specific standard locations of directories for config, cache and other
data on Linux, Windows, macOS and Redox by leveraging the mechanisms defined by
the XDG base/user directory specifications on Linux, the Known Folder API on
Windows, and the Standard Directory guidelines on macOS.")
    (license (list license:expat license:asl2.0))))

(define-public rust-dirs-1.0
  (package
    (inherit rust-dirs-2.0)
    (name "rust-dirs")
    (version "1.0.5")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "dirs" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "009rrhzj9pxyncmm2vhlj70npg0cgggv2hjbbkiwdl9vccq8kmrz"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-redox-users" ,rust-redox-users-0.3)
        ("rust-winapi" ,rust-winapi-0.3))))))

(define-public rust-dirs-sys-0.3
  (package
    (name "rust-dirs-sys")
    (version "0.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "dirs-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0yyykdcmbc476z1v9m4z5jb8y91dw6kgzpkiqi2ig07xx0yv585g"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-redox-users" ,rust-redox-users-0.3)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/soc/dirs-sys-rs")
    (synopsis
     "System-level helper functions for the dirs and directories crates")
    (description
     "This package provides system-level helper functions for the @code{dirs}
and @code{directories} crates.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-discard-1.0
  (package
    (name "rust-discard")
    (version "1.0.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "discard" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1h67ni5bxvg95s91wgicily4ix7lcw7cq0a5gy9njrybaibhyb91"))))
    (build-system cargo-build-system)
    (arguments '(#:skip-build? #t))
    (home-page "https://github.com/Pauan/rust-discard")
    (synopsis "Allow for intentionally leaking memory")
    (description "There are situations where you need to intentionally leak some
memory but not other memory.  This package provides a discard trait which allows
for intentionally leaking memory")
    (license license:expat)))

(define-public rust-dispatch-0.1
  (package
    (name "rust-dispatch")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "dispatch" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "019nzy993hxaiazcdnayx3csv2iki34i535asw11ki96hakkrs84"))))
    (build-system cargo-build-system)
    (arguments '(#:tests? #f))  ; Tests only run on Mac.
    (home-page "http://github.com/SSheldon/rust-dispatch")
    (synopsis "Rust wrapper for Apple's Grand Central Dispatch")
    (description "This package provides a Rust wrapper for Apple's Grand
Central Dispatch.")
    (license license:expat)))

(define-public rust-dissimilar-1.0
  (package
    (name "rust-dissimilar")
    (version "1.0.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "dissimilar" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "154ba92ifmh3js1k0hbmxz7pv95n8wmahlyvhdbnxggbs8f1dpir"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/dtolnay/dissimilar")
    (synopsis "Diff library with semantic cleanup")
    (description
     "This package provides a diff library with semantic cleanup, based on
Google's diff-match-patch.")
    (license (list license:expat license:asl2.0))))

(define-public rust-dlib-0.4
  (package
    (name "rust-dlib")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "dlib" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0smp2cdvy12xfw26qyqms273w5anszfadv73g75s88yqm54i5rbp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libloading" ,rust-libloading-0.5))))
    (home-page "https://github.com/vberger/dlib")
    (synopsis "Helper macros for manually loading optional system libraries")
    (description
     "This package provides helper macros for handling manually loading optional
system libraries.")
    (license license:expat)))

(define-public rust-doc-comment-0.3
  (package
    (name "rust-doc-comment")
    (version "0.3.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "doc-comment" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "15rsqxgarfpb1yim9sbp9yfgj7p2dq6v51c6bq1a62paii9ylgcj"))))
    (build-system cargo-build-system)
    (arguments '(#:skip-build? #t))
    (home-page "https://github.com/GuillaumeGomez/doc-comment")
    (synopsis "Macro to generate doc comments")
    (description "This package provides a way to generate doc comments
from macros.")
    (license license:expat)))

(define-public rust-docopt-1.1
  (package
    (name "rust-docopt")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "docopt" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0s9rcpmnnivs502q69lc1h1wrwapkq09ikgbfbgqf31idmc5llkz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-regex" ,rust-regex-1.1)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-strsim" ,rust-strsim-0.9))))
    (home-page "https://github.com/docopt/docopt.rs")
    (synopsis "Command line argument parsing")
    (description "Command line argument parsing.")
    (license (list license:expat license:unlicense))))

(define-public rust-docopt-0.7
  (package
    (inherit rust-docopt-1.1)
    (name "rust-docopt")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "docopt" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1n6gbhsks2w9y0b4bwqyawh4ghbkka09w6pjcrq9i1sd51pflcmb"))))
    (arguments
     `(#:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static-0.2)
        ("rust-regex" ,rust-regex-0.2)
        ("rust-rustc-serialize" ,rust-rustc-serialize-0.3)
        ("rust-strsim" ,rust-strsim-0.6))))))

(define-public rust-docopt-0.6
  (package
    (inherit rust-docopt-0.7)
    (name "rust-docopt")
    (version "0.6.86")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "docopt" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1nf4f4zf5yk0d0l4kl7hkii4na22fhn0l2hgfb46yzv08l2g6zja"))))
    (arguments
     `(#:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static-0.2)
        ("rust-regex" ,rust-regex-0.1)
        ("rust-rustc-serialize" ,rust-rustc-serialize-0.3)
        ("rust-strsim" ,rust-strsim-0.5))))))

(define-public rust-downcast-rs-1.1
  (package
    (name "rust-downcast-rs")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "downcast-rs" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1xhs2qj02k9m4mm5fgh19y88850y9jsnwwlblf2ffc91gjs6xfjj"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/marcianx/downcast-rs")
    (synopsis "Trait object downcasting support using only safe Rust")
    (description
     "Trait object downcasting support using only safe Rust.  It supports type
parameters, associated types, and type constraints.")
    (license (list license:expat license:asl2.0))))

(define-public rust-draw-state-0.8
  (package
    (name "rust-draw-state")
    (version "0.8.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "draw_state" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0lfng4fz9x7bwsmzv9r20ply10w0iid6vfcrhx292s6hw8vrbkrk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-serde" ,rust-serde-1.0)
        ("rust-bitflags" ,rust-bitflags-1))))
    (home-page "https://github.com/gfx-rs/draw_state")
    (synopsis "Graphics state blocks for gfx-rs")
    (description "Graphics state blocks for gfx-rs.")
    (license license:asl2.0)))

(define-public rust-dtoa-0.4
  (package
    (name "rust-dtoa")
    (version "0.4.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "dtoa" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0phbm7i0dpn44gzi07683zxaicjap5064w62pidci4fhhciv8mza"))))
    (build-system cargo-build-system)
    (arguments '(#:skip-build? #t))
    (home-page "https://github.com/dtolnay/dtoa")
    (synopsis "Fast functions for printing floating-point primitives")
    (description "This crate provides fast functions for printing
floating-point primitives to an @code{io::Write}.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-dtoa-0.2
  (package
    (inherit rust-dtoa-0.4)
    (name "rust-dtoa")
    (version "0.2.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "dtoa" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0g96cap6si1g6wi62hsdk2fnj3sf5vd4i97zj6163j8hhnsl3n0d"))))))

(define-public rust-dtoa-short-0.3
  (package
    (name "rust-dtoa-short")
    (version "0.3.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "dtoa-short" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1wkn7ziqffq8hj0a411lgn7674ackzdk734ikp230rmp2f2hn0jr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-dtoa" ,rust-dtoa-0.4))
       #:cargo-development-inputs
       (("rust-float-cmp" ,rust-float-cmp-0.3))))
    (home-page "https://github.com/upsuper/dtoa-short")
    (synopsis "Serialize float number and truncate to certain precision")
    (description
     "Serialize float number and truncate to certain precision in Rust.")
    (license license:mpl2.0)))

(define-public rust-duct-0.13
  (package
    (name "rust-duct")
    (version "0.13.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "duct" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ir3884i1yznkfdccqqbcb9v5sdpcgxlv41hgzncrqaljv18r0wj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-once-cell" ,rust-once-cell-1.2)
        ("rust-os-pipe" ,rust-os-pipe-0.8)
        ("rust-shared-child" ,rust-shared-child-0.3))
       #:cargo-development-inputs
       (("rust-tempdir" ,rust-tempdir-0.3))))
    (home-page
     "https://github.com/oconnor663/duct.rs")
    (synopsis
     "Library for running child processes")
    (description
     "A library for running child processes.")
    (license license:expat)))

(define-public rust-dwrote-0.9
  (package
    (name "rust-dwrote")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "dwrote" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "03gzl5pd90nlkmwqmbmjmyz47h7wlblbqrwv5a29npnv0ag3dl8b"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ;("rust-wio" ,rust-wio-0.2)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/servo/dwrote-rs")
    (synopsis "Lightweight binding to DirectWrite")
    (description
     "This package provides lightweight binding to DirectWrite.")
    (license license:mpl2.0)))

(define-public rust-edit-distance-2.1
  (package
    (name "rust-edit-distance")
    (version "2.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "edit-distance" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0yq3wlmd7ly22qxhfysi77qp31yvpx2ll9waa75bkpiih7rsmfmv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-quickcheck" ,rust-quickcheck-0.9))))
    (home-page "https://github.com/febeling/edit-distance")
    (synopsis "Levenshtein edit distance between strings")
    (description
     "Levenshtein edit distance between strings, a measure for similarity.")
    (license license:asl2.0)))

(define-public rust-either-1.5
  (package
    (name "rust-either")
    (version "1.5.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "either" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1qyz1b1acad6w0k5928jw5zaq900zhsk7p8dlcp4hh61w4f6n7xv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-serde" ,rust-serde-1.0))))
    (home-page "https://github.com/bluss/either")
    (synopsis
     "Enum @code{Either} with variants @code{Left} and @code{Right}")
    (description
     "The enum @code{Either} with variants @code{Left} and
@code{Right} is a general purpose sum type with two cases.")
    (license (list license:expat license:asl2.0))))

(define-public rust-embed-resource-1.3
  (package
    (name "rust-embed-resource")
    (version "1.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "embed-resource" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0v1adsw9mq7gjjjhx4hcjhqppdf4vm0gbcgh7sxirbxh99la9axv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-vswhom" ,rust-vswhom-0.1)
        ("rust-winreg" ,rust-winreg-0.6))))
    (home-page "https://github.com/nabijaczleweli/rust-embed-resource")
    (synopsis
     "Cargo library to handle compilation and inclusion of Windows resources")
    (description
     "This package provides a Cargo library to handle compilation and
inclusion of Windows resources in the most resilient fashion imaginable.")
    (license license:expat)))

(define-public rust-encode-unicode-0.3
  (package
    (name "rust-encode-unicode")
    (version "0.3.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "encode_unicode" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "07w3vzrhxh9lpjgsg2y5bwzfar2aq35mdznvcp3zjl0ssj7d4mx3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-ascii" ,rust-ascii-1.0)
        ("rust-clippy" ,rust-clippy-0.0))
       #:cargo-development-inputs
       (("rust-lazy-static" ,rust-lazy-static-1))))
    (home-page "https://github.com/tormol/encode_unicode")
    (synopsis
     "UTF-8 and UTF-16 support for char, u8 and u16")
    (description
     "UTF-8 and UTF-16 character types, iterators and related methods for
char, u8 and u16.")
    (license (list license:expat license:asl2.0))))

(define-public rust-encoding-0.2
  (package
    (name "rust-encoding")
    (version "0.2.33")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "encoding" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1v1ndmkarh9z3n5hk53da4z56hgk9wa5kcsm7cnx345raqw983bb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-encoding-index-japanese"
         ,rust-encoding-index-japanese-1.20141219)
        ("rust-encoding-index-korean"
         ,rust-encoding-index-korean-1.20141219)
        ("rust-encoding-index-simpchinese"
         ,rust-encoding-index-simpchinese-1.20141219)
        ("rust-encoding-index-singlebyte"
         ,rust-encoding-index-singlebyte-1.20141219)
        ("rust-encoding-index-tradchinese"
         ,rust-encoding-index-tradchinese-1.20141219))
       #:cargo-development-inputs
       (("rust-getopts" ,rust-getopts-0.2))))
    (home-page
     "https://github.com/lifthrasiir/rust-encoding")
    (synopsis "Character encoding support for Rust")
    (description
     "Character encoding support for Rust.")
    (license license:expat)))

(define-public rust-encoding-index-japanese-1.20141219
  (package
    (name "rust-encoding-index-japanese")
    (version "1.20141219.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "encoding-index-japanese" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "148c1lmd640p1d7fzk0nv7892mbyavvwddgqvcsm78798bzv5s04"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-encoding-index-tests" ,rust-encoding-index-tests-0.1))))
    (home-page "https://github.com/lifthrasiir/rust-encoding")
    (synopsis "Index tables for Japanese character encodings")
    (description
     "Index tables for Japanese character encodings.")
    (license license:cc0)))

(define-public rust-encoding-index-korean-1.20141219
  (package
    (name "rust-encoding-index-korean")
    (version "1.20141219.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "encoding-index-korean" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "10cxabp5ppygbq4y6y680856zl9zjvq7ahpiw8zj3fmwwsw3zhsd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-encoding-index-tests" ,rust-encoding-index-tests-0.1))))
    (home-page "https://github.com/lifthrasiir/rust-encoding")
    (synopsis "Index tables for Korean character encodings")
    (description
     "Index tables for Korean character encodings.")
    (license license:cc0)))

(define-public rust-encoding-index-simpchinese-1.20141219
  (package
    (name "rust-encoding-index-simpchinese")
    (version "1.20141219.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "encoding-index-simpchinese" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1xria2i7mc5dqdrpqxasdbxv1qx46jjbm53if3y1i4cvj2a72ynq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-encoding-index-tests" ,rust-encoding-index-tests-0.1))))
    (home-page "https://github.com/lifthrasiir/rust-encoding")
    (synopsis "Index tables for simplified Chinese character encodings")
    (description
     "Index tables for simplified Chinese character encodings.")
    (license license:cc0)))

(define-public rust-encoding-index-singlebyte-1.20141219
  (package
    (name "rust-encoding-index-singlebyte")
    (version "1.20141219.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "encoding-index-singlebyte" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0jp85bz2pprzvg9m95w4q0vibh67b6w3bx35lafay95jzyndal9k"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-encoding-index-tests" ,rust-encoding-index-tests-0.1))))
    (home-page "https://github.com/lifthrasiir/rust-encoding")
    (synopsis "Index tables for various single-byte character encodings")
    (description
     "Index tables for various single-byte character encodings.")
    (license license:cc0)))

(define-public rust-encoding-index-tests-0.1
  (package
    (name "rust-encoding-index-tests")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "encoding_index_tests" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0s85y091gl17ixass49bzaivng7w8p82p6nyvz2r3my9w4mxhim2"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/lifthrasiir/rust-encoding")
    (synopsis
     "Macros used to test index tables for character encodings")
    (description
     "Helper macros used to test index tables for character
encodings.")
    (license license:cc0)))

(define-public rust-encoding-index-tradchinese-1.20141219
  (package
    (name "rust-encoding-index-tradchinese")
    (version "1.20141219.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "encoding-index-tradchinese" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "060ci4iz6xfvzk38syfbjvs7pix5hch3mvxkksswmqwcd3aj03px"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-encoding-index-tests" ,rust-encoding-index-tests-0.1))))
    (home-page "https://github.com/lifthrasiir/rust-encoding")
    (synopsis "Index tables for traditional Chinese character encodings")
    (description
     "Index tables for traditional Chinese character encodings.")
    (license license:cc0)))

(define-public rust-encoding-rs-0.8
  (package
    (name "rust-encoding-rs")
    (version "0.8.17")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "encoding_rs" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1v902qqnbd37vdq4rjvp6k05wmghrasfdcjy30gp1xpjg5f7hma1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-packed-simd" ,rust-packed-simd-0.3)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-bincode" ,rust-bincode-1.1)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-serde-json" ,rust-serde-json-1.0))))
    (home-page "https://docs.rs/encoding_rs/")
    (synopsis "Gecko-oriented implementation of the Encoding Standard")
    (description
     "This package provides a Gecko-oriented implementation of the Encoding
Standard.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-encoding-rs-io-0.1
  (package
    (name "rust-encoding-rs-io")
    (version "0.1.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "encoding_rs_io" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "10ra4l688cdadd8h1lsbahld1zbywnnqv68366mbhamn3xjwbhqw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-encoding-rs" ,rust-encoding-rs-0.8))))
    (home-page "https://github.com/BurntSushi/encoding_rs_io")
    (synopsis "Streaming transcoding for encoding_rs")
    (description
     "Streaming transcoding for encoding_rs.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-env-logger-0.7
  (package
    (name "rust-env-logger")
    (version "0.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "env_logger" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0djx8h8xfib43g5w94r1m1mkky5spcw4wblzgnhiyg5vnfxknls4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-atty" ,rust-atty-0.2)
        ("rust-humantime" ,rust-humantime-1.3)
        ("rust-log" ,rust-log-0.4)
        ("rust-regex" ,rust-regex-1.1)
        ("rust-termcolor" ,rust-termcolor-1.0))))
    (home-page "https://github.com/sebasmagri/env_logger/")
    (synopsis "Logging implementation for @code{log}")
    (description
     "This package provides a logging implementation for @code{log} which
is configured via an environment variable.")
    (license (list license:expat license:asl2.0))))

(define-public rust-env-logger-0.6
  (package
    (inherit rust-env-logger-0.7)
    (name "rust-env-logger")
    (version "0.6.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "env_logger" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1lx2s5nk96xx4i3m4zc4ghqgi8kb07dsnyiv8jk2clhax42dxz5a"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-atty" ,rust-atty-0.2)
        ("rust-humantime" ,rust-humantime-1.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-regex" ,rust-regex-1.1)
        ("rust-termcolor" ,rust-termcolor-1.0))))))

(define-public rust-env-logger-0.5
  (package
    (inherit rust-env-logger-0.7)
    (name "rust-env-logger")
    (version "0.5.13")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "env-logger" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0f0c4i4c65jh8lci0afl5yg74ac0lbnpxcp81chj114zwg9a9c0m"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-atty" ,rust-atty-0.2)
        ("rust-humantime" ,rust-humantime-1.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-regex" ,rust-regex-1.1)
        ("rust-termcolor" ,rust-termcolor-1.0))))))

(define-public rust-env-logger-0.4
  (package
    (inherit rust-env-logger-0.7)
    (name "rust-env-logger")
    (version "0.4.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "env-logger" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0nydz2lidsvx9gs0v2zcz68rzqx8in7fzmiprgsrhqh17vkj3prx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-log" ,rust-log-0.3)
        ("rust-regex" ,rust-regex-0.2))))))

(define-public rust-env-logger-0.3
  (package
    (inherit rust-env-logger-0.7)
    (name "rust-env-logger")
    (version "0.3.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "env_logger" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0bvcjgkw4s3k1rd7glpflgc8s9a393zjd6jfdgvs8gjvwj0dgaqm"))))
    (arguments
     `(#:skip-build? #t     ; Cannot find dependent crates.
       #:cargo-inputs
       (("rust-regex" ,rust-regex-0.1)
        ("rust-log" ,rust-log-0.3))))))

(define-public rust-envmnt-0.6
  (package
    (name "rust-envmnt")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "envmnt" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "12zkq3p999bypyxmjnpiqw9r3hmifb3bcikd7j3as1fdcbq01fyl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-indexmap" ,rust-indexmap-1.0))))
    (home-page "https://github.com/sagiegurari/envmnt")
    (synopsis "Environment variables utility functions")
    (description
     "Environment variables utility functions.")
    (license license:asl2.0)))

(define-public rust-erased-serde-0.3
  (package
    (name "rust-erased-serde")
    (version "0.3.11")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "erased-serde" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1lgkpkk7nx6f24gmr3psyj8d2avc9701r9jyw1i4ssp10lbnv2yq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (;("rust-serde-cbor" ,rust-serde-cbor-0.9)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-serde-json" ,rust-serde-json-1.0))))
    (home-page "https://github.com/dtolnay/erased-serde")
    (synopsis "Type-erased Serialize and Serializer traits")
    (description
     "Type-erased Serialize and Serializer traits.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-err-derive-0.2
  (package
    (name "rust-err-derive")
    (version "0.2.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "err-derive" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0v6wxrshfpg7mwaxzq8jwxbfiyn7zk5rlm4m8kkrwh7dpf8nrx42"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-synstructure" ,rust-synstructure-0.12)
        ("rust-skeptic" ,rust-skeptic-0.13)
        ("rust-proc-macro-error" ,rust-proc-macro-error-0.4)
        ("rust-proc-macro2" ,rust-proc-macro2-1.0)
        ("rust-syn" ,rust-syn-1.0)
        ("rust-rustversion" ,rust-rustversion-1.0)
        ("rust-quote" ,rust-quote-1.0))
       #:cargo-development-inputs
       (("rust-skeptic" ,rust-skeptic-0.13))))
    (home-page "https://gitlab.com/torkleyy/err-derive")
    (synopsis "Derive macro for `std::error::Error`")
    (description
     "Derive macro for @code{std::error::Error}.")
    (license (list license:expat license:asl2.0))))

(define-public rust-errno-0.2
  (package
    (name "rust-errno")
    (version "0.2.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "errno" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0kn8mlygxxr02cm97401nppd2dbkwsalpcbai67rh6yh3rh73862"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-errno-dragonfly" ,rust-errno-dragonfly-0.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/lambda-fairy/rust-errno")
    (synopsis "Cross-platform interface to the @code{errno} variable")
    (description
     "Cross-platform interface to the @code{errno} variable.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-errno-dragonfly-0.1
  (package
    (name "rust-errno-dragonfly")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "errno-dragonfly" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0rshlc00nv45f14v2l1w0ma2nf1jg5j7q9pvw7hh018r6r73bjhl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-gcc" ,rust-gcc-0.3))))
    (home-page "https://github.com/mneumann/errno-dragonfly-rs")
    (synopsis "Exposes errno functionality to stable Rust on DragonFlyBSD")
    (description
     "Exposes errno functionality to stable Rust on DragonFlyBSD.")
    (license license:expat)))

(define-public rust-error-chain-0.12
  (package
    (name "rust-error-chain")
    (version "0.12.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "error-chain" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ka5y0fmymxzx3gz2yrd7rpz2i555m1iw4fpmcggpzcgr1n10wfk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-backtrace" ,rust-backtrace-0.3)
        ("rust-version-check" ,rust-version-check-0.9))))
    (home-page "https://github.com/rust-lang-nursery/error-chain")
    (synopsis "Yet another error boilerplate library")
    (description
     "Yet another error boilerplate library.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-error-chain-0.11
  (package
    (inherit rust-error-chain-0.12)
    (name "rust-error-chain")
    (version "0.11.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "error-chain" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1wykkr0naizbkwxjwia1rch8xhwvgij9khqvjzs07mrmqifislgz"))))
    (arguments
     `(#:tests? #f      ; Not all test files included.
       #:cargo-inputs
       (("rust-backtrace" ,rust-backtrace-0.3))))))

(define-public rust-error-chain-0.10
  (package
    (inherit rust-error-chain-0.11)
    (name "rust-error-chain")
    (version "0.10.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "error-chain" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1y1gyj9g5c3k1nzkvxrgry8v9k86kcc585mczrm3qz019s35shyr"))))
    (arguments
     `(#:cargo-inputs
       (("rust-backtrace" ,rust-backtrace-0.3))))))

(define-public rust-euclid-0.20
  (package
    (name "rust-euclid")
    (version "0.20.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "euclid" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0c3hbl0kvc53k6nws0v9d46hi0giza1j079sqx2bgl4wfw65nshc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-mint" ,rust-mint-0.5)
        ("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-serde-test" ,rust-serde-test-1.0))))
    (home-page "https://github.com/servo/euclid")
    (synopsis "Geometry primitives")
    (description "Geometry primitives written in Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-expat-sys-2.1
  (package
    (name "rust-expat-sys")
    (version "2.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "expat-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1yj5pqynds776ay8wg9mhi3hvna4fv7vf244yr1864r0i5r1k3v5"))
        (modules '((guix build utils)))
        (snippet
         '(begin (delete-file-recursively "expat") #t))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cmake" ,rust-cmake-0.1)
        ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (inputs
     `(("expat" ,expat)))
    (home-page "http://www.libexpat.org/")
    (synopsis "XML parser library written in C")
    (description "XML parser library written in C")
    (license license:expat)))

(define-public rust-fake-simd-0.1
  (package
    (name "rust-fake-simd")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fake-simd" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1vfylvk4va2ivqx85603lyqqp0zk52cgbs4n5nfbbbqx577qm2p8"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/RustCrypto/utils")
    (synopsis "Crate for mimicking simd crate on stable Rust")
    (description
     "Crate for mimicking simd crate on stable Rust.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-failure-0.1
  (package
    (name "rust-failure")
    (version "0.1.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "failure" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0js6i6mb42q1g6q3csfbmi6q40s64k96705xbim0d8zg44j9qlmq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-backtrace" ,rust-backtrace-0.3)
        ("rust-failure-derive" ,rust-failure-derive-0.1))))
    (home-page "https://rust-lang-nursery.github.io/failure/")
    (synopsis "Experimental error handling abstraction")
    (description
     "Experimental error handling abstraction.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-failure-derive-0.1
  (package
    (name "rust-failure-derive")
    (version "0.1.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "failure_derive" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0cfjz0c9szqpxn43b2r722p6m3swzxj7aj6xhqw23ml7h8y762h3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1.0)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-1.0)
        ("rust-synstructure" ,rust-synstructure-0.12))
       #:cargo-development-inputs
       (("rust-failure" ,rust-failure-0.1))))
    (home-page "https://rust-lang-nursery.github.io/failure/")
    (synopsis "Derives for the failure crate")
    (description "Derives for the failure crate.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-fallible-iterator-0.2
  (package
    (name "rust-fallible-iterator")
    (version "0.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "fallible-iterator" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1xq759lsr8gqss7hva42azn3whgrbrs2sd9xpn92c5ickxm1fhs4"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/sfackler/rust-fallible-iterator")
    (synopsis "Fallible iterator traits")
    (description "If the @code{std} or @code{alloc} features are enabled, this
crate provides implementations for @code{Box}, @code{Vec}, @code{BTreeMap}, and
@code{BTreeSet}.  If the @code{std} feature is enabled, this crate additionally
provides implementations for @code{HashMap} and @code{HashSet}.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-fern-0.5
  (package
    (name "rust-fern")
    (version "0.5.9")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "fern" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1anslk0hx9an4ypcaxqff080hgbcxm7ji7d4qf4f6qx1mkav16p6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-reopen" ,rust-reopen-0.3)
        ("rust-log" ,rust-log-0.4)
        ("rust-chrono" ,rust-chrono-0.4)
        ("rust-colored" ,rust-colored-1.9)
        ("rust-syslog" ,rust-syslog-3.3)
        ("rust-syslog" ,rust-syslog-4.0))
       #:cargo-development-inputs
       (("rust-clap" ,rust-clap-2)
        ("rust-tempdir" ,rust-tempdir-0.3))))
    (home-page "https://github.com/daboross/fern")
    (synopsis "Simple, efficient logging")
    (description
     "This package provides a simple, efficient logging system for Rust.")
    (license license:expat)))

(define-public rust-filetime-0.2
  (package
    (name "rust-filetime")
    (version "0.2.8")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "filetime" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0zfc90802dbw11bx6kmm8zw6r88k7glm4q6l8riqw35an3dd9xhz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-redox-syscall" ,rust-redox-syscall-0.1)
        ("rust-winapi" ,rust-winapi-0.3))
       #:cargo-development-inputs
       (("rust-tempfile" ,rust-tempfile-3.0))))
    (home-page "https://github.com/alexcrichton/filetime")
    (synopsis "Platform-agnostic accessors of timestamps in File metadata")
    (description
     "This library contains a helper library for inspecting and setting the
various timestamps of files in Rust.  This library takes into account
cross-platform differences in terms of where the timestamps are located, what
they are called, and how to convert them into a platform-independent
representation.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-findshlibs-0.5
  (package
    (name "rust-findshlibs")
    (version "0.5.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "findshlibs" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1n2vagn0q5yim32hxkwi1cjgp3yn1dm45p7z8nw6lapywihhs9mi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/gimli-rs/findshlibs")
    (synopsis "Find the set of shared libraries loaded in the current process")
    (description
     "Find the set of shared libraries loaded in the current process with a
cross platform API.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-fixedbitset-0.1
  (package
    (name "rust-fixedbitset")
    (version "0.1.9")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "fixedbitset" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0czam11mi80dbyhf4rd4lz0ihcf7vkfchrdcrn45wbs0h40dxm46"))))
    (build-system cargo-build-system)
    (arguments '(#:skip-build? #t))
    (home-page "https://github.com/petgraph/fixedbitset")
    (synopsis "FixedBitSet is a simple bitset collection")
    (description "FixedBitSet is a simple bitset collection.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-flame-0.2
  (package
    (name "rust-flame")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "flame" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0c5bmhyimzxch3pmh0w3z9n57saasgix4bmbbksr9vp1c5j71hhz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static-0.2)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-serde-json" ,rust-serde-json-1.0)
        ("rust-thread-id" ,rust-thread-id-3.3))))
    (home-page "https://github.com/llogiq/flame")
    (synopsis "Profiling and flamegraph library")
    (description "A profiling and flamegraph library.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-flamer-0.3
  (package
    (name "rust-flamer")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "flamer" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1b2d7jx80f3p7hqpgdi7wksaiq18k9w23p0cs2sxf7jbx2jx3bgj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f      ; Uses features not available in stable Rust release
       #:cargo-inputs
       (("rust-flame" ,rust-flame-0.2)
        ("rust-quote" ,rust-quote-0.6)
        ("rust-syn" ,rust-syn-0.15))))
    (home-page "https://github.com/llogiq/flamer")
    (synopsis "Macro to insert @code{flame::start_guard(_)}")
    (description
     "A procedural macro to insert @code{flame::start_guard(_)} calls.")
    (license license:asl2.0)))

(define-public rust-flate2-1.0
  (package
    (name "rust-flate2")
    (version "1.0.14")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "flate2" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0hlb2zmn5ixrgr0i1qvrd3a7j4fpp002d0kddn2hm7hjj49z9zrc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-cloudflare-zlib-sys"
         ,rust-cloudflare-zlib-sys-0.2)
        ("rust-crc32fast" ,rust-crc32fast-1.2)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-libz-sys" ,rust-libz-sys-1.0)
        ("rust-miniz-sys" ,rust-miniz-sys-0.1)
        ("rust-miniz-oxide" ,rust-miniz-oxide-0.3)
        ("rust-tokio-io" ,rust-tokio-io-0.1))
       #:cargo-development-inputs
       (("rust-futures" ,rust-futures-0.1)
        ("rust-quickcheck" ,rust-quickcheck-0.9)
        ("rust-rand" ,rust-rand-0.7)
        ("rust-tokio-io" ,rust-tokio-io-0.1)
        ("rust-tokio-tcp" ,rust-tokio-tcp-0.1)
        ("rust-tokio-threadpool" ,rust-tokio-threadpool-0.1))))
    (home-page "https://github.com/alexcrichton/flate2-rs")
    (synopsis
     "Bindings to miniz.c for DEFLATE compression and decompression")
    (description
     "Bindings to miniz.c for DEFLATE compression and decompression exposed as
Reader/Writer streams.  Contains bindings for zlib, deflate, and gzip-based
streams.")
    (license (list license:expat license:asl2.0))))

(define-public rust-float-cmp-0.5
  (package
    (name "rust-float-cmp")
    (version "0.5.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "float-cmp" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "03hmx3n48hjm0x1ig84n1j87kzp75lzr6cj1sgi6a6pykgn4n8km"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-num-traits" ,rust-num-traits-0.2))))
    (home-page "https://github.com/mikedilger/float-cmp")
    (synopsis "Floating point approximate comparison traits")
    (description
     "Floating point approximate comparison traits in Rust.")
    (license license:expat)))

(define-public rust-float-cmp-0.3
  (package
    (inherit rust-float-cmp-0.5)
    (name "rust-float-cmp")
    (version "0.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "float-cmp" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1c0hmj46xma5aysz0qb49padhc26aw875whx6q6rglsj5dqpds1b"))))
    (arguments
     `(#:cargo-inputs (("rust-num" ,rust-num-0.1))))))

(define-public rust-float-ord-0.2
  (package
    (name "rust-float-ord")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "float-ord" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0kin50365sr3spnbscq43lksymybi99ai9rkqdw90m6vixhlibbv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-rand" ,rust-rand-0.3))))
    (home-page "https://github.com/notriddle/rust-float-ord")
    (synopsis "Total ordering for floating-point numbers")
    (description
     "This package provides a total ordering for floating-point numbers.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-fnv-1.0
  (package
    (name "rust-fnv")
    (version "1.0.6")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "fnv" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1ww56bi1r5b8id3ns9j3qxbi7w5h005rzhiryy0zi9h97raqbb9g"))))
    (build-system cargo-build-system)
    (arguments '(#:skip-build? #t))
    (home-page "https://github.com/servo/rust-fnv")
    (synopsis "Implementation of the Fowler-Noll-Vo hash function")
    (description "The @code{fnv} hash function is a custom @code{Hasher}
implementation that is more efficient for smaller hash keys.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-font-kit-0.4
  (package
    (name "rust-font-kit")
    (version "0.4.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "font-kit" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1fmg1jmqdvsjxjbyz8chpx1mhp544mwq128ns1shhrha5a6zzdqp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-lyon-path" ,rust-lyon-path-0.14)
        ("rust-core-graphics" ,rust-core-graphics-0.17)
        ("rust-float-ord" ,rust-float-ord-0.2)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-euclid" ,rust-euclid-0.20)
        ("rust-winapi" ,rust-winapi-0.3)
        ("rust-servo-fontconfig"
         ,rust-servo-fontconfig-0.4)
        ("rust-freetype" ,rust-freetype-0.4)
        ("rust-log" ,rust-log-0.4)
        ("rust-core-foundation"
         ,rust-core-foundation-0.6)
        ("rust-memmap" ,rust-memmap-0.7)
        ("rust-dwrote" ,rust-dwrote-0.9)
        ("rust-dirs" ,rust-dirs-1.0)
        ("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-core-text" ,rust-core-text-13)
        ("rust-walkdir" ,rust-walkdir-2.3))))
    (home-page "https://github.com/servo/font-kit")
    (synopsis "Cross-platform font loading library")
    (description
     "This package provides a cross-platform font loading library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-foreign-types-0.5
  (package
    (name "rust-foreign-types")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "foreign-types" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0rfr2zfxnx9rz3292z5nyk8qs2iirznn5ff3rd4vgdwza6mdjdyp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-foreign-types-macros" ,rust-foreign-types-macros-0.2)
        ("rust-foreign-types-shared" ,rust-foreign-types-shared-0.3))))
    (home-page "https://github.com/sfackler/foreign-types")
    (synopsis "Framework for Rust wrappers over C APIs")
    (description
     "This package provides a framework for Rust wrappers over C APIs.")
    (license (list license:expat license:asl2.0))))

(define-public rust-foreign-types-0.3
  (package
    (inherit rust-foreign-types-0.5)
    (name "rust-foreign-types")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "foreign-types" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1cgk0vyd7r45cj769jym4a6s7vwshvd0z4bqrb92q1fwibmkkwzn"))))
    (arguments
     `(#:cargo-inputs
       (("rust-foreign-types-macros" ,rust-foreign-types-macros-0.1)
        ("rust-foreign-types-shared" ,rust-foreign-types-shared-0.1))))))

(define-public rust-foreign-types-macros-0.2
  (package
    (name "rust-foreign-types-macros")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "foreign-types-macros" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0x71sdffjfb123l2jn5vhz0ni09b4rdq3h3gpczd1dj1g5qlr2yv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1.0)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-1.0))))
    (home-page "https://github.com/sfackler/foreign-types")
    (synopsis "Internal crate used by foreign-types")
    (description
     "This package is an internal crate used by foreign-types.")
    (license (list license:expat license:asl2.0))))

(define-public rust-foreign-types-macros-0.1
  (package
    (inherit rust-foreign-types-macros-0.2)
    (name "rust-foreign-types-macros")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "foreign-types-macros" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0bh6z5rwdhfm987idal8r0ha5svz1li7md5l1g2a5966gya1jns0"))))))

(define-public rust-foreign-types-shared-0.3
  (package
    (name "rust-foreign-types-shared")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "foreign-types-shared" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0mg85r21bxg2i97zl3q8l3cviqz4wcbwziz875wlja3zpcrwz13n"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/sfackler/foreign-types")
    (synopsis "Internal crate used by foreign-types")
    (description
     "An internal crate used by foreign-types.")
    (license (list license:expat license:asl2.0))))

(define-public rust-foreign-types-shared-0.2
  (package
    (inherit rust-foreign-types-shared-0.3)
    (name "rust-foreign-types-shared")
    (version "0.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "foreign-types-shared" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0kanxlif1vp0ffh2r9l610jqbkmb3183yqykxq1z5w1vay2rn7y6"))))))

(define-public rust-foreign-types-shared-0.1
  (package
    (inherit rust-foreign-types-shared-0.2)
    (name "rust-foreign-types-shared")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "foreign-types-shared" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0jxgzd04ra4imjv8jgkmdq59kj8fsz6w4zxsbmlai34h26225c00"))))))

(define-public rust-fragile-0.3
  (package
    (name "rust-fragile")
    (version "0.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "fragile" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1yf2hmkw52x2dva3c9km1x8c2z5kwby7qqn8kz5ms3gs480i9y05"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/mitsuhiko/rust-fragile")
    (synopsis "Wrapper types for sending non-send values to other threads")
    (description "This package provides wrapper types for sending non-send
values to other threads.")
    (license license:asl2.0)))

(define-public rust-freetype-0.4
  (package
    (name "rust-freetype")
    (version "0.4.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "freetype" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0a70x03n68997f08bi3n47q9wyi3pv5s9v4rjc79sihb84mnp4hi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-servo-freetype-sys" ,rust-servo-freetype-sys-4))))
    (home-page "https://github.com/servo/rust-freetype")
    (synopsis "Bindings for Freetype used by Servo")
    (description
     "Bindings for Freetype used by Servo.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-freetype-rs-0.23
  (package
    (name "rust-freetype-rs")
    (version "0.23.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "freetype-rs" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "06yn6l44wad0h0i4nzs5jfq64zgf89xr01fy1w22i90j22ilnkmd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-freetype-sys" ,rust-freetype-sys-0.9)
        ("rust-libc" ,rust-libc-0.2))
       #:cargo-development-inputs
       (("rust-unicode-normalization" ,rust-unicode-normalization-0.1))))
    (inputs
     `(("freetype" ,freetype)
       ("zlib" ,zlib)))
    (home-page "https://github.com/PistonDevelopers/freetype-rs")
    (synopsis "Bindings for FreeType font library")
    (description "This package provides bindings for FreeType font library.")
    (license license:expat)))

(define-public rust-freetype-sys-0.9
  (package
    (name "rust-freetype-sys")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "freetype-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1i309xc6gcsgdfiim3j5f0sk08imr4frlzfa185iaxqciysqgikx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-libz-sys" ,rust-libz-sys-1.0)
        ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (inputs
     `(("freetype" ,freetype)
       ("zlib" ,zlib)))
    (home-page "https://github.com/PistonDevelopers/freetype-sys")
    (synopsis "Low level binding for FreeType font library")
    (description
     "This package provides low level binding for FreeType font library.")
    (license license:expat)))

(define-public rust-fs-extra-1.1
  (package
    (name "rust-fs-extra")
    (version "1.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "fs_extra" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0x6675wdhsx277k1k1235jwcv38naf20d8kwrk948ds26hh4lajz"))))
    (build-system cargo-build-system)
    (arguments '(#:skip-build? #t))
    (home-page "https://github.com/webdesus/fs_extra")
    (synopsis "Extra filesystem methods")
    (description "Expanding opportunities standard library @code{std::fs} and
@code{std::io}.  Recursively copy folders with recept information about
process and much more.")
    (license license:expat)))

(define-public rust-fs2-0.2
  (package
    (name "rust-fs2")
    (version "0.2.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fs2" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1vsih93cvds3x6f3w9bc5rnkyv8haix1px4jpcqvjyd9l7ji9m5w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f
       #:cargo-inputs
       (("rust-kernel32-sys" ,rust-kernel32-sys-0.2)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-winapi" ,rust-winapi-0.2))
       #:cargo-development-inputs
       (("rust-tempdir" ,rust-tempdir-0.3))))
    (home-page "https://github.com/danburkert/fs2-rs")
    (synopsis "File locks and file duplication")
    (description
     "This package provides cross-platform file locks and file duplication.")
    (license (list license:expat license:asl2.0))))

(define-public rust-fsevent-0.4
  (package
    (name "rust-fsevent")
    (version "0.4.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "fsevent" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1djxnc2fmv265xqf1iyfz56smh13v9r1p0w9125wjg6k3fyx3dss"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t     ; only available on macOS
       #:cargo-inputs
        (("rust-bitflags" ,rust-bitflags-1)
         ("rust-fsevent-sys" ,rust-fsevent-sys-2))
        #:cargo-development-inputs
        (("rust-tempdir" ,rust-tempdir-0.3)
         ("rust-time" ,rust-time-0.1))))
    (home-page "https://github.com/octplane/fsevent-rust")
    (synopsis "Rust bindings to the fsevent-sys macOS API")
    (description
     "This package provides Rust bindings to the @code{fsevent-sys} macOS API
for file changes notifications")
    (license license:expat)))

(define-public rust-fsevent-sys-2
  (package
    (name "rust-fsevent-sys")
    (version "2.0.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "fsevent-sys" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "18246vxk7rqn52m0sfrhivxq802i34p2wqqx5zsa0pamjj5086zl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t     ; only available on macOS
       #:cargo-inputs (("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/octplane/fsevent-rust/tree/master/fsevent-sys")
    (synopsis "Rust bindings to the fsevent macOS API")
    (description "This package provides Rust bindings to the @code{fsevent}
macOS API for file changes notifications")
    (license license:expat)))

(define-public rust-fst-0.4
  (package
    (name "rust-fst")
    (version "0.4.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "fst" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0ybmdzkknhv1wx6ws86iyixfyzc04l4nm71b9va7953r1m3i6z1z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-utf8-ranges" ,rust-utf8-ranges-1.0))))
    (home-page "https://github.com/BurntSushi/fst")
    (synopsis "Represent sets or maps of large numbers of strings.")
    (description
     "Use finite state transducers to compactly represent sets or maps of many
strings (> 1 billion is possible).")
    (license (list license:unlicense license:expat))))

(define-public rust-fuchsia-cprng-0.1
  (package
    (name "rust-fuchsia-cprng")
    (version "0.1.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "fuchsia-cprng" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1fnkqrbz7ixxzsb04bsz9p0zzazanma8znfdqjvh39n14vapfvx0"))))
    (build-system cargo-build-system)
    (arguments '(#:skip-build? #t))
    (home-page
     "https://fuchsia.googlesource.com/fuchsia/+/master/garnet/public/rust/fuchsia-cprng")
    (synopsis "Fuchsia cryptographically secure pseudorandom number generator")
    (description "Rust crate for the Fuchsia cryptographically secure
pseudorandom number generator")
    (license license:bsd-3)))

(define-public rust-fuchsia-zircon-0.3
  (package
    (name "rust-fuchsia-zircon")
    (version "0.3.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "fuchsia-zircon" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "10jxc5ks1x06gpd0xg51kcjrxr35nj6qhx2zlc5n7bmskv3675rf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-fuchsia-zircon-sys" ,rust-fuchsia-zircon-sys-0.3))))
    (home-page "https://fuchsia.googlesource.com/garnet/")
    (synopsis "Rust bindings for the Zircon kernel")
    (description "Rust bindings for the Zircon kernel.")
    (license license:bsd-3)))

(define-public rust-fuchsia-zircon-sys-0.3
  (package
    (name "rust-fuchsia-zircon-sys")
    (version "0.3.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "fuchsia-zircon-sys" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "19zp2085qsyq2bh1gvcxq1lb8w6v6jj9kbdkhpdjrl95fypakjix"))))
    (build-system cargo-build-system)
    (arguments '(#:skip-build? #t))
    (home-page "https://fuchsia.googlesource.com/garnet/")
    (synopsis "Low-level Rust bindings for the Zircon kernel")
    (description "Low-level Rust bindings for the Zircon kernel.")
    (license license:bsd-3)))

(define-public rust-futf-0.1
  (package
    (name "rust-futf")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "futf" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0fxc18bnabird5jl941nsd6d25vq8cn8barmz4d30dlkzbiir73w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-mac" ,rust-mac-0.1)
        ("rust-new-debug-unreachable" ,rust-new-debug-unreachable-1.0))))
    (home-page "https://github.com/servo/futf")
    (synopsis "Handling fragments of UTF-8")
    (description "Handling fragments of UTF-8.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-futures-0.3
  (package
    (name "rust-futures")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "futures" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "11srrbc0hp7pgz142qjfx2z07kfhc98rbfwqyrgm4mxvxib61wdn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f
       #:cargo-inputs
       (("rust-futures-channel" ,rust-futures-channel-0.3)
        ("rust-futures-core" ,rust-futures-core-0.3)
        ("rust-futures-executor" ,rust-futures-executor-0.3)
        ("rust-futures-io" ,rust-futures-io-0.3)
        ("rust-futures-sink" ,rust-futures-sink-0.3)
        ("rust-futures-task" ,rust-futures-task-0.3)
        ("rust-futures-util" ,rust-futures-util-0.3))
       #:cargo-development-inputs
       (("rust-assert-matches" ,rust-assert-matches-1.3)
        ("rust-pin-utils" ,rust-pin-utils-0.1)
        ("rust-tokio" ,rust-tokio-0.1))))
    (home-page "https://rust-lang-nursery.github.io/futures-rs")
    (synopsis "Rust implementation of futures and streams")
    (description
     "A Rust implementation of futures and streams featuring zero allocations,
composability, and iterator-like interfaces.")
    (license (list license:expat license:asl2.0))))

(define-public rust-futures-0.1
  (package
    (name "rust-futures")
    (version "0.1.29")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "futures" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1vq3cw37knnd0afw3rcjzh71i2l01v5m4ysinrrqdvnn2ql0z60v"))))
    (build-system cargo-build-system)
    (arguments '(#:skip-build? #t))
    (home-page "https://github.com/rust-lang/futures-rs")
    (synopsis "Implementation of zero-cost futures in Rust")
    (description "An implementation of @code{futures} and @code{streams}
featuring zero allocations, composability, and iterator-like interfaces.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-futures-channel-0.3
  (package
    (name "rust-futures-channel")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "futures-channel" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "11lvk749n61654ad40xn751gmxzwb697nwh36s5gs0ni2z59ibpw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f
       #:cargo-inputs
       (("rust-futures-core" ,rust-futures-core-0.3)
        ("rust-futures-sink" ,rust-futures-sink-0.3))))
    (home-page  "https://rust-lang-nursery.github.io/futures-rs")
    (synopsis "Channels for asynchronous communication using futures-rs")
    (description
     "Channels for asynchronous communication using futures-rs.")
    (license (list license:expat license:asl2.0))))

(define-public rust-futures-channel-preview-0.3
  (package
    (name "rust-futures-channel-preview")
    (version "0.3.0-alpha.17")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "futures-channel-preview" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1blgpikhw391lzrfqcgg4xsn5xc0dlybni77ka7f0vb08zaixir1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-futures-core-preview" ,rust-futures-core-preview-0.3))))
    (home-page "https://rust-lang.github.io/futures-rs/")
    (synopsis
     "Channels for asynchronous communication using futures-rs")
    (description
     "Channels for asynchronous communication using futures-rs.")
    (license (list license:expat license:asl2.0))))

(define-public rust-futures-core-0.3
  (package
    (name "rust-futures-core")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "futures-core" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0rh8q6pg08dizk5hwksvjgvkw26s3sr3b199nggv3ypyg914qmkr"))))
    (build-system cargo-build-system)
    (arguments '(#:tests? #f))
    (home-page "https://rust-lang-nursery.github.io/futures-rs")
    (synopsis "Core traits and types in for the `futures` library")
    (description "This package provides the core traits and types in for the
@code{futures} library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-futures-core-preview-0.3
  (package
    (name "rust-futures-core-preview")
    (version "0.3.0-alpha.17")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "futures-core-preview" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1xaq8m609k6cz8xydwhwp8xxyxigabcw1w9ngycfy0bnkg7iq52b"))))
    (build-system cargo-build-system)
    (arguments '(#:tests? #f))
    (home-page "https://rust-lang-nursery.github.io/futures-rs/")
    (synopsis "Core traits and types in for the @code{futures} library.")
    (description "This crate provides the core traits and types in for the
@code{futures} library.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-futures-cpupool-0.1
  (package
    (name "rust-futures-cpupool")
    (version "0.1.8")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "futures-cpupool" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1r32456gpblzfvnkf60545v8acqk7gh5zhyhi1jn669k9gicv45b"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-futures" ,rust-futures-0.1)
        ("rust-num-cpus" ,rust-num-cpus-1.11))))
    (home-page "https://github.com/rust-lang-nursery/futures-rs")
    (synopsis "Implementation of thread pools which hand out futures")
    (description
     "An implementation of thread pools which hand out futures to the results of
the computation on the threads themselves.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-futures-executor-0.3
  (package
    (name "rust-futures-executor")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "futures-executor" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0cf24wbgxqh4kdjbb557vk1axzmbpmwb8s05ga1nls1zaqv4f9qy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f
       #:cargo-inputs
       (("rust-futures-core" ,rust-futures-core-0.3)
        ("rust-futures-task" ,rust-futures-task-0.3)
        ("rust-futures-util" ,rust-futures-util-0.3)
        ("rust-num-cpus" ,rust-num-cpus-1.11))))
    (home-page "https://rust-lang-nursery.github.io/futures-rs")
    (synopsis "Executors for asynchronous tasks based on the futures-rs library")
    (description
     "This package provides executors for asynchronous tasks based on the
@code{futures-rs} library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-futures-executor-preview-0.3
  (package
    (name "rust-futures-executor-preview")
    (version "0.3.0-alpha.17")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "futures-executor-preview" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "053g5kf2qa1xhdkwp3d1grrizzy4683mpbb3y0vvm00hwl7jdfl7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-futures-channel-preview" ,rust-futures-channel-preview-0.3)
        ("rust-futures-core-preview" ,rust-futures-core-preview-0.3)
        ("rust-futures-util-preview" ,rust-futures-util-preview-0.3)
        ("rust-num-cpus" ,rust-num-cpus-1.10)
        ("rust-pin-utils" ,rust-pin-utils-0.1))))
    (home-page "https://github.com/rust-lang/futures-rs")
    (synopsis
     "Executors for asynchronous tasks based on futures-rs")
    (description
     "Executors for asynchronous tasks based on the futures-rs
library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-futures-io-0.3
  (package
    (name "rust-futures-io")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "futures-io" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1zxm41fmkrb0r39ajk3rr9invcd5bdwlafazn8m9aw4y49ymfxp6"))))
    (build-system cargo-build-system)
    (home-page "https://rust-lang-nursery.github.io/futures-rs")
    (synopsis
     "`AsyncRead` and `AsyncWrite` traits for the futures-rs library")
    (description
     "This package provides the @code{AsyncRead} and @code{AsyncWrite} traits
for the futures-rs library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-futures-io-preview-0.3
  (package
    (name "rust-futures-io-preview")
    (version "0.3.0-alpha.17")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "futures-io-preview" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0fhvwhdb8ywjjbfng0ra1r8yyc9yzpyxg9sv3spb3f7w0lk40bh8"))))
    (build-system cargo-build-system)
    (home-page "https://rust-lang-nursery.github.io/futures-rs/")
    (synopsis "Async read and write traits for the futures library")
    (description "This crate provides the @code{AsyncRead} and
@code{AsyncWrite} traits for the @code{futures-rs} library.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-futures-macro-0.3
  (package
    (name "rust-futures-macro")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "futures-macro" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0r3px32wgqfbmfyb1lrj9wplvjris5magdyhfr7xnyjk2mncbrsj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro-hack" ,rust-proc-macro-hack-0.5)
        ("rust-proc-macro2" ,rust-proc-macro2-1.0)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-1.0))))
    (home-page "https://rust-lang-nursery.github.io/futures-rs")
    (synopsis "Futures-rs procedural macro implementations")
    (description
     "This package provides the @code{futures-rs} procedural macro implementations.")
    (license (list license:expat license:asl2.0))))

(define-public rust-futures-preview-0.3
  (package
    (name "rust-futures-preview")
    (version "0.3.0-alpha.17")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "futures-preview" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0rsq8d1ciyg37i5ysd9dynwmklwy4sx466z9a72687wsi8fgj9dz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f
       #:cargo-inputs
       (("rust-futures-channel-preview" ,rust-futures-channel-preview-0.3)
        ("rust-futures-core-preview" ,rust-futures-core-preview-0.3)
        ("rust-futures-executor-preview" ,rust-futures-executor-preview-0.3)
        ("rust-futures-io-preview" ,rust-futures-io-preview-0.3)
        ("rust-futures-sink-preview" ,rust-futures-sink-preview-0.3)
        ("rust-futures-util-preview" ,rust-futures-util-preview-0.3))))
    (home-page "https://rust-lang-nursery.github.io/futures-rs")
    (synopsis "An implementation of futures and streams")
    (description
     "An implementation of futures and streams featuring zero allocations,
composability, and iterator-like interfaces.")
    (license (list license:expat license:asl2.0))))

(define-public rust-futures-select-macro-preview-0.3
  (package
    (name "rust-futures-select-macro-preview")
    (version "0.3.0-alpha.17")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "futures-select-macro-preview" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1a90ivjzkgz7msiz5si05xzi8xwsk5gar1gkrbmrgqpgkliqd7a6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro-hack" ,rust-proc-macro-hack-0.5)
        ("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-0.6)
        ("rust-syn" ,rust-syn-0.15))))
    (home-page "https://github.com/rust-lang/futures-rs")
    (synopsis
     "Handle the first Future to complete")
    (description
     "The @code{select!} macro for waiting on multiple different
@code{Future}s at once and handling the first one to complete.")
    (license (list license:expat license:asl2.0))))

(define-public rust-futures-sink-0.3
  (package
    (name "rust-futures-sink")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "futures-sink" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "05iwskzxq3yqvxv9l1kqnd7kkmp0dwc39fnvwrcjsg76z8zf66qp"))))
    (build-system cargo-build-system)
    (home-page "https://rust-lang-nursery.github.io/futures-rs")
    (synopsis "Asynchronous `Sink` trait for the futures-rs library")
    (description "This package provides the asynchronous @code{Sink} trait for
the futures-rs library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-futures-sink-preview-0.3
  (package
    (name "rust-futures-sink-preview")
    (version "0.3.0-alpha.17")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "futures-sink-preview" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1r4d0gy73hdxkh5g1lrhl1kjnwp6mywjgcj70v0z78b921da42a3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-futures-core-preview" ,rust-futures-core-preview-0.3))))
    (home-page "https://rust-lang-nursery.github.io/futures-rs/")
    (synopsis  "Asynchronous `Sink` trait for the futures-rs library")
    (description
     "This package provides the asynchronous @code{Sink} trait for the
futures-rs library.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-futures-task-0.3
  (package
    (name "rust-futures-task")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "futures-task" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1yg5d7b3z58mhqbrax5a0qdsfvzfclwyqvw5k3i41x4wnbb55bhb"))))
    (build-system cargo-build-system)
    (arguments '(#:tests? #f))
    (home-page "https://rust-lang-nursery.github.io/futures-rs")
    (synopsis "Tools for working with tasks")
    (description "Tools for working with tasks.")
    (license (list license:expat license:asl2.0))))

(define-public rust-futures-util-0.3
  (package
    (name "rust-futures-util")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "futures-util" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0xlyqdn6lnpkw27lwxczihx91h64gbdd31n8c8y5v63nzds65mn0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-futures" ,rust-futures-0.1)
        ("rust-futures-channel" ,rust-futures-channel-0.3)
        ("rust-futures-core" ,rust-futures-core-0.3)
        ("rust-futures-io" ,rust-futures-io-0.3)
        ("rust-futures-macro" ,rust-futures-macro-0.3)
        ("rust-futures-sink" ,rust-futures-sink-0.3)
        ("rust-futures-task" ,rust-futures-task-0.3)
        ("rust-memchr" ,rust-memchr-2.2)
        ("rust-pin-utils" ,rust-pin-utils-0.1)
        ("rust-proc-macro-hack" ,rust-proc-macro-hack-0.5)
        ("rust-proc-macro-nested" ,rust-proc-macro-nested-0.1)
        ("rust-slab" ,rust-slab-0.4)
        ("rust-tokio-io" ,rust-tokio-io-0.1))))
    (home-page "https://rust-lang-nursery.github.io/futures-rs")
    (synopsis "Common utilities and extension traits for the futures-rs library")
    (description "This package provides common utilities and extension traits
for the futures-rs library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-futures-util-preview-0.3
  (package
    (name "rust-futures-util-preview")
    (version "0.3.0-alpha.17")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "futures-util-preview" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0kizm86wgr5qldyavskfi0r1msg6m4x2pkj0d4r04br2ig29i0dg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f
       #:cargo-inputs
       (("rust-futures" ,rust-futures-0.1)
        ("rust-futures-channel-preview" ,rust-futures-channel-preview-0.3)
        ("rust-futures-core-preview" ,rust-futures-core-preview-0.3)
        ("rust-futures-io-preview" ,rust-futures-io-preview-0.3)
        ("rust-futures-select-macro-preview"
         ,rust-futures-select-macro-preview-0.3)
        ("rust-futures-sink-preview" ,rust-futures-sink-preview-0.3)
        ("rust-memchr" ,rust-memchr-2.2)
        ("rust-pin-utils" ,rust-pin-utils-0.1)
        ("rust-proc-macro-hack" ,rust-proc-macro-hack-0.5)
        ("rust-proc-macro-nested" ,rust-proc-macro-nested-0.1)
        ("rust-rand" ,rust-rand-0.7)
        ("rust-slab" ,rust-slab-0.4)
        ("rust-tokio-io" ,rust-tokio-io-0.1))))
    (home-page "https://github.com/rust-lang/futures-rs")
    (synopsis
     "Utilities and extension traits for futures-rs library")
    (description
     "Common utilities and extension traits for the futures-rs
library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-fxhash-0.2
  (package
    (name "rust-fxhash")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fxhash" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "037mb9ichariqi45xm6mz0b11pa92gj38ba0409z3iz239sns6y3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1.3))
       #:cargo-development-inputs
       (("rust-fnv" ,rust-fnv-1.0)
        ("rust-seahash" ,rust-seahash-3.0))))
    (home-page "https://github.com/cbreeden/fxhash")
    (synopsis "Hashing algorithm from hasher used in FireFox and Rustc")
    (description
     "This package provides a fast, non-secure, hashing algorithm
derived from an internal hasher used in FireFox and Rustc.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-gcc-0.3
  (package
    (inherit rust-cc-1.0)
    (name "rust-gcc")
    (version "0.3.55")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "gcc" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1hng1sajn4r67hndvhjysswz8niayjwvcj42zphpxzhbz89kjpwg"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/alexcrichton/cc-rs")
    (synopsis "Library to compile C/C++ code into a Rust library/application")
    (description
     "This package provides a build-time dependency for Cargo build scripts to
assist in invoking the native C compiler to compile native C code into a static
archive to be linked into Rustcode.")
    (properties '((hidden? . #t)))
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-gdi32-sys-0.2
  (package
    (name "rust-gdi32-sys")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gdi32-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0605d4ngjsspghwjv4jicajich1gnl0aik9f880ajjzjixd524h9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-winapi" ,rust-winapi-0.2)
        ("rust-winapi-build" ,rust-winapi-build-0.1))))
    (home-page "https://github.com/retep998/winapi-rs")
    (synopsis "Function definitions for the Windows API library gdi32")
    (description "This package contains function definitions for the Windows
API library @code{gdi32}.")
    (license license:expat)))

(define-public rust-gdk-pixbuf-0.7
  (package
    (name "rust-gdk-pixbuf")
    (version "0.7.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "gdk-pixbuf" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1k2g3w2p57m68bi5sldvkmgjgslgqswrjsijjhqaibdvw67409lp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-fragile" ,rust-fragile-0.3)
        ("rust-futures-preview" ,rust-futures-preview-0.3)
        ("rust-gdk-pixbuf-sys" ,rust-gdk-pixbuf-sys-0.9)
        ("rust-gio" ,rust-gio-0.7)
        ("rust-gio-sys" ,rust-gio-sys-0.9)
        ("rust-glib" ,rust-glib-0.8)
        ("rust-glib-sys" ,rust-glib-sys-0.9)
        ("rust-gobject-sys" ,rust-gobject-sys-0.9)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-gtk-rs-lgpl-docs" ,rust-gtk-rs-lgpl-docs-0.1))
       #:cargo-development-inputs
       (("rust-gir-format-check" ,rust-gir-format-check-0.1))))
    (inputs
     `(("gdk-pixbuf" ,gdk-pixbuf)))
    (home-page "https://gtk-rs.org/")
    (synopsis "Rust bindings for the GdkPixbuf library")
    (description
     "Rust bindings for the GdkPixbuf library.")
    (license license:expat)))

(define-public rust-gdk-pixbuf-sys-0.9
  (package
    (name "rust-gdk-pixbuf-sys")
    (version "0.9.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "gdk-pixbuf-sys" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1c2andpjb10y7bahh6nxnksh9m3g5qh4mgq9znx634cy1831p6fq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f      ; tests not included in release
       #:cargo-inputs
       (("rust-gio-sys" ,rust-gio-sys-0.9)
        ("rust-glib-sys" ,rust-glib-sys-0.9)
        ("rust-gobject-sys" ,rust-gobject-sys-0.9)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-pkg-config" ,rust-pkg-config-0.3))
       #:cargo-development-inputs
       (("rust-shell-words" ,rust-shell-words-0.1)
        ("rust-tempfile" ,rust-tempfile-3.1))))
    (inputs
     `(("gdk-pixbuf" ,gdk-pixbuf)))
    (home-page "https://gtk-rs.org/")
    (synopsis "FFI bindings to libgdk_pixbuf-2.0")
    (description "This package provides FFI bindings to @code{libgdk_pixbuf-2.0}.")
    (license license:expat)))

(define-public rust-generator-0.6
  (package
    (name "rust-generator")
    (version "0.6.20")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "generator" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0f07mwkarwrqrykhkzqpvfnd5crz20dd8l24psn01kiqzc71dana"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-winapi" ,rust-winapi-0.3)
        ("rust-cc" ,rust-cc-1.0)
        ("rust-rustc-version" ,rust-rustc-version-0.2))))
    (home-page "https://github.com/Xudong-Huang/generator-rs")
    (synopsis "Stackfull Generator Library in Rust")
    (description "Stackfull Generator Library in Rust.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-generic-array-0.13
  (package
    (name "rust-generic-array")
    (version "0.13.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "generic-array" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1kddwxpd58y807y1r3lijg7sw3gxm6nczl6wp57gamhv6mhygl8f"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-serde" ,rust-serde-1.0)
        ("rust-typenum" ,rust-typenum-1.10))
       #:cargo-development-inputs
       (("rust-bincode" ,rust-bincode-1.1)
        ("rust-serde-json" ,rust-serde-json-1.0))))
    (home-page
     "https://github.com/fizyk20/generic-array")
    (synopsis
     "Generic types implementing functionality of arrays")
    (description
     "Generic types implementing functionality of arrays.")
    (license license:expat)))

(define-public rust-generic-array-0.12
  (package
    (inherit rust-generic-array-0.13)
    (name "rust-generic-array")
    (version "0.12.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "generic-array" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1v5jg7djicq34nbiv1dwaki71gkny002wyy9qfn3y0hfmrs053y6"))))))

(define-public rust-genmesh-0.6
  (package
    (name "rust-genmesh")
    (version "0.6.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "genmesh" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "17qybydyblf3hjiw7mq181jpi4vrbb8dmsj0wi347r8k0m354g89"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cgmath" ,rust-cgmath-0.16)
        ("rust-mint" ,rust-mint-0.5))))
    (home-page "https://github.com/gfx-rs/genmesh")
    (synopsis "Package for generating 3D meshes")
    (description
     "This package provides a package for generating 3D meshes/")
    (license license:asl2.0)))

(define-public rust-getopts-0.2
  (package
    (name "rust-getopts")
    (version "0.2.21")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "getopts" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1mgb3qvivi26gs6ihqqhh8iyhp3vgxri6vwyrwg28w0xqzavznql"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-unicode-width" ,rust-unicode-width-0.1)
        ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1.0)
        ("rust-rustc-std-workspace-std" ,rust-rustc-std-workspace-std-1.0))
       #:cargo-development-inputs
       (("rust-log" ,rust-log-0.3))))
    (home-page "https://github.com/rust-lang/getopts")
    (synopsis "Rust library for option parsing for CLI utilities")
    (description "This library provides getopts-like option parsing.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-getrandom-0.1
  (package
    (name "rust-getrandom")
    (version "0.1.14")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "getrandom" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1sq30li71h19rhnhs1h6576ja68insajx8wvh1nn088r8pc8vg3s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
        ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-stdweb" ,rust-stdweb-0.4)
        ("rust-wasi" ,rust-wasi-0.9)
        ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1.0))))
    (home-page "https://github.com/rust-random/getrandom")
    (synopsis "Retrieve random data from system source")
    (description
     "This package provides a small cross-platform library for
retrieving random data from system source.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gfx-0.18
  (package
    (name "rust-gfx")
    (version "0.18.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "gfx" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0nqmxqi3x4ni0g78g77a6aldrv8cfvzhnpqhxyd2ap4aa3wldph1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-log" ,rust-log-0.4)
        ("rust-mint" ,rust-mint-0.5)
        ("rust-draw-state" ,rust-draw-state-0.8)
        ("rust-gfx-core" ,rust-gfx-core-0.9))))
    (home-page "https://github.com/gfx-rs/gfx")
    (synopsis "High-performance, bindless graphics API")
    (description
     "This package provides a high-performance, bindless graphics API.")
    (license license:asl2.0)))

(define-public rust-gfx-core-0.9
  (package
    (name "rust-gfx-core")
    (version "0.9.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "gfx_core" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0haldr99n12d90vqgvl77n59hywlklhdff85j2aljaz1yapdvyvm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-log" ,rust-log-0.4)
        ("rust-mint" ,rust-mint-0.5)
        ("rust-draw-state" ,rust-draw-state-0.8)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-bitflags" ,rust-bitflags-1))))
    (home-page "https://github.com/gfx-rs/gfx")
    (synopsis "Core library of Gfx-rs")
    (description "This package is a core library of Gfx-rs.")
    (license license:asl2.0)))

(define-public rust-gfx-device-gl-0.16
  (package
    (name "rust-gfx-device-gl")
    (version "0.16.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "gfx_device_gl" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1g5yg19jvxdmviljyakhd6253bnb2qg7v8iscf48ihc0ldgki70h"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-log" ,rust-log-0.4)
        ("rust-gfx-gl" ,rust-gfx-gl-0.6)
        ("rust-gfx-core" ,rust-gfx-core-0.9))))
    (home-page "https://github.com/gfx-rs/gfx")
    (synopsis "OpenGL backend for gfx-rs")
    (description "This package provides the openGL backend for gfx-rs.")
    (license license:asl2.0)))

(define-public rust-gfx-gl-0.6
  (package
    (name "rust-gfx-gl")
    (version "0.6.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "gfx_gl" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0ppzj4bgjawdqz3fvnscqk8lnmgh95pwzh0v96vwy809cxj83lzj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-gl-generator" ,rust-gl-generator-0.14))))
    (home-page "https://github.com/gfx-rs/gfx_gl")
    (synopsis "OpenGL bindings for gfx, based on gl-rs")
    (description
     "This package provides OpenGL bindings for gfx, based on gl-rs.")
    (license license:asl2.0)))

(define-public rust-gif-0.10
  (package
    (name "rust-gif")
    (version "0.10.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gif" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1bw174f7civdfgryvc8pvyhicpr96hzdajnda4s3y8iv3ch907a7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f      ; tests not included in release
       #:cargo-inputs
       (("rust-color-quant" ,rust-color-quant-1.0)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-lzw" ,rust-lzw-0.10))
       #:cargo-development-inputs
       (("rust-glob" ,rust-glob-0.3))))
    (home-page "https://github.com/image-rs/image-gif")
    (synopsis "GIF decoder and encoder")
    (description "This package provides a GIF decoder and encoder in Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gimli-0.20
  (package
    (name "rust-gimli")
    (version "0.20.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "gimli" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0cz6wg1niwfqf0mk28igsdnsm92cs57cai9jpzdmvw6hma863pc1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-fallible-iterator"
         ,rust-fallible-iterator-0.2)
        ("rust-arrayvec" ,rust-arrayvec-0.5)
        ("rust-stable-deref-trait"
         ,rust-stable-deref-trait-1.1)
        ("rust-smallvec" ,rust-smallvec-1)
        ("rust-indexmap" ,rust-indexmap-1.3)
        ("rust-byteorder" ,rust-byteorder-1.3))))
    (home-page "https://github.com/gimli-rs/gimli")
    (synopsis "Library for reading and writing the DWARF debugging format")
    (description
     "This package provides a library for reading and writing the DWARF debugging format.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-gimli-0.18
  (package
    (name "rust-gimli")
    (version "0.18.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gimli" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ma1zg2klqr47rasm7jn3zzd1j1pj2a8wkfbv5zsx10qh43phy4k"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-arrayvec" ,rust-arrayvec-0.4)
        ("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-fallible-iterator" ,rust-fallible-iterator-0.2)
        ("rust-indexmap" ,rust-indexmap-1.0)
        ("rust-stable-deref-trait" ,rust-stable-deref-trait-1.1))
       #:cargo-development-inputs
       (("rust-crossbeam" ,rust-crossbeam-0.7)
        ("rust-getopts" ,rust-getopts-0.2)
        ("rust-memmap" ,rust-memmap-0.7)
        ("rust-num-cpus" ,rust-num-cpus-1.10)
        ("rust-object" ,rust-object-0.12)
        ("rust-rayon" ,rust-rayon-1.1)
        ("rust-regex" ,rust-regex-1.1)
        ("rust-test-assembler" ,rust-test-assembler-0.1)
        ("rust-typed-arena" ,rust-typed-arena-1.4))))
    (home-page "https://github.com/gimli-rs/gimli")
    (synopsis "Reading and writing the DWARF debugging format")
    (description
     "This package provides a library for reading and writing the
DWARF debugging format.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-gio-0.7
  (package
    (name "rust-gio")
    (version "0.7.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "gio" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1qv0wc1hqyb81c03h81s3xrl9jslrw23fr4yhygxbhih9k9vaqb2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-fragile" ,rust-fragile-0.3)
        ("rust-futures-preview" ,rust-futures-preview-0.3)
        ("rust-gio-sys" ,rust-gio-sys-0.9)
        ("rust-glib" ,rust-glib-0.8)
        ("rust-glib-sys" ,rust-glib-sys-0.9)
        ("rust-gobject-sys" ,rust-gobject-sys-0.9)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-gtk-rs-lgpl-docs" ,rust-gtk-rs-lgpl-docs-0.1))
       #:cargo-development-inputs
       (("rust-gir-format-check" ,rust-gir-format-check-0.1))))
    (inputs
     `(("glib" ,glib)))
    (home-page "https://gtk-rs.org/")
    (synopsis "Rust bindings for the Gio library")
    (description "Rust bindings for the Gio library.")
    (license license:expat)))

(define-public rust-gio-sys-0.9
  (package
    (name "rust-gio-sys")
    (version "0.9.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "gio-sys" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "049rafihxp3maxg3fwj6062ni9dcfilvhfq6ibnfgsmr89925bag"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f      ; Some test libraries not included in release.
       #:cargo-inputs
       (("rust-glib-sys" ,rust-glib-sys-0.9)
        ("rust-gobject-sys" ,rust-gobject-sys-0.9)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-pkg-config" ,rust-pkg-config-0.3))
       #:cargo-development-inputs
       (("rust-shell-words" ,rust-shell-words-0.1)
        ("rust-tempfile" ,rust-tempfile-3.1))))
    (inputs
     `(("glib" ,glib)))
    (home-page "http://gtk-rs.org/")
    (synopsis "FFI bindings to libgio-2.0")
    (description "This package provides FFI bindings to libgio-2.0.")
    (license license:expat)))

(define-public rust-gir-format-check-0.1
  (package
    (name "rust-gir-format-check")
    (version "0.1.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "gir-format-check" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0znl4qcgmg0656zk9vjkwdn9wj1zpkd0m0l5jnzmahd80ii7vf4b"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/gtk-rs/gir-format-check")
    (synopsis "File format checker")
    (description "File format checker in Rust.")
    (license license:expat)))

(define-public rust-git2-0.11
  (package
    (name "rust-git2")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "git2" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1i0fgsr91r97hsjbgqnymkcyiyg0057m7m04116k3vmyqpvrwlbp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-libgit2-sys" ,rust-libgit2-sys-0.10)
        ("rust-log" ,rust-log-0.4)
        ("rust-openssl-probe" ,rust-openssl-probe-0.1)
        ("rust-openssl-sys" ,rust-openssl-sys-0.9)
        ("rust-url" ,rust-url-2.1))
       #:cargo-development-inputs
       (("rust-docopt" ,rust-docopt-1.1)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-tempfile" ,rust-tempfile-3.1)
        ("rust-thread-id" ,rust-thread-id-3.3)
        ("rust-time" ,rust-time-0.1))))
    (native-inputs
     `(("libgit2" ,libgit2)
       ("libssh2" ,libssh2)
       ("openssl" ,openssl)
       ("pkg-config" ,pkg-config)
       ("zlib" ,zlib)))
    (home-page "https://github.com/rust-lang/git2-rs")
    (synopsis "Rust bindings to libgit2")
    (description
     "Bindings to libgit2 for interoperating with git repositories.
This library is both threadsafe and memory safe and allows both
reading and writing git repositories.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-git2-0.9
  (package
    (inherit rust-git2-0.11)
    (name "rust-git2")
    (version "0.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "git2" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0cayf5w7wkvclvs8brbi7lyfxbdklwls9s49mpf2brl655yjwjwj"))))
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-libgit2-sys" ,rust-libgit2-sys-0.8)
        ("rust-log" ,rust-log-0.4)
        ("rust-openssl-probe" ,rust-openssl-probe-0.1)
        ("rust-openssl-sys" ,rust-openssl-sys-0.9)
        ("rust-url" ,rust-url-1.7))
       #:cargo-development-inputs
       (("rust-docopt" ,rust-docopt-1.1)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-tempdir" ,rust-tempdir-0.3)
        ("rust-thread-id" ,rust-thread-id-3.3)
        ("rust-time" ,rust-time-0.1))))))

(define-public rust-gl-0.11
  (package
    (name "rust-gl")
    (version "0.11.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "gl" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1wcqpyhck0xriffkmgmldy33lwk2044hb4l02d44vm4fbvicin6p"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-gl-generator" ,rust-gl-generator-0.10))))
    (home-page "https://github.com/brendanzab/gl-rs/")
    (synopsis "OpenGL bindings for rust")
    (description "This package provides OpenGL bindings for rust.")
    (license license:asl2.0)))

(define-public rust-gl-generator-0.14
  (package
    (name "rust-gl-generator")
    (version "0.14.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gl-generator" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0k8j1hmfnff312gy7x1aqjzcm8zxid7ij7dlb8prljib7b1dz58s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-khronos-api" ,rust-khronos-api-3)
        ("rust-log" ,rust-log-0.4)
        ("rust-xml-rs" ,rust-xml-rs-0.8))))
    (home-page "https://github.com/brendanzab/gl-rs/")
    (synopsis "Code generators for bindings to the Khronos OpenGL APIs")
    (description
     "Code generators for creating bindings to the Khronos OpenGL APIs.")
    (license license:asl2.0)))

(define-public rust-gl-generator-0.13
  (package
    (inherit rust-gl-generator-0.14)
    (name "rust-gl-generator")
    (version "0.13.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gl-generator" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0jpqjqpyrl73sf8y20p5rv50qz8glnsvv9infg8h4vi52zgbp66a"))))))

(define-public rust-gl-generator-0.11
 (package
   (inherit rust-gl-generator-0.13)
   (name "rust-gl-generator")
   (version "0.11.0")
   (source
    (origin
      (method url-fetch)
      (uri (crate-uri "gl-generator" version))
      (file-name
       (string-append name "-" version ".tar.gz"))
      (sha256
       (base32
        "1gdchvay0k0g931b2ki33mkfixcw4radk5b8sqsm29rahxg3v8ir"))))))

(define-public rust-gl-generator-0.10
  (package
    (name "rust-gl-generator")
    (version "0.10.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "gl_generator" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0146yd4i9wbgfrhnkc04w7n7civbanznc0q87skp6v7p7hbszzx0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-log" ,rust-log-0.4)
        ("rust-xml-rs" ,rust-xml-rs-0.8)
        ("rust-khronos-api" ,rust-khronos-api-3))))
    (home-page "https://github.com/brendanzab/gl-rs/")
    (synopsis
     "Code generators for creating bindings to the Khronos OpenGL APIs")
    (description
     "Code generators for creating bindings to the Khronos OpenGL APIs.")
    (license license:asl2.0)))

(define-public rust-gleam-0.6
  (package
    (name "rust-gleam")
    (version "0.6.19")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gleam" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1iazvk3kvw3620gm6x8hy2x1lz51k04acl78cr3ppryhk5y0vqfa"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-gl-generator" ,rust-gl-generator-0.13))))
    (home-page "https://github.com/servo/gleam")
    (synopsis "Generated OpenGL bindings and wrapper for Servo")
    (description
     "Generated OpenGL bindings and wrapper for Servo.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-glib-0.9
  (package
    (name "rust-glib")
    (version "0.9.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "glib" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1h3100mf7kdfxibjz5na0sqzbd2mcsyd8pzivn3666w414x5gys0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-futures-channel" ,rust-futures-channel-0.3)
        ("rust-futures-core" ,rust-futures-core-0.3)
        ("rust-futures-executor" ,rust-futures-executor-0.3)
        ("rust-futures-preview" ,rust-futures-preview-0.3)
        ("rust-futures-task" ,rust-futures-task-0.3)
        ("rust-futures-util" ,rust-futures-util-0.3)
        ("rust-glib-sys" ,rust-glib-sys-0.9)
        ("rust-gobject-sys" ,rust-gobject-sys-0.9)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-libc" ,rust-libc-0.2))
       #:cargo-development-inputs
       (("rust-tempfile" ,rust-tempfile-3.1))))
    (inputs
     `(("glib" ,glib)))
    (home-page "https://gtk-rs.org/")
    (synopsis "Rust bindings for the GLib library")
    (description
     "Rust bindings for the GLib library.")
    (license license:expat)))

(define-public rust-glib-0.8
  (package
    (inherit rust-glib-0.9)
    (name "rust-glib")
    (version "0.8.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "glib" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0ysy87zrwyzhfpf3d8rkyyr3amwj85wky05fsl7kx95s84l269xy"))))
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-futures-preview" ,rust-futures-preview-0.3)
        ("rust-glib-sys" ,rust-glib-sys-0.9)
        ("rust-gobject-sys" ,rust-gobject-sys-0.9)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-libc" ,rust-libc-0.2))
       #:cargo-development-inputs
       (("rust-tempfile" ,rust-tempfile-3.1))))))

(define-public rust-glib-sys-0.9
  (package
    (name "rust-glib-sys")
    (version "0.9.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "glib-sys" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1qhnwfqqcp63mx4q9744rfkq78g6ky2j8ppsxxgw0ipl08w6z1cm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f      ; Some test libraries not included in release.
       #:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-pkg-config" ,rust-pkg-config-0.3))
       #:cargo-development-inputs
       (("rust-shell-words" ,rust-shell-words-0.1)
        ("rust-tempfile" ,rust-tempfile-3.1))))
    (inputs
     `(("glib" ,glib)))
    (home-page "http://gtk-rs.org/")
    (synopsis "FFI bindings to libglib-2.0")
    (description "This package provides FFI bindings to libglib-2.0.")
    (license license:expat)))

(define-public rust-glium-0.25
  (package
    (name "rust-glium")
    (version "0.25.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "glium" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0mhjly07x10lxg802ppg16wbxddhh4fdnlg10i99qwpfamvqhzbd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-backtrace" ,rust-backtrace-0.3)
        ("rust-fnv" ,rust-fnv-1.0)
        ("rust-glutin" ,rust-glutin-0.21)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-smallvec" ,rust-smallvec-0.6)
        ("rust-takeable-option" ,rust-takeable-option-0.4))
       #:cargo-development-inputs
       (("rust-cgmath" ,rust-cgmath-0.17)
        ("rust-genmesh" ,rust-genmesh-0.6)
        ("rust-gl-generator" ,rust-gl-generator-0.11)
        ("rust-image" ,rust-image-0.21)
        ("rust-obj" ,rust-obj-0.9)
        ("rust-rand" ,rust-rand-0.6))))
    (home-page "https://github.com/glium/glium")
    (synopsis
     "OpenGL wrapper")
    (description
     "Glium is an intermediate layer between OpenGL and your application.  You
still need to manually handle the graphics pipeline, but without having to use
OpenGL's old and error-prone API.")
    (license license:asl2.0)))

(define-public rust-glob-0.3
  (package
    (name "rust-glob")
    (version "0.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "glob" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0x25wfr7vg3mzxc9x05dcphvd3nwlcmbnxrvwcvrrdwplcrrk4cv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-development-inputs
       (("rust-tempdir" ,rust-tempdir-0.3))))
    (home-page "https://github.com/rust-lang-nursery/glob")
    (synopsis "Match file paths against Unix shell style patterns")
    (description
     "This package provides support for matching file paths against Unix
shell style patterns.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-glob-0.2
  (package
    (inherit rust-glob-0.3)
    (name "rust-glob")
    (version "0.2.11")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "glob" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1ysvi72slkw784fcsymgj4308c3y03gwjjzqxp80xdjnkbh8vqcb"))))))

(define-public rust-globset-0.4
  (package
    (name "rust-globset")
    (version "0.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "globset" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1wnqxq91liknmr2w93wjq2spyxbrd1pmnhd4nbi3921dr35a4nlj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-aho-corasick" ,rust-aho-corasick-0.7)
        ("rust-bstr" ,rust-bstr-0.2)
        ("rust-fnv" ,rust-fnv-1.0)
        ("rust-log" ,rust-log-0.4)
        ("rust-regex" ,rust-regex-1.1))
       #:cargo-development-inputs
       (("rust-glob" ,rust-glob-0.3))))
    (home-page
     "https://github.com/BurntSushi/ripgrep/tree/master/globset")
    (synopsis
     "Cross platform single glob and glob set matching")
    (description
     "Cross platform single glob and glob set matching.  Glob set matching is
the process of matching one or more glob patterns against a single candidate
path simultaneously, and returning all of the globs that matched.")
    (license (list license:expat license:unlicense))))

(define-public rust-glutin-0.22
  (package
    (name "rust-glutin")
    (version "0.22.0-alpha5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "glutin" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0lilr4f335m1fq1acmshd51zblfaglw1hha6lhalnc1fw3cg0aag"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-android-glue" ,rust-android-glue-0.2)
        ("rust-cgl" ,rust-cgl-0.3)
        ("rust-cocoa" ,rust-cocoa-0.19)
        ("rust-core-foundation" ,rust-core-foundation-0.6)
        ("rust-core-graphics" ,rust-core-graphics-0.17)
        ("rust-glutin-egl-sys" ,rust-glutin-egl-sys-0.1)
        ("rust-glutin-emscripten-sys" ,rust-glutin-emscripten-sys-0.1)
        ("rust-glutin-gles2-sys" ,rust-glutin-gles2-sys-0.1)
        ("rust-glutin-glx-sys" ,rust-glutin-glx-sys-0.1)
        ("rust-glutin-wgl-sys" ,rust-glutin-wgl-sys-0.1)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-libloading" ,rust-libloading-0.5)
        ("rust-log" ,rust-log-0.4)
        ("rust-objc" ,rust-objc-0.2)
        ("rust-osmesa-sys" ,rust-osmesa-sys-0.1)
        ("rust-parking-lot" ,rust-parking-lot-0.9)
        ("rust-wayland-client" ,rust-wayland-client-0.23)
        ("rust-winapi" ,rust-winapi-0.3)
        ("rust-winit" ,rust-winit-0.20))))
    (home-page "https://github.com/tomaka/glutin")
    (synopsis
     "Cross-platform OpenGL context provider")
    (description
     "Cross-platform OpenGL context provider.")
    (license license:asl2.0)))

(define-public rust-glutin-0.21
  (package
    (inherit rust-glutin-0.22)
    (name "rust-glutin")
    (version "0.21.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "glutin" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ggyyqn7dvz4yx5ygqfvnxwfb78wvdm5y6xqw5my1b4x61dv6wak"))))
    (arguments
     `(#:cargo-inputs
       (("rust-android-glue" ,rust-android-glue-0.2)
        ("rust-cgl" ,rust-cgl-0.2)
        ("rust-cocoa" ,rust-cocoa-0.18)
        ("rust-core-foundation" ,rust-core-foundation-0.6)
        ("rust-core-graphics" ,rust-core-graphics-0.17)
        ("rust-glutin-egl-sys" ,rust-glutin-egl-sys-0.1)
        ("rust-glutin-emscripten-sys" ,rust-glutin-emscripten-sys-0.1)
        ("rust-glutin-gles2-sys" ,rust-glutin-gles2-sys-0.1)
        ("rust-glutin-glx-sys" ,rust-glutin-glx-sys-0.1)
        ("rust-glutin-wgl-sys" ,rust-glutin-wgl-sys-0.1)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-libloading" ,rust-libloading-0.5)
        ("rust-objc" ,rust-objc-0.2)
        ("rust-osmesa-sys" ,rust-osmesa-sys-0.1)
        ("rust-parking-lot" ,rust-parking-lot-0.9)
        ("rust-wayland-client" ,rust-wayland-client-0.21)
        ("rust-winapi" ,rust-winapi-0.3)
        ("rust-winit" ,rust-winit-0.19))))))

(define-public rust-glutin-egl-sys-0.1
  (package
    (name "rust-glutin-egl-sys")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "glutin-egl-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0k1x1frdp4wp47qkai8zzmgqxzpfcn7780m29qgd92lbnbrxwbkp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-winapi" ,rust-winapi-0.3)
        ("rust-gl-generator" ,rust-gl-generator-0.13))))
    (home-page "https://github.com/rust-windowing/glutin")
    (synopsis "Egl bindings for glutin")
    (description "The egl bindings for glutin.")
    (license license:asl2.0)))

(define-public rust-glutin-emscripten-sys-0.1
  (package
    (name "rust-glutin-emscripten-sys")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "glutin_emscripten_sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ix0jmm8p5if4qarzdfl5mz9rbq4hhgqarakb3bzwvyz13dkynr4"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/tomaka/glutin")
    (synopsis "Emscripten bindings for glutin")
    (description "The emscripten bindings for glutin.")
    (license license:asl2.0)))

(define-public rust-glutin-gles2-sys-0.1
  (package
    (name "rust-glutin-gles2-sys")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "glutin_gles2_sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1pswvl5zyqmqwzjr674yzslj0al2xbqsp2ai9ggb9qbshlq6r6c9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-objc" ,rust-objc-0.2)
        ("rust-gl-generator" ,rust-gl-generator-0.11))))
    (home-page "https://github.com/tomaka/glutin")
    (synopsis "The gles2 bindings for glutin")
    (description "The gles2 bindings for glutin.")
    (license license:asl2.0)))

(define-public rust-glutin-glx-sys-0.1
  (package
    (name "rust-glutin-glx-sys")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "glutin-glx-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0mxs3mil68xqqb49466n5rpwpcllj6fwqjgrcrzzmz26bv5ab40j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-x11-dl" ,rust-x11-dl-2)
        ("rust-gl-generator" ,rust-gl-generator-0.11))))
    (home-page "https://github.com/tomaka/glutin")
    (synopsis "Glx bindings for glutin")
    (description "The glx bindings for glutin.")
    (license license:asl2.0)))

(define-public rust-glutin-wgl-sys-0.1
  (package
    (name "rust-glutin-wgl-sys")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "glutin-wgl-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "08chlfzpj59q36qm212i4k879gvjzha7i90q90fds8pw3v4vn0gq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-gl-generator" ,rust-gl-generator-0.11))))
    (home-page "https://github.com/tomaka/glutin")
    (synopsis "Wgl bindings for glutin")
    (description "The wgl bindings for glutin.")
    (license license:asl2.0)))

(define-public rust-gobject-sys-0.9
  (package
    (name "rust-gobject-sys")
    (version "0.9.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "gobject-sys" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1nakflbp3gjaas4fw7sn3p1p32khyfpcq1h06z7yqd10yq2ail9i"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f      ; Some test libraries not included in release.
       #:cargo-inputs
       (("rust-glib-sys" ,rust-glib-sys-0.9)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-pkg-config" ,rust-pkg-config-0.3))
       #:cargo-development-inputs
       (("rust-shell-words" ,rust-shell-words-0.1)
        ("rust-tempfile" ,rust-tempfile-3.1))))
    (inputs
     `(("glib" ,glib)))
    (home-page "http://gtk-rs.org/")
    (synopsis "FFI bindings to libgobject-2.0")
    (description "This package provides FFI bindings to libgobject-2.0.")
    (license license:expat)))

(define-public rust-goblin-0.2
  (package
    (name "rust-goblin")
    (version "0.2.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "goblin" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1j38fkqadbsjxawr3wnj9m0qaihcwp6pmfakmhsar881509y7mfx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-scroll" ,rust-scroll-0.10)
        ("rust-plain" ,rust-plain-0.2)
        ("rust-log" ,rust-log-0.4))))
    (home-page "https://github.com/m4b/goblin")
    (synopsis "ELF, Mach-o, and PE binary parsing and loading crate")
    (description "This package provides an ELF, Mach-o, and PE binary parsing
and loading crate.")
    (license license:expat)))

(define-public rust-goblin-0.1
  (package
    (inherit rust-goblin-0.2)
    (name "rust-goblin")
    (version "0.1.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "goblin" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1nn0aa2jf207gbyccxnrzm7n217di025z5y1ybblp7nkk11j309h"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-scroll" ,rust-scroll-0.10)
        ("rust-plain" ,rust-plain-0.2)
        ("rust-log" ,rust-log-0.4))))))

(define-public rust-goblin-0.0
  (package
    (name "rust-goblin")
    (version "0.0.23")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "goblin" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1g92bl76dgc3v3rins61l811pkwsl3jif1x35h2jx33b7dsv8mmc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-log" ,rust-log-0.4)
        ("rust-plain" ,rust-plain-0.2)
        ("rust-scroll" ,rust-scroll-0.9))))
    (home-page "https://github.com/m4b/goblin")
    (synopsis "Binary parsing and loading")
    (description
     "An impish, cross-platform, ELF, Mach-o, and PE binary parsing and
loading crate.")
    (license license:expat)))

(define-public rust-grep-0.2
  (package
    (name "rust-grep")
    (version "0.2.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "grep" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1pkhjladybzzciwg0mjk3vjz5fyi76hk0d3hgyzv2jxlyp8v4fyc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-grep-cli" ,rust-grep-cli-0.1)
        ("rust-grep-matcher" ,rust-grep-matcher-0.1)
        ("rust-grep-pcre2" ,rust-grep-pcre2-0.1)
        ("rust-grep-printer" ,rust-grep-printer-0.1)
        ("rust-grep-regex" ,rust-grep-regex-0.1)
        ("rust-grep-searcher" ,rust-grep-searcher-0.1))
       #:cargo-development-inputs
       (("rust-termcolor" ,rust-termcolor-1.0)
        ("rust-walkdir" ,rust-walkdir-2.2))))
    (home-page "https://github.com/BurntSushi/ripgrep")
    (synopsis "Line oriented regex searching as a library")
    (description
     "Fast line oriented regex searching as a library.")
    (license (list license:unlicense license:expat))))

(define-public rust-grep-cli-0.1
  (package
    (name "rust-grep-cli")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "grep-cli" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "05a502x5m4fijwx7zj9icxna2dx86scm76ap80zr89pnvpbfk1hp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-atty" ,rust-atty-0.2)
        ("rust-bstr" ,rust-bstr-0.2)
        ("rust-globset" ,rust-globset-0.4)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-log" ,rust-log-0.4)
        ("rust-regex" ,rust-regex-1.1)
        ("rust-same-file" ,rust-same-file-1.0)
        ("rust-termcolor" ,rust-termcolor-1.0)
        ("rust-winapi-util" ,rust-winapi-util-0.1))))
    (home-page
     "https://github.com/BurntSushi/ripgrep")
    (synopsis
     "Utilities for search oriented command line applications")
    (description
     "Utilities for search oriented command line applications.")
    (license license:expat)))

(define-public rust-grep-matcher-0.1
  (package
    (name "rust-grep-matcher")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "grep-matcher" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "113lafx3abrr96ahpz6yn905ian1w3qsr5hijbb909p2j0xgmhkm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-memchr" ,rust-memchr-2.2))
       #:cargo-development-inputs
       (("rust-regex" ,rust-regex-1.1))))
    (home-page "https://github.com/BurntSushi/ripgrep")
    (synopsis "Trait for regular expressions")
    (description
     "This crate provides a low level interface for describing regular
expression matchers.  The @code{grep} crate uses this interface in order to make
the regex engine it uses pluggable.")
    (license (list license:expat license:unlicense))))

(define-public rust-grep-pcre2-0.1
  (package
    (name "rust-grep-pcre2")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "grep-pcre2" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1wjc3gsan20gapga8nji6jcrmwn9n85q5zf2yfq6g50c7abkc2ql"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-grep-matcher" ,rust-grep-matcher-0.1)
        ("rust-pcre2" ,rust-pcre2-0.2))))
    (native-inputs
     `(("pcre2" ,pcre2)
       ("pkg-config" ,pkg-config)))
    (home-page
     "https://github.com/BurntSushi/ripgrep")
    (synopsis "Use PCRE2 with the grep crate")
    (description "Use PCRE2 with the grep crate.")
    (license (list license:expat license:unlicense))))

(define-public rust-grep-printer-0.1
  (package
    (name "rust-grep-printer")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "grep-printer" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0mxc1yx5sx89f00imlm5d3hxwdgglv9rzwdki8ba50gvq8a2nr8m"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-base64" ,rust-base64-0.10)
        ("rust-bstr" ,rust-bstr-0.2)
        ("rust-grep-matcher" ,rust-grep-matcher-0.1)
        ("rust-grep-searcher" ,rust-grep-searcher-0.1)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-serde-json" ,rust-serde-json-1.0)
        ("rust-termcolor" ,rust-termcolor-1.0))
       #:cargo-development-inputs
       (("rust-grep-regex" ,rust-grep-regex-0.1))))
    (home-page "https://github.com/BurntSushi/ripgrep")
    (synopsis "Standard printing of search results")
    (description
     "An implementation of the grep crate's Sink trait that provides
standard printing of search results, similar to grep itself.")
    (license (list license:unlicense license:expat))))

(define-public rust-grep-regex-0.1
  (package
    (name "rust-grep-regex")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "grep-regex" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "090k1sbn4jq680dmgp1jyqs7f9dzn198k0806kc8f40jcjazd88n"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-aho-corasick" ,rust-aho-corasick-0.7)
        ("rust-grep-matcher" ,rust-grep-matcher-0.1)
        ("rust-log" ,rust-log-0.4)
        ("rust-regex" ,rust-regex-1.1)
        ("rust-regex-syntax" ,rust-regex-syntax-0.6)
        ("rust-thread-local" ,rust-thread-local-0.3)
        ("rust-utf8-ranges" ,rust-utf8-ranges-1.0))))
    (home-page "https://github.com/BurntSushi/ripgrep")
    (synopsis "Use Rust's regex library with the grep crate")
    (description
     "Use Rust's regex library with the grep crate.")
    (license (list license:unlicense license:expat))))

(define-public rust-grep-searcher-0.1
  (package
    (name "rust-grep-searcher")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "grep-searcher" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "09ag16im12v6k0lzkyvbvamn1iw15kfx1jbfldb7z5xa7208l04a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-bstr" ,rust-bstr-0.2)
        ("rust-bytecount" ,rust-bytecount-0.5)
        ("rust-encoding-rs" ,rust-encoding-rs-0.8)
        ("rust-encoding-rs-io" ,rust-encoding-rs-io-0.1)
        ("rust-grep-matcher" ,rust-grep-matcher-0.1)
        ("rust-log" ,rust-log-0.4)
        ("rust-memmap" ,rust-memmap-0.7))
       #:cargo-development-inputs
       (("rust-grep-regex" ,rust-grep-regex-0.1)
        ("rust-regex" ,rust-regex-1.1))))
    (home-page "https://github.com/BurntSushi/ripgrep")
    (synopsis "Line oriented regex searching as a library")
    (description
     "Fast line oriented regex searching as a library.")
    (license (list license:unlicense license:expat))))

(define-public rust-gtk-rs-lgpl-docs-0.1
  (package
    (name "rust-gtk-rs-lgpl-docs")
    (version "0.1.15")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "gtk-rs-lgpl-docs" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "06b1j64zg0xmhwfkyhzh3y0apclg6qihn3f7s1bd7kgjmkia4jlr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-rustdoc-stripper" ,rust-rustdoc-stripper-0.1))))
    (home-page "https://gtk-rs.org/")
    (synopsis "LGPL-licensed docs for Gtk-rs crates")
    (description
     "LGPL-licensed docs for Gtk-rs crates.")
    (license license:lgpl2.0)))

(define-public rust-gzip-header-0.3
  (package
    (name "rust-gzip-header")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gzip-header" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0fg6vm8sgsm69szwqyz7abfbyziv6pv0jkcailimlamvsfrzwc81"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-crc32fast" ,rust-crc32fast-1.2))))
    (home-page "https://github.com/oyvindln/gzip-header")
    (synopsis "Decoding and encoding the header part of gzip files")
    (description
     "This package provides a crate for decoding and encoding the header part
of gzip files based on the gzip header implementation in the @code{flate2} crate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-half-1.3
  (package
    (name "rust-half")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "half" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0diqajg3mgar511hxswl4kgqqz9a026yvn3103x5h2smknlc4lwk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-serde" ,rust-serde-1.0))))
    (home-page "https://github.com/starkat99/half-rs")
    (synopsis "Half-precision floating point f16 type")
    (description
     "Half-precision floating point f16 type for Rust implementing the
IEEE 754-2008 binary16 type.")
    (license (list license:expat license:asl2.0))))

(define-public rust-handlebars-2.0
  (package
    (name "rust-handlebars")
    (version "2.0.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "handlebars" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1m99gwjd7q7q79bk4f716wsdvcyhsrcsq4vbzcavbkmc48d194mg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
        (("rust-hashbrown" ,rust-hashbrown-0.5)
         ("rust-log" ,rust-log-0.4)
         ("rust-pest" ,rust-pest-2.1)
         ("rust-pest-derive" ,rust-pest-derive-2.1)
         ("rust-quick-error" ,rust-quick-error-1.2)
         ("rust-serde" ,rust-serde-1.0)
         ("rust-serde-json" ,rust-serde-json-1.0)
         ("rust-walkdir" ,rust-walkdir-2.2))
        #:cargo-development-inputs
        (("rust-criterion" ,rust-criterion-0.2)
         ("rust-env-logger" ,rust-env-logger-0.6)
         ("rust-maplit" ,rust-maplit-1.0)
         ("rust-serde-derive" ,rust-serde-derive-1.0)
         ("rust-tempfile" ,rust-tempfile-3.0))))
    (home-page "https://github.com/sunng87/handlebars-rust")
    (synopsis "Handlebars templating implemented in Rust")
    (description
     "This package provides handlebars templating implemented in Rust.  It is
the template engine that renders the official Rust website")
    (license license:expat)))

(define-public rust-hashbrown-0.5
  (package
    (name "rust-hashbrown")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hashbrown" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0lr3gsicplw7czapsscmii87hgzpvxf5ch92v7pi95xsipxl3pp1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
        ("rust-rayon" ,rust-rayon-1.1)
        ("rust-rustc-std-workspace-alloc" ,rust-rustc-std-workspace-alloc-1.0)
        ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1.0)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-rand" ,rust-rand-0.5)
        ("rust-rayon" ,rust-rayon-1.1)
        ("rust-rustc-hash" ,rust-rustc-hash-1.0)
        ("rust-serde-test" ,rust-serde-test-1.0))))
    (home-page "https://github.com/rust-lang/hashbrown")
    (synopsis "Rust port of Google's SwissTable hash map")
    (description
     "This package provides a Rust port of Google's SwissTable hash map.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-heapsize-0.4
  (package
    (name "rust-heapsize")
    (version "0.4.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "heapsize" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0q94q9ppqjgrw71swiyia4hgby2cz6dldp7ij57nkvhd6zmfcy8n"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/servo/heapsize")
    (synopsis "Measure the total runtime size of an object on the heap")
    (description
     "Infrastructure for measuring the total runtime size of an object on the
heap.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-heapsize-0.3
  (package
    (inherit rust-heapsize-0.4)
    (name "rust-heapsize")
    (version "0.3.9")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "heapsize" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0dmwc37vgsdjzk10443dj4f23439i9gch28jcwzmry3chrwx8v2m"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-kernel32-sys" ,rust-kernel32-sys-0.2))))))

;; This package makes use of removed features
(define-public rust-heapsize-plugin-0.1
  (package
    (name "rust-heapsize-plugin")
    (version "0.1.6")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "heapsize_plugin" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1i72isf699q9jl167g2kg4xd6h3cd05rc79zaph58aqjy0g0m9y9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-heapsize" ,rust-heapsize-0.3))))
    (home-page "https://github.com/servo/heapsize")
    (synopsis "Measure runtime size of an object on the heap")
    (description
     "This package automatically generates infrastructure for measuring the
total runtime size of an object on the heap")
    (license license:mpl2.0)))

(define-public rust-heck-0.3
  (package
    (name "rust-heck")
    (version "0.3.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "heck" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "01a2v7yvkiqxakdqz4hw3w3g4sm52ivz9cs3qcsv2arxsmw4wmi0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-unicode-segmentation" ,rust-unicode-segmentation-1.3))))
    (home-page "https://github.com/withoutboats/heck")
    (synopsis "Case conversion library")
    (description
     "This library exists to provide case conversion between common cases like
CamelCase and snake_case.  It is intended to be unicode aware, internally
consistent, and reasonably well performing.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-hermit-abi-0.1
  (package
    (name "rust-hermit-abi")
    (version "0.1.10")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "hermit-abi" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0blmmzik5cs79ivq70s9gal8ypgzj50wnl2hwsaam46gjjbz2p3j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
        (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1.0))))
    (home-page "https://github.com/hermitcore/rusty-hermit")
    (synopsis "Small interface to call functions from RustyHermit")
    (description
     "Hermit-abi is small interface to call functions from the unikernel RustyHermit.
It is used to build the target x86_64-unknown-hermit.")
    (license (list license:expat license:asl2.0))))

(define-public rust-hex-0.4
  (package
    (name "rust-hex")
    (version "0.4.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "hex" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0glsfrx2pxfsf6ivxj7vfrvd7g78j4z47ssgm5idm8p376z3jfq2"))))
    (build-system cargo-build-system)
    (arguments '(#:skip-build? #t))
    (home-page "https://github.com/KokaKiwi/rust-hex")
    (synopsis "Encode and decode data to/from hexadecimals")
    (description "This crate allows for encoding and decoding data into/from
hexadecimal representation.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-hex-0.3
  (package
    (inherit rust-hex-0.4)
    (name "rust-hex")
    (version "0.3.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "hex" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0xsdcjiik5j750j67zk42qdnmm4ahirk3gmkmcqgq7qls2jjcl40"))))))

(define-public rust-hex-literal-0.2
  (package
    (name "rust-hex-literal")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hex-literal" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1q36f0qq31ggh4ipcwb7a5g6jmci2010vn2v3qpaz4csxhhf47cn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-hex-literal-impl" ,rust-hex-literal-impl-0.2)
        ("rust-proc-macro-hack" ,rust-proc-macro-hack-0.5))))
    (home-page "https://github.com/RustCrypto/utils")
    (synopsis
     "Convert hexadecimal string to byte array at compile time")
    (description
     "Procedural macro for converting hexadecimal string to byte array at
compile time.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-hex-literal-0.1
  (package
    (inherit rust-hex-literal-0.2)
    (name "rust-hex-literal")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hex-literal" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ffnn5g9q5xhdmzj2ic5hk9y18kyqflbmqcssqcya9gixs5r5hnx"))))
    (arguments
     `(#:cargo-inputs
       (("rust-hex-literal-impl" ,rust-hex-literal-impl-0.1)
        ("rust-proc-macro-hack" ,rust-proc-macro-hack-0.4))))))

(define-public rust-hex-literal-impl-0.2
  (package
    (name "rust-hex-literal-impl")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hex-literal-impl" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0bgldhp5gdwwnikfdxigmz9b64qpgwbjqk6mfgv0pvig9s25qk4x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro-hack" ,rust-proc-macro-hack-0.5))))
    (home-page "https://github.com/RustCrypto/utils")
    (synopsis "Internal implementation of the hex-literal crate")
    (description
     "Internal implementation of the hex-literal crate.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-hex-literal-impl-0.1
  (package
    (inherit rust-hex-literal-impl-0.2)
    (name "rust-hex-literal-impl")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hex-literal-impl" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1nnxqhyn9l998ma04ip79bmpqv1as6003s03g26ynhrr471p022j"))))
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro-hack" ,rust-proc-macro-hack-0.4))))))

(define-public rust-hostname-0.1
  (package
    (name "rust-hostname")
    (version "0.1.5")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "hostname" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0kprf862qaa7lwdms6aw7f3275h0j2rwhs9nz5784pm8hdmb9ki1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-winutil" ,rust-winutil-0.1))))
    (home-page "https://github.com/svartalf/hostname")
    (synopsis "Get hostname for Rust")
    (description
     "Get hostname for Rust.")
    (license license:expat)))

(define-public rust-html5ever-0.23
  (package
    (name "rust-html5ever")
    (version "0.23.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "html5ever" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1dx8k7synrmf3fl6gcfm5q1cybfglvhc9xnvly3s5xcc0b45mrjw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-log" ,rust-log-0.4)
        ("rust-mac" ,rust-mac-0.1)
        ("rust-markup5ever" ,rust-markup5ever-0.8)
        ("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-0.6)
        ("rust-syn" ,rust-syn-0.15))
       #:cargo-development-inputs
       (("rust-criterion" ,rust-criterion-0.2)
        ("rust-rustc-serialize" ,rust-rustc-serialize-0.3)
        ("rust-rustc-test" ,rust-rustc-test-0.3)
        ("rust-typed-arena" ,rust-typed-arena-1.4))))
    (home-page "https://github.com/servo/html5ever")
    (synopsis "High-performance browser-grade HTML5 parser")
    (description
     "High-performance browser-grade HTML5 parser.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-http-0.1
  (package
    (name "rust-http")
    (version "0.1.17")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "http" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "06icxvrd26r6s7dzjavja7r47hgjb9851wblqh8frxnsy3q29lzf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-bytes" ,rust-bytes-0.4)
        ("rust-fnv" ,rust-fnv-1.0)
        ("rust-itoa" ,rust-itoa-0.4))
       #:cargo-development-inputs
       (("rust-indexmap" ,rust-indexmap-1.0)
        ("rust-quickcheck" ,rust-quickcheck-0.8)
        ("rust-rand" ,rust-rand-0.4)
        ("rust-seahash" ,rust-seahash-3.0)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-json" ,rust-serde-json-1.0))))
    (home-page "https://github.com/hyperium/http")
    (synopsis "Set of types for representing HTTP requests and responses")
    (description
     "This package provides a set of types for representing HTTP
requests and responses.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-http-req-0.5
  (package
    (name "rust-http-req")
    (version "0.5.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "http_req" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0qaw43nwvvxbnqddxhb9fh9316dn64nmkzj08pq8n49qdy51xrys"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       ;; Haven't packaged rustls and webpki because of license
       (("rust-native-tls" ,rust-native-tls-0.2)
        ("rust-unicase" ,rust-unicase-2.4))))
    (home-page "https://github.com/jayjamesjay/http_req")
    (synopsis
     "HTTP client with built-in HTTPS support")
    (description
     "Simple and lightweight HTTP client with built-in HTTPS support.")
    (license license:expat)))

(define-public rust-httparse-1.3
  (package
    (name "rust-httparse")
    (version "1.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "httparse" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "10vsfx1b8drhif08fbi0ha9d3v1f3h80w42rxh0y3hrvzl64nwz8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-development-inputs
       (("rust-pico-sys" ,rust-pico-sys-0.0))))
    (home-page "https://github.com/seanmonstar/httparse")
    (synopsis "Zero-copy HTTP/1.x parser")
    (description
     "This package provides a tiny, safe, speedy, zero-copy HTTP/1.x parser.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-humantime-1.3
  (package
    (name "rust-humantime")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "humantime" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0krwgbf35pd46xvkqg14j070vircsndabahahlv3rwhflpy4q06z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-quick-error" ,rust-quick-error-1.2))
       #:cargo-development-inputs
       (("rust-chrono" ,rust-chrono-0.4)
        ("rust-rand" ,rust-rand-0.4)
        ("rust-time" ,rust-time-0.1))))
    (home-page "https://github.com/tailhook/humantime")
    (synopsis
     "Parser and formatter for Duration and SystemTime")
    (description
     "A parser and formatter for @code{std::time::{Duration,
SystemTime}}.")
    (license (list license:expat license:asl2.0))))

(define-public rust-humantime-1.2
  (package
    (inherit rust-humantime-1.3)
    (name "rust-humantime")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "humantime" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "057ilhy6vc9iqhhby5ymh45m051pgxwq2z437gwkbnqhw7rfb9rw"))))))

(define-public rust-idna-0.2
  (package
    (name "rust-idna")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "idna" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1a9066imqpdrm1aavfasdyb1zahqaz8jmdcwdawvb1pf60y6gqh2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-matches" ,rust-matches-0.1)
        ("rust-unicode-bidi" ,rust-unicode-bidi-0.3)
        ("rust-unicode-normalization" ,rust-unicode-normalization-0.1))
       #:cargo-development-inputs
       (("rust-rustc-test" ,rust-rustc-test-0.3)
        ("rust-serde-json" ,rust-serde-json-1.0))))
    (home-page "https://github.com/servo/rust-url/")
    (synopsis "Internationalizing Domain Names in Applications and Punycode")
    (description
     "IDNA (Internationalizing Domain Names in Applications) and Punycode.")
    (license (list license:expat license:asl2.0))))

(define-public rust-idna-0.1
  (package
    (inherit rust-idna-0.2)
    (name "rust-idna")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "idna" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0kl4gs5kaydn4v07c6ka33spm9qdh2np0x7iw7g5zd8z1c7rxw1q"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-matches" ,rust-matches-0.1)
        ("rust-unicode-bidi" ,rust-unicode-bidi-0.3)
        ("rust-unicode-normalization" ,rust-unicode-normalization-0.1))
       #:cargo-development-inputs
       (("rust-rustc-serialize" ,rust-rustc-serialize-0.3)
        ("rust-rustc-test" ,rust-rustc-test-0.3))))))

(define-public rust-ignore-0.4
  (package
    (name "rust-ignore")
    (version "0.4.11")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ignore" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "07js5k91v870b2i5rl5shg37214yzwl0p6fjqy06y0v97gyawbaj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-crossbeam-channel" ,rust-crossbeam-channel-0.4)
        ("rust-globset" ,rust-globset-0.4)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-log" ,rust-log-0.4)
        ("rust-memchr" ,rust-memchr-2.2)
        ("rust-regex" ,rust-regex-1.1)
        ("rust-same-file" ,rust-same-file-1.0)
        ("rust-thread-local" ,rust-thread-local-1.0)
        ("rust-walkdir" ,rust-walkdir-2.2)
        ("rust-winapi-util" ,rust-winapi-util-0.1))))
    (home-page "https://github.com/BurntSushi/ripgrep/tree/master/ignore")
    (synopsis "Efficiently match ignore files such as .gitignore")
    (description
     "This package provides a fast library for efficiently matching
ignore files such as .gitignore against file paths.")
    (license (list license:unlicense license:expat))))

(define-public rust-image-0.22
  (package
    (name "rust-image")
    (version "0.22.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "image" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0jpbd0p1q7xx6395ba9ikz2k4cfp26qczisa8m2v15w3hzd2mv88"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f      ; Some test images are missing from the release.
       #:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-gif" ,rust-gif-0.10)
        ("rust-jpeg-decoder" ,rust-jpeg-decoder-0.1)
        ("rust-num-iter" ,rust-num-iter-0.1)
        ("rust-num-rational" ,rust-num-rational-0.2)
        ("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-png" ,rust-png-0.15)
        ("rust-scoped-threadpool" ,rust-scoped-threadpool-0.1)
        ("rust-tiff" ,rust-tiff-0.3))
       #:cargo-development-inputs
       (("rust-crc32fast" ,rust-crc32fast-1.2)
        ("rust-glob" ,rust-glob-0.3)
        ("rust-num-complex" ,rust-num-complex-0.2)
        ("rust-quickcheck" ,rust-quickcheck-0.9))))
    (home-page "https://github.com/image-rs/image")
    (synopsis "Imaging library written in Rust")
    (description
     "Imaging library written in Rust.  Provides basic filters and decoders
for the most common image formats.")
    (license license:expat)))

(define-public rust-image-0.21
  (package
    (inherit rust-image-0.22)
    (name "rust-image")
    (version "0.21.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "image" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1sv534xp8yyn7jj0q6yn2bgng1350f962g81sv8v7c6pgi31wdrm"))))
    (arguments
     `(#:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-gif" ,rust-gif-0.10)
        ("rust-jpeg-decoder" ,rust-jpeg-decoder-0.1)
        ("rust-lzw" ,rust-lzw-0.10)
        ("rust-num-iter" ,rust-num-iter-0.1)
        ("rust-num-rational" ,rust-num-rational-0.2)
        ("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-png" ,rust-png-0.14)
        ("rust-scoped-threadpool" ,rust-scoped-threadpool-0.1)
        ("rust-tiff" ,rust-tiff-0.2))
       #:cargo-development-inputs
       (("rust-glob" ,rust-glob-0.3)
        ("rust-num-complex" ,rust-num-complex-0.2)
        ("rust-quickcheck" ,rust-quickcheck-0.6))))))

(define-public rust-image-0.20
  (package
    (inherit rust-image-0.21)
    (name "rust-image")
    (version "0.20.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "image" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "01058n0jcw25pq5shn7lkvywv8c28xsxb3nwwyb4r16ijm1mnrj4"))))
    (arguments
     `(#:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-gif" ,rust-gif-0.10)
        ("rust-jpeg-decoder" ,rust-jpeg-decoder-0.1)
        ("rust-lzw" ,rust-lzw-0.10)
        ("rust-num-iter" ,rust-num-iter-0.1)
        ("rust-num-rational" ,rust-num-rational-0.2)
        ("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-png" ,rust-png-0.12)
        ("rust-scoped-threadpool" ,rust-scoped-threadpool-0.1)
        ("rust-tiff" ,rust-tiff-0.2))
       #:cargo-development-inputs
       (("rust-glob" ,rust-glob-0.2)
        ("rust-num-complex" ,rust-num-complex-0.2)
        ("rust-quickcheck" ,rust-quickcheck-0.6))))))

(define-public rust-indexmap-1.3
  (package
    (name "rust-indexmap")
    (version "1.3.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "indexmap" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "14i2gmq9pwaafvlxmsc12j6539hjgqk4j4jz40fz763vbcn08vq7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-autocfg" ,rust-autocfg-1.0)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-rayon" ,rust-rayon-1.3))))
    (home-page "https://github.com/bluss/indexmap")
    (synopsis "Hash table with consistent order and fast iteration.")
    (description
     "This package provides a hash table with consistent order and fast iteration.

The indexmap is a hash table where the iteration order of the key-value
pairs is independent of the hash values of the keys.  It has the usual
hash table functionality, it preserves insertion order except after
removals, and it allows lookup of its elements by either hash table key
or numerical index.  A corresponding hash set type is also provided.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-indexmap-1.0
  (package
    (name "rust-indexmap")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "indexmap" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "13f5k1kl2759y4xfy0vhays35fmrkmhqngbr2ny8smvrbz0ag0by"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-fnv" ,rust-fnv-1.0)
        ("rust-itertools" ,rust-itertools-0.8)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-quickcheck" ,rust-quickcheck-0.8)
        ("rust-rand" ,rust-rand-0.4)
        ("rust-serde-test" ,rust-serde-test-1.0))))
    (home-page "https://github.com/bluss/indexmap")
    (synopsis
     "Hash table with consistent order and fast iteration")
    (description
     "This package provides a hash table with consistent order and fast iteration.

The indexmap is a hash table where the iteration order of the
key-value pairs is independent of the hash values of the keys.  It has
the usual hash table functionality, it preserves insertion order
except after removals, and it allows lookup of its elements by either
hash table key or numerical index.  A corresponding hash set type is
also provided.

This crate was initially published under the name ordermap, but it was
renamed to indexmap.")
    (license (list license:expat license:asl2.0))))

(define-public rust-inflate-0.4
  (package
    (name "rust-inflate")
    (version "0.4.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "inflate" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1zxjdn8iwa0ssxrnjmywm3r1v284wryvzrf8vkc7nyf5ijbjknqw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-adler32" ,rust-adler32-1.0))))
    (home-page "https://github.com/PistonDevelopers/inflate.git")
    (synopsis "DEFLATE decoding")
    (description "This package provides DEFLATE decoding.")
    (license license:expat)))

(define-public rust-inotify-0.6
  (package
    (name "rust-inotify")
    (version "0.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "inotify" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0627k5aq44knjlrc09hl017nxap3svpl79przf26y3ciycwlbda0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-inotify-sys" ,rust-inotify-sys-0.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-mio" ,rust-mio-0.6)
        ("rust-tokio-io" ,rust-tokio-io-0.1)
        ("rust-tokio-reactor" ,rust-tokio-reactor-0.1))
       #:cargo-development-inputs
       (("rust-tempdir" ,rust-tempdir-0.3))))
    (home-page "https://github.com/inotify-rs/inotify")
    (synopsis "Idiomatic wrapper for inotify")
    (description "This package provides an idiomatic wrapper for inotify written
in Rust.")
    (license license:isc)))

(define-public rust-inotify-sys-0.1
  (package
    (name "rust-inotify-sys")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "inotify-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1h2nwgajz80qddjm4mpma94zahxw84nscbycy9pgzbjrgjl1ljp7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/inotify-rs/inotify-sys")
    (synopsis "Inotify bindings for Rust")
    (description
     "This package provides inotify bindings for the Rust programming language.")
    (license license:isc)))

(define-public rust-insta-0.8
  (package
    (name "rust-insta")
    (version "0.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "insta" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "17rvqw9xm61prncbqi3cplphr3l2dl85sljdpyr3fz2mqjgbdfwb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-chrono" ,rust-chrono-0.4)
        ("rust-ci-info" ,rust-ci-info-0.3)
        ("rust-console" ,rust-console-0.7)
        ("rust-difference" ,rust-difference-2.0)
        ("rust-failure" ,rust-failure-0.1)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-pest" ,rust-pest-2.1)
        ("rust-pest-derive" ,rust-pest-derive-2.1)
        ("rust-ron" ,rust-ron-0.4)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-json" ,rust-serde-json-1.0)
        ("rust-serde-yaml" ,rust-serde-yaml-0.8)
        ("rust-uuid" ,rust-uuid-0.7))))
    (home-page "https://github.com/mitsuhiko/insta")
    (synopsis "Snapshot testing library for Rust")
    (description
     "This package provides a snapshot testing library for Rust.")
    (license license:asl2.0)))

(define-public rust-instant-0.1
  (package
    (name "rust-instant")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "instant" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1bwca9fr29a1pyimfl94q6m6k2l57ljw1hhhvjafzs1zkqlnqd3c"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-stdweb" ,rust-stdweb-0.4)
        ("rust-time" ,rust-time-0.1)
        ("rust-web-sys" ,rust-web-sys-0.3))
       #:cargo-development-inputs
       (("rust-wasm-bindgen-test" ,rust-wasm-bindgen-test-0.2))))
    (home-page "https://github.com/sebcrozet/instant")
    (synopsis
     "Partial replacement for std::time::Instant that works on WASM too")
    (description
     "This package provides a partial replacement for @code{std::time::Instant}
that works on WASM too.")
    (license license:bsd-3)))

(define-public rust-interpolate-name-0.2
  (package
    (name "rust-interpolate-name")
    (version "0.2.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "interpolate_name" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "05vzsiqb69d1mbpaphcg4ifjsjs6g03b8pacskfcydqhh555zcxl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1.0)
        ("rust-syn" ,rust-syn-1.0)
        ("rust-quote" ,rust-quote-1.0))))
    (home-page "https://github.com/lu-zero/interpolate_name")
    (synopsis "Simple procedural macro attribute for repetitive tests")
    (description
     "Simple procedural macro attribute for repetitive tests.")
    (license license:expat)))

(define-public rust-interpolation-0.2
  (package
    (name "rust-interpolation")
    (version "0.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "interpolation" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "00icvvgc72zdgyrwwg2p0wad4hry4d2vd6l9iqpyjpmw5dykbdyk"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/pistondevelopers/interpolation")
    (synopsis "Library for interpolation")
    (description
     "This package provides a library for interpolation.")
    (license license:expat)))

(define-public rust-intervaltree-0.2
  (package
    (name "rust-intervaltree")
    (version "0.2.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "intervaltree" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "10k40gsv79kwnsqrzwmnmm6psa5fqws8yggavmbggvymv16hffdg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-smallvec" ,rust-smallvec-0.6))))
    (home-page "https://github.com/main--/rust-intervaltree")
    (synopsis "Immutable interval trees")
    (description
     "This package provides a simple and generic implementation of an
immutable interval tree.")
    (license license:expat)))

(define-public rust-iovec-0.1
  (package
    (name "rust-iovec")
    (version "0.1.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "iovec" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0ph73qygwx8i0mblrf110cj59l00gkmsgrpzz1rm85syz5pymcxj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/carllerche/iovec")
    (synopsis "Portable buffer type for scatter/gather I/O operations")
    (description
     "Portable buffer type for scatter/gather I/O operations.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-iso8601-0.1
  (package
    (name "rust-iso8601")
    (version "0.1.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "iso8601" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0xy48qyfmirslaj4dy6n4g8b564jap3cjiql35fmj5vgii7ldp0i"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-clippy" ,rust-clippy-0.0)
        ("rust-nom" ,rust-nom-1.2))))
    (home-page "https://github.com/badboy/iso8601")
    (synopsis "Parsing ISO8601 dates using nom")
    (description "Parsing ISO8601 dates using nom.")
    (license license:expat)))

(define-public rust-itertools-0.8
  (package
    (name "rust-itertools")
    (version "0.8.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "itertools" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1154j48aw913v5jnyhpxialxhdn2sfpl4d7bwididyb1r05jsspm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-either" ,rust-either-1.5))
       #:cargo-development-inputs
       (("rust-permutohedron" ,rust-permutohedron-0.2)
        ("rust-quickcheck" ,rust-quickcheck-0.7)
        ("rust-rand" ,rust-rand-0.6))))
    (home-page
     "https://github.com/rust-itertools/itertools")
    (synopsis
     "Extra iterator adaptors, iterator methods, free functions, and macros")
    (description
     "Extra iterator adaptors, iterator methods, free functions, and macros.")
    (license (list license:expat license:asl2.0))))

(define-public rust-itertools-0.7
  (package
    (inherit rust-itertools-0.8)
    (name "rust-itertools")
    (version "0.7.11")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "itertools" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "03cpsj26xmyamcalclqzr1i700vwx8hnbgxbpjvs354f8mnr8iqd"))))
    (arguments
     `(#:cargo-inputs
       (("rust-either" ,rust-either-1.5))
       #:cargo-development-inputs
       (("rust-permutohedron" ,rust-permutohedron-0.2)
        ("rust-quickcheck" ,rust-quickcheck-0.5))))))

(define-public rust-itertools-num-0.1
  (package
    (name "rust-itertools-num")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "itertools-num" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1rr7ig9nkpampcas23s91x7yac6qdnwssq3nap522xbgkqps4wm8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-num-traits" ,rust-num-traits-0.2))
       #:cargo-development-inputs
       (("rust-itertools" ,rust-itertools-0.8)
        ("rust-quickcheck" ,rust-quickcheck-0.8))))
    (home-page
     "https://github.com/bluss/itertools-num")
    (synopsis
     "Numerical iterator tools")
    (description
     "Numerical iterator tools.  Extra iterators and iterator methods
and functions.")
    (license (list license:expat license:asl2.0))))

(define-public rust-itoa-0.4
  (package
    (name "rust-itoa")
    (version "0.4.5")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "itoa" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "13nxqrfnh83a7x5rw4wq2ilp8nxvwy74dxzysdg59dbxqk0agdxq"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/dtolnay/itoa")
    (synopsis "Fast functions for printing integer primitives")
    (description "This crate provides fast functions for printing integer
primitives to an @code{io::Write}.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-itoa-0.3
  (package
    (inherit rust-itoa-0.4)
    (name "rust-itoa")
    (version "0.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "itoa" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "136vwi6l2k1vrlvfx49lhficj813pk88xrcx1q3axqh1mwms6943"))))))

(define-public rust-itoa-0.1
 (package
   (inherit rust-itoa-0.4)
   (name "rust-itoa")
   (version "0.1.1")
   (source
     (origin
       (method url-fetch)
       (uri (crate-uri "itoa" version))
       (file-name (string-append name "-" version ".crate"))
       (sha256
        (base32
         "18g7p2hrb3dk84z3frfgmszfc9hjb4ps9vp99qlb1kmf9gm8hc5f"))))))

(define-public rust-ivf-0.1
  (package
    (name "rust-ivf")
    (version "0.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "ivf" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1wfjf3rilqavrhvwagzinvng9dg28wcjk3c6c6p5qmc1xy65qfh1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-bitstream-io" ,rust-bitstream-io-0.8))))
    (home-page "https://github.com/xiph/rav1e")
    (synopsis "Simple ivf muxer")
    (description "This package provides a simple ivf muxer.")
    (license license:bsd-2)))

(define-public rust-jemalloc-sys-0.3
  (package
    (name "rust-jemalloc-sys")
    (version "0.3.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "jemalloc-sys" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0ify9vlql01qhfxlj7d4p9jvcp90mj2h69nkbq7slccvbhzryfqd"))
        (modules '((guix build utils)))
        (snippet
         '(begin (delete-file-recursively "jemalloc") #t))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ;; Build dependencies:
        ("rust-cc" ,rust-cc-1.0)
        ("rust-fs-extra" ,rust-fs-extra-1.1))
       #:phases
       (modify-phases %standard-phases
         (add-after 'configure 'override-jemalloc
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((jemalloc (assoc-ref inputs "jemalloc")))
               (setenv "JEMALLOC_OVERRIDE"
                       (string-append jemalloc "/lib/libjemalloc_pic.a")))
             #t)))))
    (native-inputs
     `(("jemalloc" ,jemalloc)))
    (home-page "https://github.com/gnzlbg/jemallocator")
    (synopsis "Rust FFI bindings to jemalloc")
    (description "This package provides Rust FFI bindings to jemalloc.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-jemalloc-sys-0.1
  (package
    (inherit rust-jemalloc-sys-0.3)
    (name "rust-jemalloc-sys")
    (version "0.1.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jemalloc-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1bh07rlzgg39ys1lsgnpxgvjj6blagp2h17fx267d0g3a272rimz"))
        (modules '((guix build utils)))
        (snippet
         '(begin (delete-file-recursively "jemalloc") #t))))))

(define-public rust-jemallocator-0.3
  (package
    (name "rust-jemallocator")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jemallocator" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0sabfa5118b7l4ars5n36s2fjyfn59w4d6mjs6rrmsa5zky67bj3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-jemalloc-sys" ,rust-jemalloc-sys-0.3)
        ("rust-libc" ,rust-libc-0.2))
       #:cargo-development-inputs
       (("rust-paste" ,rust-paste-0.1))))
    (home-page "https://github.com/gnzlbg/jemallocator")
    (synopsis "Rust allocator backed by jemalloc")
    (description
     "This package provides a Rust allocator backed by jemalloc.")
    (license (list license:expat license:asl2.0))))

(define-public rust-jemallocator-0.1
  (package
    (inherit rust-jemallocator-0.3)
    (name "rust-jemallocator")
    (version "0.1.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jemallocator" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1csabk36p06nlh3qxxsg6nkf074b2jq2cld5zriq0xazqqmd834z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-jemalloc-sys" ,rust-jemalloc-sys-0.1)
        ("rust-libc" ,rust-libc-0.2))
       #:phases
       (modify-phases %standard-phases
         (add-after 'configure 'override-jemalloc
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((jemalloc (assoc-ref inputs "jemalloc")))
               (setenv "JEMALLOC_OVERRIDE"
                       (string-append jemalloc "/lib/libjemalloc_pic.a")))
             #t)))))
    (native-inputs
     `(("jemalloc" ,jemalloc)))))

(define-public rust-jobserver-0.1
  (package
    (name "rust-jobserver")
    (version "0.1.19")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jobserver" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1q2w80v8p2pbfm8ayhjs6zi11a1hp4535z4ck8kg872z8ldnrc37"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2))
       #:cargo-development-inputs
       (("rust-futures" ,rust-futures-0.1)
        ("rust-num-cpus" ,rust-num-cpus-1.10)
        ("rust-tempdir" ,rust-tempdir-0.3)
        ("rust-tokio-core" ,rust-tokio-core-0.1)
        ("rust-tokio-process" ,rust-tokio-process-0.2))))
    (home-page "https://github.com/alexcrichton/jobserver-rs")
    (synopsis "GNU make jobserver for Rust")
    (description
     "An implementation of the GNU make jobserver for Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-jpeg-decoder-0.1
  (package
    (name "rust-jpeg-decoder")
    (version "0.1.18")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jpeg-decoder" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0lc428qgffh2a1agkq0p26mvf9rjaiswpywy5883j99mqypg0mh2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f      ; Some test files missing.
       #:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-rayon" ,rust-rayon-1.1))
       #:cargo-development-inputs
       (("rust-criterion" ,rust-criterion-0.3)
        ("rust-png" ,rust-png-0.14)
        ("rust-walkdir" ,rust-walkdir-2.2))))
    (home-page "https://github.com/image-rs/jpeg-decoder")
    (synopsis "JPEG decoder")
    (description "JPEG decoder written in Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-js-sys-0.3
  (package
    (name "rust-js-sys")
    (version "0.3.37")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "js-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0mbhpbw3zjjl51m24qx3ilq4y8xipm5sfa5hsavaabqs6wsx89va"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2))
       #:cargo-development-inputs
       (("rust-wasm-bindgen-futures" ,rust-wasm-bindgen-futures-0.4)
        ("rust-wasm-bindgen-test" ,rust-wasm-bindgen-test-0.3))))
    (home-page "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis "Bindings for all JS global objects and functions in WASM")
    (description
     "Bindings for all JS global objects and functions in all JS environments
like Node.js and browsers, built on @code{#[wasm_bindgen]} using the
wasm-bindgen crate.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-json-0.11
  (package
    (name "rust-json")
    (version "0.11.15")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "json" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1rg9jxf6bpbwis3ixd5ak8rp37him7n4z8awz4ssrxl6hyplbhlj"))))
    (build-system cargo-build-system)
    (arguments '(#:skip-build? #t))
    (home-page "https://github.com/maciejhirsz/json-rust")
    (synopsis "JSON implementation in Rust")
    (description "This crate provides a JSON implementation in Rust, reducing
friction with idiomatic Rust structs to ease interopability.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-kernel32-sys-0.2
  (package
    (name "rust-kernel32-sys")
    (version "0.2.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "kernel32-sys" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1389av0601a9yz8dvx5zha9vmkd6ik7ax0idpb032d28555n41vm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-winapi" ,rust-winapi-0.2)
        ("rust-winapi-build" ,rust-winapi-build-0.1))))
    (home-page "https://github.com/retep998/winapi-rs")
    (synopsis "Function definitions for the Windows API library kernel32")
    (description "Contains function definitions for the Windows API library
kernel32.")
    (license license:expat)))

(define-public rust-khronos-api-3
  (package
    (name "rust-khronos-api")
    (version "3.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "khronos-api" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1p0xj5mlbagqyvvnv8wmv3cr7l9y1m153888pxqwg3vk3mg5inz2"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/brendanzab/gl-rs/")
    (synopsis "Khronos XML API Registry")
    (description
     "The Khronos XML API Registry, exposed as byte string constants.")
    (license license:asl2.0)))

(define-public rust-language-tags-0.2
  (package
    (name "rust-language-tags")
    (version "0.2.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "language-tags" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "16hrjdpa827carq5x4b8zhas24d8kg4s16m6nmmn1kb7cr5qh7d9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-heapsize" ,rust-heapsize-0.3)
        ("rust-heapsize-plugin" ,rust-heapsize-plugin-0.1))))
    (home-page "https://github.com/pyfisch/rust-language-tags")
    (synopsis "Language tags for Rust")
    (description
     "Language tags can be used identify human languages, scripts e.g. Latin
script, countries and other regions.  They are commonly used in HTML and HTTP
@code{Content-Language} and @code{Accept-Language} header fields.  This package
currently supports parsing (fully conformant parser), formatting and comparing
language tags.")
    (license license:expat)))

(define-public rust-lazy-static-1.4
  (package
    (name "rust-lazy-static")
    (version "1.4.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "lazy_static" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0in6ikhw8mgl33wjv6q6xfrb5b9jr16q8ygjy803fay4zcisvaz2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-spin" ,rust-spin-0.5))
       #:cargo-development-inputs
       (("rust-doc-comment" ,rust-doc-comment-0.3))))
    (home-page  "https://github.com/rust-lang-nursery/lazy-static.rs")
    (synopsis "Macro for declaring lazily evaluated statics in Rust")
    (description
     "This package provides a macro for declaring lazily evaluated statics in
Rust.  Using this macro, it is possible to have @code{static}s that require code
to be executed at runtime in order to be initialized.  This includes anything
requiring heap allocations, like vectors or hash maps, as well as anything that
requires non-const function calls to be computed.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-lazy-static-1 rust-lazy-static-1.4)

(define-public rust-lazy-static-1.3
  (package
    (inherit rust-lazy-static-1.4)
    (name "rust-lazy-static")
    (version "1.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "lazy_static" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "052ac27w189hrf1j3hz7sga46rp84zl2hqnzyihxv78mgzr2jmxw"))))
    (arguments
     `(#:cargo-inputs (("rust-spin" ,rust-spin-0.5))))))

(define-public rust-lazy-static-0.2
  (package
    (inherit rust-lazy-static-1.4)
    (name "rust-lazy-static")
    (version "0.2.11")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "lazy_static" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0wxy8vak7jsx6r8gx475pjqpx11p2bfq4wvw6idmqi31mp3k7w3n"))))
    (arguments
     `(#:tests? #f      ; Tests fail to compile.
       #:cargo-inputs
       (("rust-compiletest-rs" ,rust-compiletest-rs-0.3)
        ("rust-spin" ,rust-spin-0.4))))))

(define-public rust-lazy-static-0.1
  (package
    (inherit rust-lazy-static-0.2)
    (name "rust-lazy-static")
    (version "0.1.16")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "lazy_static" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "05vl1h4b0iv800grsdyc3fg2bq29p70wjav6zpjvxxd5i8d6s66g"))))
    (arguments '())))

(define-public rust-lazycell-1.2
  (package
    (name "rust-lazycell")
    (version "1.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "lazycell" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0gvqycmpv7parc98i6y64ai7rvxrn1947z2a6maa02g4kvxdd55j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-clippy" ,rust-clippy-0.0))))
    (home-page "https://github.com/indiv0/lazycell")
    (synopsis "Lazily filled Cell struct")
    (description
     "This package provides a library providing a lazily filled Cell struct.")
    (license (list license:expat license:asl2.0))))

(define-public rust-lexical-core-0.4
  (package
    (name "rust-lexical-core")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "lexical-core" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1gr5y3ykghd3wjc00l3iizkj1dxylyhwi6fj6yn2qg06nzx771iz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-dtoa" ,rust-dtoa-0.4)
        ("rust-ryu" ,rust-ryu-1.0)
        ("rust-stackvector" ,rust-stackvector-1.0)
        ("rust-static-assertions" ,rust-static-assertions-0.3))
       #:cargo-development-inputs
       (("rust-approx" ,rust-approx-0.3)
        ("rust-proptest" ,rust-proptest-0.9)
        ("rust-quickcheck" ,rust-quickcheck-0.8)
        ("rust-rustc-version" ,rust-rustc-version-0.2))))
    (home-page
     "https://github.com/Alexhuszagh/rust-lexical/tree/master/lexical-core")
    (synopsis
     "Lexical, to- and from-string conversion routines")
    (description
     "Lexical, to- and from-string conversion routines.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-libc-0.2
  (package
    (name "rust-libc")
    (version "0.2.68")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libc" version))
       (file-name (string-append name "-" version ".crate"))
       (sha256
        (base32
         "1w6z9krcqn7p200sb80dxx76iyvw3jdz949zxr1sgfr3a50c186y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1.0))))
    (home-page "https://github.com/rust-lang/libc")
    (synopsis "Raw FFI bindings to platform libraries like libc")
    (description
     "The rust libc crate provides all of the definitions necessary to easily
interoperate with C code (or \"C-like\" code) on each of the platforms that Rust
supports.  This includes type definitions (e.g., c_int), constants (e.g., EINVAL)
as well as function headers (e.g., malloc).

This crate exports all underlying platform types, functions, and constants under
the crate root, so all items are accessible as @samp{libc::foo}.  The types and
values of all the exported APIs match the platform that libc is compiled for.")
    (license (list license:expat
                   license:asl2.0))))

(define-public rust-libgit2-sys-0.10
  (package
    (name "rust-libgit2-sys")
    (version "0.10.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "libgit2-sys" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0l9fvki7qxsl97vgzqwlv75nl213a5vxw7b1jaik97ala356pv6r"))
        (modules '((guix build utils)))
        (snippet
         '(begin (delete-file-recursively "libgit2") #t))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-libz-sys" ,rust-libz-sys-1.0)
        ("rust-libssh2-sys" ,rust-libssh2-sys-0.2)
        ("rust-openssl-sys" ,rust-openssl-sys-0.9)
        ;; Build dependencies:
        ("rust-cc" ,rust-cc-1.0)
        ("rust-pkg-config" ,rust-pkg-config-0.3))
       #:phases
       (modify-phases %standard-phases
         (add-after 'configure 'dont-vendor-sources
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((openssl (assoc-ref inputs "openssl")))
               (setenv "OPENSSL_DIR" openssl))
             #t)))))
    (native-inputs
     `(("libgit2" ,libgit2)
       ("openssl" ,openssl)
       ("pkg-config" ,pkg-config)
       ("zlib" ,zlib)))
    (home-page "https://github.com/rust-lang/git2-rs")
    (synopsis "Native bindings to the libgit2 library")
    (description
     "This package provides native rust bindings to the @code{libgit2} library.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-libgit2-sys-0.8
  (package
    (inherit rust-libgit2-sys-0.10)
    (name "rust-libgit2-sys")
    (version "0.8.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "libgit2-sys" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0y2mibmx7wy91s2kmb2gfb29mrqlqaxpy5wcwr8s1lwws7b9w5sc"))
        (modules '((guix build utils)))
        (snippet
         '(begin (delete-file-recursively "libgit2") #t))))))

(define-public rust-libgit2-sys-0.7
  (package
    (inherit rust-libgit2-sys-0.8)
    (name "rust-libgit2-sys")
    (version "0.7.11")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "libgit2-sys" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1wcvg2qqra2aviasvqcscl8gb2rnjnd6h998wy5dlmf2bnriqi28"))))
    (arguments '())
    (properties '((hidden? . #t)))))

(define-public rust-libloading-0.5
  (package
    (name "rust-libloading")
    (version "0.5.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "libloading" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0lyply8rcqc8agajzxs7bq6ivba9dnn1i68kgb9z2flnfjh13cgj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-winapi" ,rust-winapi-0.3)
        ("rust-cc" ,rust-cc-1.0))))
    (home-page "https://github.com/nagisa/rust_libloading/")
    (synopsis "Rust library for loading dynamic libraries")
    (description
     "A memory-safer wrapper around system dynamic library loading primitives.
The most important safety guarantee by this library is prevention of
dangling-Symbols that may occur after a Library is unloaded.  Using this library
allows loading dynamic libraries (also known as shared libraries) as well as use
functions and static variables these libraries contain.")
    (license license:isc)))

(define-public rust-libloading-0.3
  (package
    (inherit rust-libloading-0.5)
    (name "rust-libloading")
    (version "0.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libloading" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0risz19rllhdc0d7nkpwkf4pcbjjgg1iim0kkmzb6kkp874hl0ha"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f      ; Some test libraries not included in release.
       #:cargo-inputs
       (("rust-kernel32-sys" ,rust-kernel32-sys-0.2)
        ("rust-lazy-static" ,rust-lazy-static-0.2)
        ("rust-winapi" ,rust-winapi-0.2)
        ("rust-target-build-utils" ,rust-target-build-utils-0.3))))))

(define-public rust-libm-0.2
  (package
    (name "rust-libm")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libm" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0akh56sh51adhagmk9l84dyrlz60gv8ri05xhr13i1b18czkpmy7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-rand" ,rust-rand-0.6))
       #:cargo-development-inputs
       (("rust-no-panic" ,rust-no-panic-0.1))))
    (home-page "https://github.com/rust-lang/libm")
    (synopsis "Libm in pure Rust")
    (description "This package provides an implementation of libm in pure Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-libm-0.1
  (package
    (inherit rust-libm-0.2)
    (name "rust-libm")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libm" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "16pc0gx4gkg0q2s1ssq8268brn14j8344623vwhadmivc4lsmivz"))))))

(define-public rust-libnghttp2-sys-0.1
  (package
    (name "rust-libnghttp2-sys")
    (version "0.1.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "libnghttp2-sys" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0qr4lyh7righx9n22c7amlcpk906rn1jnb2zd6gdfpa3yi24s982"))))
    (build-system cargo-build-system)
    ;(inputs
    ; `(("nghttp2" ,nghttp2)))
    (home-page "https://github.com/alexcrichton/nghttp2-rs")
    (synopsis "FFI bindings for libnghttp2 (nghttp2)")
    (description
     "This package provides FFI bindings for libnghttp2 (nghttp2).")
    (properties '((hidden? . #t)))
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-libz-sys-1.0
  (package
    (name "rust-libz-sys")
    (version "1.0.25")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "libz-sys" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1gjycyl2283525abks98bhxa4r259m617xfm5z52p3p3c8ry9d9f"))
        (modules '((guix build utils)))
        (snippet
         '(begin (delete-file-recursively "src/zlib") #t))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ;; Build dependencies:
        ("rust-cc" ,rust-cc-1.0)
        ("rust-pkg-config" ,rust-pkg-config-0.3)
        ("rust-vcpkg" ,rust-vcpkg-0.2))))
    (native-inputs
     `(("pkg-config" ,pkg-config)
       ("zlib" ,zlib)))
    (home-page "https://github.com/rust-lang/libz-sys")
    (synopsis "Bindings to the system libz library")
    (description
     "This package provides bindings to the system @code{libz} library (also
known as zlib).")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-line-drawing-0.7
  (package
    (name "rust-line-drawing")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "line_drawing" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1fcna7hq1g1kkkqy07hydscx5d2zgb6gskz3vnsvsif8h8ysvisw"))))
    (build-system cargo-build-system)
    (arguments
     ;; This version does not specify any versions on dependants.
     `(#:tests? #f      ; Cannot compile line_drawing for the test suite.
       #:cargo-inputs
       (("rust-num-traits" ,rust-num-traits-0.2))
       #:cargo-development-inputs
       (("rust-bresenham" ,rust-bresenham-0.1)
        ("rust-image" ,rust-image-0.22) ; 0.17?
        ("rust-rand" ,rust-rand-0.6))))
    (home-page "https://github.com/expenses/line_drawing")
    (synopsis "Collection of line-drawing algorithms")
    (description
     "This package provides a collection of line-drawing algorithms for use in
graphics and video games.")
    (license license:expat)))

(define-public rust-line-wrap-0.1
  (package
    (name "rust-line-wrap")
    (version "0.1.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "line-wrap" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1ffa2whkyh9mwvdlpk6v8pjkg8p8mlzyjfymq5adll9a18sl80zk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-safemem" ,rust-safemem-0.3))))
    (home-page "https://bitbucket.org/marshallpierce/line-wrap-rs/src")
    (synopsis "Efficiently insert line separators")
    (description
     "Efficiently insert line separators.")
    (license license:asl2.0)))

(define-public rust-linked-hash-map-0.5
  (package
    (name "rust-linked-hash-map")
    (version "0.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "linked-hash-map" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "10qgbvh00q36ql0jh00rxh2jlq6qvl11n6mig0cvkpf4xf5bd4df"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-clippy" ,rust-clippy-0.0)
        ("rust-heapsize" ,rust-heapsize-0.4)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-test" ,rust-serde-test-1.0))))
    (home-page
     "https://github.com/contain-rs/linked-hash-map")
    (synopsis
     "HashMap wrapper that holds key-value pairs in insertion order")
    (description
     "This package provides a HashMap wrapper that holds key-value
pairs in insertion order.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-linked-hash-map-0.4
  (package
    (inherit rust-linked-hash-map-0.5)
    (name "rust-linked-hash-map")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "linked-hash-map" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0fd958y02ggwpa2246kmjky9xmnww7vxg0ik3rxgy23hgwlyqq3q"))))
    (arguments
     `(#:cargo-inputs
       (("rust-clippy" ,rust-clippy-0.0)
        ("rust-heapsize" ,rust-heapsize-0.3)
        ("rust-serde" ,rust-serde-0.9)
        ("rust-serde-test" ,rust-serde-test-0.9))))))

(define-public rust-linked-hash-map-0.3
  (package
    (inherit rust-linked-hash-map-0.5)
    (name "rust-linked-hash-map")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "linked-hash-map" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1kaf95grvfqchxn8pl0854g8ab0fzl56217hndhhhz5qqm2j09kd"))))
    (arguments
     `(#:cargo-inputs
       (("rust-clippy" ,rust-clippy-0.0)
        ("rust-serde" ,rust-serde-0.8)
        ("rust-serde-test" ,rust-serde-test-0.8))))))

(define-public rust-libssh2-sys-0.2
  (package
    (name "rust-libssh2-sys")
    (version "0.2.14")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "libssh2-sys" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "042gsgbvxgm5by4mk906j3zm4qdvzcfhjxrb55is1lrr6f0nxain"))
        (modules '((guix build utils)))
        (snippet
         '(begin (delete-file-recursively "libssh2") #t))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-libz-sys" ,rust-libz-sys-1.0)
        ("rust-openssl-sys" ,rust-openssl-sys-0.9)
        ;; Build dependencies:
        ("rust-cc" ,rust-cc-1.0)
        ("rust-pkg-config" ,rust-pkg-config-0.3)
        ("rust-vcpkg" ,rust-vcpkg-0.2))
       #:phases
       (modify-phases %standard-phases
         (add-after 'configure 'dont-vendor-sources
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((openssl (assoc-ref inputs "openssl")))
               (setenv "OPENSSL_DIR" openssl))
             #t)))))
    (native-inputs
     `(("libssh2" ,libssh2)
       ("openssl" ,openssl)
       ("pkg-config" ,pkg-config)
       ("zlib" ,zlib)))
    (home-page "https://github.com/alexcrichton/ssh2-rs")
    (synopsis "Native bindings to the libssh2 library")
    (description
     "This package provides native rust bindings to the @code{libssh2} library.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-locale-0.2
  (package
    (name "rust-locale")
    (version "0.2.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "locale" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1z87wc7z6889x1pqlrwjw8f1crshzi15q5m102lqs8y0m69f9nsz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/rust-locale/rust-locale")
    (synopsis "Library for basic localisation")
    (description
     "This package provides a library for basic localisation.")
    (license license:expat)))

(define-public rust-locale-config-0.3
  (package
    (name "rust-locale-config")
    (version "0.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "locale_config" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0d399alr1i7h7yji4vydbdbzd8hp0xaykr7h4rn3yj7l2rdw7lh8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-objc" ,rust-objc-0.2)
        ("rust-objc-foundation" ,rust-objc-foundation-0.1)
        ("rust-regex" ,rust-regex-1.3)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/rust-locale/locale_config/")
    (synopsis "Maintains locale preferences for processes and threads")
    (description
     "Maintains locale preferences for process and thread and initialises them
by inspecting the system for user preference.")
    (license license:expat)))

(define-public rust-lock-api-0.3
  (package
    (name "rust-lock-api")
    (version "0.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "lock_api" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0yzlz7f5xl5sm129dq8jqsrcrkyv7jjnqwd4zr4ijsdlxjaxxckr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-owning-ref" ,rust-owning-ref-0.4)
        ("rust-scopeguard" ,rust-scopeguard-1.0)
        ("rust-serde" ,rust-serde-1.0))))
    (home-page "https://github.com/Amanieu/parking_lot")
    (synopsis
     "Wrappers to create fully-featured Mutex and RwLock types")
    (description
     "This package provides wrappers to create fully-featured @code{Mutex} and
@code{RwLock} types.  It is compatible with @code{no_std}.")
    (license (list license:expat license:asl2.0))))

(define-public rust-lock-api-0.2
  (package
    (inherit rust-lock-api-0.3)
    (name "rust-lock-api")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "lock_api" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1zx7pksmgyggpczgw4qrr4vj2nkdk5lipgiysvr20slm552nv57d"))))))

(define-public rust-lock-api-0.1
  (package
    (inherit rust-lock-api-0.2)
    (name "rust-lock-api")
    (version "0.1.5")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "lock_api" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0b24q9mh258xa52ap636q1sxz0j5vrnp0hwbbh7ddjka3wwz3sv2"))))
    (arguments
     `(#:cargo-inputs
       (("rust-scopeguard" ,rust-scopeguard-0.3)
        ("rust-owning-ref" ,rust-owning-ref-0.4))))))

(define-public rust-log-0.4
  (package
    (name "rust-log")
    (version "0.4.8")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "log" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1xz18ixccl5c6np4linv3ypc7hpmmgpc5zzd2ymp2ssfx0mhbdhl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-serde-test" ,rust-serde-test-1.0))))
    (home-page "https://github.com/rust-lang/log")
    (synopsis "Lightweight logging facade for Rust")
    (description
     "This package provides a lightweight logging facade for Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-log-0.3
  (package
    (inherit rust-log-0.4)
    (name "rust-log")
    (version "0.3.9")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "log" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0jq23hhn5h35k7pa8r7wqnsywji6x3wn1q5q7lif5q536if8v7p1"))))
    (arguments
     `(#:cargo-inputs
       (("rust-log" ,rust-log-0.4))))))

(define-public rust-loom-0.1
  (package
    (name "rust-loom")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "loom" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1jmp5mffwwyqgp914cwz92ij2s6vk1hsnkvgndvzw74xrcfraibj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-generator" ,rust-generator-0.6)
        ("rust-scoped-tls" ,rust-scoped-tls-0.1)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-serde-json" ,rust-serde-json-1.0))))
    (home-page "https://github.com/tokio-rs/loom")
    (synopsis "Model checker for concurrent code")
    (description "Model checker for concurrent code.")
    (license license:expat)))

(define-public rust-lscolors-0.6
  (package
    (name "rust-lscolors")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "lscolors" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0jxsgkn378kxkiqdshdjdclw5wwp2xaz45cqd3yw85fhn8a38fza"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-ansi-term" ,rust-ansi-term-0.12))
       #:cargo-development-inputs
       (("rust-tempfile" ,rust-tempfile-3.1))))
    (home-page "https://github.com/sharkdp/lscolors")
    (synopsis "Colorize paths using the LS_COLORS environment variable")
    (description
     "Colorize paths using the LS_COLORS environment variable.")
    (license (list license:expat license:asl2.0))))

(define-public rust-lyon-geom-0.14
  (package
    (name "rust-lyon-geom")
    (version "0.14.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "lyon_geom" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "178z4cqqmyw0rsabbgx9phkjxjzcnq0604062lqjlq87k063216a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-euclid" ,rust-euclid-0.20)
        ("rust-arrayvec" ,rust-arrayvec-0.4)
        ("rust-serde" ,rust-serde-1.0))))
    (home-page "https://github.com/nical/lyon")
    (synopsis "2D graphics rendering on the GPU using tessellation")
    (description
     "This package provides 2D graphics rendering on the GPU using tessellation.")
    (license (list license:expat license:asl2.0))))

(define-public rust-lyon-path-0.14
  (package
    (name "rust-lyon-path")
    (version "0.14.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "lyon_path" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0qk8x46w0sf6j04l6gvhgn9kr4ymcqkmkh67w8wqahm54jn5gjqb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-lyon-geom" ,rust-lyon-geom-0.14)
        ("rust-serde" ,rust-serde-1.0))))
    (home-page "https://github.com/nical/lyon")
    (synopsis "Types and utilities to store, build and iterate over 2D paths")
    (description
     "Types and utilities to store, build and iterate over 2D paths.")
    (license (list license:expat license:asl2.0))))

(define-public rust-lzma-sys-0.1
  (package
    (name "rust-lzma-sys")
    (version "0.1.15")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "lzma-sys" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "14gyj256yh0wm77jbvmlc39v7lfn0navpfrja4alczarzlc8ir2k"))
        (modules '((guix build utils)))
        (snippet
         '(begin (delete-file-recursively "xz-5.2") #t))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-cc" ,rust-cc-1.0)
        ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (native-inputs
     `(("pkg-config" ,pkg-config)
       ("xz" ,xz)))
    (home-page "https://github.com/alexcrichton/xz2-rs")
    (synopsis "Bindings to liblzma for lzma and xz stream encoding/decoding")
    (description
     "This package contains the raw bindings to liblzma which contains an
implementation of LZMA and xz stream encoding/decoding.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-lzw-0.10
  (package
    (name "rust-lzw")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "lzw" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1170dfskhzlh8h2bm333811hykjvpypgnvxyhhm1rllyi2xpr53x"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/nwin/lzw.git")
    (synopsis "LZW compression and decompression")
    (description
     "This package provides LZW compression and decompression.")
    (license (list license:expat license:asl2.0))))

(define-public rust-mac-0.1
  (package
    (name "rust-mac")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "mac" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "194vc7vrshqff72rl56f9xgb0cazyl4jda7qsv31m5l6xx7hq7n4"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/reem/rust-mac")
    (synopsis "Collection of great and ubiqutitous macros")
    (description
     "This package provides a collection of great and ubiqutitous macros.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-make-cmd-0.1
  (package
    (name "rust-make-cmd")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "make-cmd" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ly0lc5p1a0qdiqnh19ly3snb9q83sjbbb1njvh8a5xgx3xqmjm8"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/mneumann/make-cmd-rs")
    (synopsis "Enable build.rs scripts to invoke gnu_make")
    (description "This package enables build.rs scripts to invoke gnu_make
platform-independently.")
    (license license:expat)))

(define-public rust-malloc-buf-0.0
 (package
   (name "rust-malloc-buf")
   (version "0.0.6")
   (source
    (origin
      (method url-fetch)
      (uri (crate-uri "malloc-buf" version))
      (file-name
       (string-append name "-" version ".tar.gz"))
      (sha256
       (base32
        "1jqr77j89pwszv51fmnknzvd53i1nkmcr8rjrvcxhm4dx1zr1fv2"))))
   (build-system cargo-build-system)
   (arguments
    `(#:cargo-inputs (("rust-libc" ,rust-libc-0.2))))
   (home-page "https://github.com/SSheldon/malloc_buf")
   (synopsis "Structs for handling malloc'd memory passed to Rust")
   (description
    "This package provides structs for handling malloc'd memory passed to Rust.")
   (license license:expat)))

(define-public rust-maplit-1.0
  (package
    (name "rust-maplit")
    (version "1.0.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "maplit" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "07b5kjnhrrmfhgqm9wprjw8adx6i225lqp49gasgqg74lahnabiy"))))
    (build-system cargo-build-system)
    (arguments '(#:skip-build? #t))
    (home-page "https://github.com/bluss/maplit")
    (synopsis "Collection of Map macros")
    (description "This crate provides a collection of @code{literal} macros for
@code{HashMap}, @code{HashSet}, @code{BTreeMap}, and @code{BTreeSet.}")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-markup5ever-0.9
  (package
    (name "rust-markup5ever")
    (version "0.9.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "markup5ever" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "00wxigkiw8f777pjp7q5kfq77xpwda9zskkwp698assh8yfisf35"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-log" ,rust-log-0.4)
        ("rust-phf" ,rust-phf-0.7)
        ("rust-string-cache" ,rust-string-cache-0.7)
        ("rust-tendril" ,rust-tendril-0.4)
        ("rust-phf-codegen" ,rust-phf-codegen-0.7)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-serde-json" ,rust-serde-json-1.0)
        ("rust-string-cache-codegen" ,rust-string-cache-codegen-0.4))))
    (home-page "https://github.com/servo/html5ever")
    (synopsis "Common code for xml5ever and html5ever")
    (description
     "Common code for xml5ever and html5ever.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-markup5ever-0.8
  (package
    (inherit rust-markup5ever-0.9)
    (name "rust-markup5ever")
    (version "0.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "markup5ever" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "08ayl9aqjnmf7ly1ipy6dk3wjvyfn4w51l40jzh1fh984ykldbzi"))))))

(define-public rust-matches-0.1
  (package
    (name "rust-matches")
    (version "0.1.8")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "matches" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "020axl4q7rk9vz90phs7f8jas4imxal9y9kxl4z4v7a6719mrz3z"))))
    (build-system cargo-build-system)
    (arguments '(#:skip-build? #t))
    (home-page "https://github.com/SimonSapin/rust-std-candidates")
    (synopsis "Macro to evaluate whether an expression matches a pattern")
    (description "This package provides a macro to evaluate, as a boolean,
whether an expression matches a pattern.")
    (license license:expat)))

(define-public rust-matrixmultiply-0.2
  (package
    (name "rust-matrixmultiply")
    (version "0.2.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "matrixmultiply" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "13s7nfd3dfcsrixld2lk8c563ih5xzczl2w36hprfc016rkfrxyl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-rawpointer" ,rust-rawpointer-0.2))
       #:cargo-development-inputs
       (("rust-bencher" ,rust-bencher-0.1)
        ("rust-itertools" ,rust-itertools-0.7))))
    (home-page "https://github.com/bluss/matrixmultiply/")
    (synopsis "General matrix multiplication for f32 and f64 matrices")
    (description "General matrix multiplication for f32 and f64 matrices.
Operates on matrices with general layout (they can use arbitrary row and column
stride).  Detects and uses AVX or SSE2 on x86 platforms transparently for higher
performance.  Uses a microkernel strategy, so that the implementation is easy to
parallelize and optimize.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-matrixmultiply-0.1
  (package
    (inherit rust-matrixmultiply-0.2)
    (name "rust-matrixmultiply")
    (version "0.1.15")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "matrixmultiply" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "00p0fpjhm45qdzi37mgv7ggsy8b9gqvq4999yrbgyn1dxkf6gbfw"))))
    (arguments
     `(#:cargo-inputs (("rust-rawpointer" ,rust-rawpointer-0.1))
       #:cargo-development-inputs (("rust-bencher" ,rust-bencher-0.1))))))

(define-public rust-maybe-uninit-2.0
  (package
    (name "rust-maybe-uninit")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "maybe-uninit" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "004y0nzmpfdrhz251278341z6ql34iv1k6dp1h6af7d6nd6jwc30"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/est31/maybe-uninit")
    (synopsis "MaybeUninit for friends of backwards compatibility")
    (description
     "This package provides MaybeUninit for friends of backwards compatibility.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-md5-0.6
  (package
    (name "rust-md5")
    (version "0.6.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "md5" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "17b2xm4h4cvxsdjsf3kdrzqv2za60kak961xzi5kmw6g6djcssvy"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/stainless-steel/md5")
    (synopsis "MD5 hash function in Rust")
    (description "The package provides the MD5 hash function.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-md5-0.3
  (package
    (inherit rust-md5-0.6)
    (name "rust-md5")
    (version "0.3.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "md5" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0j2s8aqdkhwhy7awga2bmv5n8qq8bgy8672iha9f3y871dm6vibr"))))))

(define-public rust-memchr-2.3
  (package
    (name "rust-memchr")
    (version "2.3.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "memchr" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0074pvsfl938ndl5js14ibc7i9q0k3zp390z843w8nlyv4bxha1p"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/BurntSushi/rust-memchr")
    (synopsis "Safe interface to memchr")
    (description "The @code{memchr} crate provides heavily optimized routines
for searching bytes.")
    (license (list license:unlicense license:expat))))

(define-public rust-memchr-2.2
  (package
    (name "rust-memchr")
    (version "2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "memchr" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "13j6ji9x9ydpi9grbss106gqqr3xn3bcfp28aydqfa4751qrfmw8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2))
       #:cargo-development-inputs
       (("rust-quickcheck" ,rust-quickcheck-0.8))))
    (home-page
     "https://github.com/BurntSushi/rust-memchr")
    (synopsis "Safe interface to memchr")
    (description "The @code{memchr} crate provides heavily optimized routines
for searching bytes.")
    (license (list license:expat license:unlicense))))

(define-public rust-memchr-1.0
  (package
    (inherit rust-memchr-2.2)
    (name "rust-memchr")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "memchr" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0yjyja34pzhipdl855q3m21w1lyih4lw79x2dp3czwdla4pap3ql"))))))

(define-public rust-memchr-0.1
  (package
    (inherit rust-memchr-1.0)
    (name "rust-memchr")
    (version "0.1.11")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "memchr" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "084d85hjfa3xf5kwdms2mhbkh78m1gl2254cp5swcxj3a7xjkdnq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2))
       #:cargo-development-inputs
       (("rust-quickcheck" ,rust-quickcheck-0.2))))))

(define-public rust-memmap-0.7
  (package
    (name "rust-memmap")
    (version "0.7.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "memmap" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0ns7kkd1h4pijdkwfvw4qlbbmqmlmzwlq3g2676dcl5vwyazv1b5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-winapi" ,rust-winapi-0.3))
       #:cargo-development-inputs
       (("rust-tempdir" ,rust-tempdir-0.3))))
    (home-page "https://github.com/danburkert/memmap-rs")
    (synopsis "Rust library for cross-platform memory mapped IO")
    (description
     "This package provides a cross-platform Rust API for memory-mapped
file IO.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-memmap-0.6
  (package
    (inherit rust-memmap-0.7)
    (name "rust-memmap")
    (version "0.6.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "memmap" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1zy6s0ni0lx9rjzq3gq2zz9r8zgjmbp02332g3gsj4fyhv4s5zz2"))))))

(define-public rust-memmap-0.2
  (package
    (inherit rust-memmap-0.6)
    (name "rust-memmap")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "memmap" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0li737lakqcbbgd87x7h8d4vp0r1fqcbn5lb5vi746i9jgnp43zj"))))
    (arguments
     `(#:cargo-inputs
       (("rust-fs2" ,rust-fs2-0.2)
        ("rust-kernel32-sys" ,rust-kernel32-sys-0.2)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-winapi" ,rust-winapi-0.2))
       #:cargo-development-inputs
       (("rust-tempdir" ,rust-tempdir-0.3))))))

(define-public rust-memoffset-0.5
  (package
    (name "rust-memoffset")
    (version "0.5.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "memoffset" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1fblqzc25hfaym8m0pj112s66pqq87avvaqm5hp5rskib2w9w63m"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-rustc-version" ,rust-rustc-version-0.2))
       #:cargo-development-inputs
       (("rust-doc-comment" ,rust-doc-comment-0.3))))
    (home-page "https://github.com/Gilnaa/memoffset")
    (synopsis
     "C-like offset_of functionality for Rust structs")
    (description "This package provides C-like @code{offset_of} functionality
for Rust structs.")
    (license license:expat)))

(define-public rust-memoffset-0.2
  (package
    (inherit rust-memoffset-0.5)
    (name "rust-memoffset")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "memoffset" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1cvm2z7dy138s302ii7wlzcxbka5a8yfl5pl5di7lbdnw9hw578g"))))
    (arguments `(#:skip-build? #t))))

(define-public rust-metadeps-1.1
  (package
    (name "rust-metadeps")
    (version "1.1.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "metadeps" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1hjla9ypycqw1snd2qf87cckcc0d5z5qvxpcijn5yrrs3f825cbk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-error-chain" ,rust-error-chain-0.10)
        ("rust-toml" ,rust-toml-0.2)
        ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page "https://github.com/joshtriplett/metadeps")
    (synopsis "Run pkg-config from declarative dependencies in Cargo.toml")
    (description "Run pkg-config from declarative dependencies in Cargo.toml.")
    (license (list license:expat license:asl2.0))))

(define-public rust-metal-0.14
  (package
    (name "rust-metal")
    (version "0.14.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "metal" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0my1xwlv562i80y3jbk0nygayi383j5skdwk48clb286b7922gyd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-block" ,rust-block-0.1)
        ("rust-cocoa" ,rust-cocoa-0.18)
        ("rust-core-graphics" ,rust-core-graphics-0.17)
        ("rust-foreign-types" ,rust-foreign-types-0.3)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-objc" ,rust-objc-0.2)
        ("rust-objc-foundation" ,rust-objc-foundation-0.1)
        ("rust-objc-id" ,rust-objc-id-0.1))
       #:cargo-development-inputs
       (("rust-sema" ,rust-sema-0.1)
        ("rust-winit" ,rust-winit-0.19)))) ; 0.17?
    (home-page "https://github.com/gfx-rs/metal-rs")
    (synopsis "Rust bindings for Metal")
    (description "Rust bindings for Metal.")
    (license (list license:expat license:asl2.0))))

(define-public rust-mime-0.3
  (package
    (name "rust-mime")
    (version "0.3.16")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "mime" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "13dcm9lh01hdwfjcg74ppljyjfj1c6w3a3cwkhxf0w8wa37cfq1a"))))
    (build-system cargo-build-system)
    (arguments '(#:skip-build? #t))
    (home-page "https://github.com/hyperium/mime")
    (synopsis "Strongly Typed Mimes")
    (description
     "Support MIME (HTTP Media Types) as strong types in Rust.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-miniz-oxide-0.3
  (package
    (name "rust-miniz-oxide")
    (version "0.3.6")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "miniz_oxide" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "198n4hfpq0qcxf275l6fpzh7b9cl7ck2xs6pjgpds74bazv9yrxa"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-adler32" ,rust-adler32-1.0))))
    (home-page  "https://github.com/Frommi/miniz_oxide/tree/master/miniz_oxide")
    (synopsis "Pure rust replacement for the miniz DEFLATE/zlib encoder/decoder")
    (description
     "A pure rust replacement for the miniz DEFLATE/zlib encoder/decoder.  Using
@code{flate2} with the @code{rust_backend} feature provides an easy to use
streaming API for miniz_oxide.")
    (license license:expat)))

(define-public rust-miniz-oxide-0.2
  (package
    (inherit rust-miniz-oxide-0.3)
    (name "rust-miniz-oxide")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "miniz_oxide" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "17f92krv9hhsyc38prpfyn99m2hqhr4fgszpsla66a6gcrnpbhxn"))))))

(define-public rust-miniz-oxide-c-api-0.2
  (package
    (name "rust-miniz-oxide-c-api")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "miniz_oxide_c_api" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1514mvlj8vl723xqxnww5cfqr2mhnqqqf18fn3df17yx8racly2v"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-crc32fast" ,rust-crc32fast-1.2)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-miniz-oxide" ,rust-miniz-oxide-0.2))
       #:cargo-development-inputs
       (("rust-cc" ,rust-cc-1.0))))
    (home-page "https://github.com/Frommi/miniz_oxide/")
    (synopsis "DEFLATE compression and decompression API")
    (description
     "DEFLATE compression and decompression API designed to be Rust
drop-in replacement for miniz.")
    (license license:expat)))

(define-public rust-miniz-sys-0.1
  (package
    (name "rust-miniz-sys")
    (version "0.1.12")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "miniz-sys" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "00l2r4anm8g35x0js2zfdnwfbrih9m43vphdpb77c5ga3kjkm7hy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ;; Build dependencies:
        ("rust-cc" ,rust-cc-1.0))))
    (home-page "https://github.com/alexcrichton/flate2-rs")
    (synopsis "Bindings to the miniz.c library")
    (description
     "This package provides bindings to the @code{miniz.c} library.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-mint-0.5
  (package
    (name "rust-mint")
    (version "0.5.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "mint" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0c4190gr348fkfijij7vm19iagwl36mssj1irc9f6m448hbhgn68"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/kvark/mint")
    (synopsis "Math interoperability standard types")
    (description
     "This package provides math interoperability standard types.")
    (license license:expat)))

(define-public rust-mio-0.6
  (package
    (name "rust-mio")
    (version "0.6.21")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "mio" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "13q02a7cwc140aygf8amadpzpl5lyj3p2r4wnvgydfpnphifqb9h"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f
       #:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-fuchsia-zircon" ,rust-fuchsia-zircon-0.3)
        ("rust-fuchsia-zircon-sys" ,rust-fuchsia-zircon-sys-0.3)
        ("rust-iovec" ,rust-iovec-0.1)
        ("rust-kernel32-sys" ,rust-kernel32-sys-0.2)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-miow" ,rust-miow-0.2)
        ("rust-net2" ,rust-net2-0.2)
        ("rust-slab" ,rust-slab-0.4)
        ("rust-winapi" ,rust-winapi-0.2))
       #:cargo-development-inputs
       (("rust-bytes" ,rust-bytes-0.3)
        ("rust-env-logger" ,rust-env-logger-0.4)
        ("rust-tempdir" ,rust-tempdir-0.3))))
    (home-page "https://github.com/tokio-rs/mio")
    (synopsis "Lightweight non-blocking IO")
    (description "Lightweight non-blocking IO.")
    (license license:expat)))

(define-public rust-mio-anonymous-pipes-0.1
  (package
    (name "rust-mio-anonymous-pipes")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "mio-anonymous-pipes" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1bqs8wncd73q4pnbiwskhgds57hyr8g89vfpqmw1vk9dqp1p9hpq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-mio" ,rust-mio-0.6)
        ("rust-miow" ,rust-miow-0.3)
        ("rust-spsc-buffer" ,rust-spsc-buffer-0.1)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/davidhewitt/mio-anonymous-pipes")
    (synopsis "Asynchronous wrapper for Windows synchronous pipes")
    (description
     "This package provides asynchronous wrapper for Windows synchronous pipes.")
    (license license:expat)))

(define-public rust-mio-extras-2
  (package
    (name "rust-mio-extras")
    (version "2.0.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "mio-extras" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "069gfhlv0wlwfx1k2sriwfws490kjp490rv2qivyfb01j3i3yh2j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-lazycell" ,rust-lazycell-1.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-mio" ,rust-mio-0.6)
        ("rust-slab" ,rust-slab-0.4))))
    (home-page "https://github.com/dimbleby/mio-extras")
    (synopsis "Extra components for use with Mio")
    (description "Extra components for use with Mio.")
    (license (list license:expat license:asl2.0))))

(define-public rust-mio-named-pipes-0.1
  (package
    (name "rust-mio-named-pipes")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "mio-named-pipes" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1cwwfx1yr9vws8x971x34ijnirs377vcxi47frdirki5yppp9qzm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-log" ,rust-log-0.4)
        ("rust-mio" ,rust-mio-0.6)
        ("rust-miow" ,rust-miow-0.3)
        ("rust-winapi" ,rust-winapi-0.3))
       #:cargo-development-inputs
       (("rust-env-logger" ,rust-env-logger-0.4)
        ("rust-rand" ,rust-rand-0.4))))
    (home-page "https://github.com/alexcrichton/mio-named-pipes")
    (synopsis "Windows named pipe bindings for mio")
    (description
     "A library for integrating Windows Named Pipes with mio.")
    (license `(,license:asl2.0 ,license:expat))))

(define-public rust-mio-uds-0.6
  (package
    (name "rust-mio-uds")
    (version "0.6.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "mio-uds" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "09gimdbnj7b9yca99pk8lxh9jhl79msj795c8fxi2sqr9slmfqln"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-iovec" ,rust-iovec-0.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-mio" ,rust-mio-0.6))
       #:cargo-development-inputs
       (("rust-tempdir" ,rust-tempdir-0.3))))
    (home-page "https://github.com/alexcrichton/mio-uds")
    (synopsis "Unix domain socket bindings for mio")
    (description
     "Unix domain socket bindings for mio.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-miow-0.3
  (package
    (name "rust-miow")
    (version "0.3.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "miow" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "09ljvx6wg30f2xlv7b7hhpkw7k312n3hjgmrbhwzhz9x03ra0sir"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-socket2" ,rust-socket2-0.3)
        ("rust-winapi" ,rust-winapi-0.3))
       #:cargo-development-inputs
       (("rust-rand" ,rust-rand-0.4))))
    (home-page "https://github.com/alexcrichton/miow")
    (synopsis "Rust I/O library for Windows")
    (description
     "This package provides a zero overhead I/O library for Windows, focusing on
IOCP and Async I/O abstractions.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-miow-0.2
  (package
    (inherit rust-miow-0.3)
    (name "rust-miow")
    (version "0.2.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "miow" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "06g9b8sqlh5gxakwqq4rrib07afwanfnxgxajrldwcgk3hxjy7wc"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-kernel32-sys" ,rust-kernel32-sys-0.2)
        ("rust-net2" ,rust-net2-0.2)
        ("rust-winapi" ,rust-winapi-0.2)
        ("rust-ws2-32-sys" ,rust-ws2-32-sys-0.2))
       #:cargo-development-inputs
       (("rust-rand" ,rust-rand-0.3))))))

(define-public rust-model-0.1
  (package
    (name "rust-model")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "model" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0kx6hy5i1fn2qs4x6hpng9jixpm68g83vm24z8bqqscr317yinb6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-permutohedron" ,rust-permutohedron-0.2)
        ("rust-proptest" ,rust-proptest-0.9))))
    (home-page "https://github.com/spacejam/model")
    (synopsis "Model-based testing for data structures")
    (description
     "Model-based testing for data structures, with linearizability
checking.")
    (license (list license:expat license:asl2.0))))

(define-public rust-modifier-0.1
  (package
    (name "rust-modifier")
    (version "0.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "modifier" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0n3fmgli1nsskl0whrfzm1gk0rmwwl6pw1q4nb9sqqmn5h8wkxa1"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/reem/rust-modifier")
    (synopsis
      "Chaining APIs for both self -> Self and &mut self methods.")
    (description
      "Chaining APIs for both self -> Self and &mut self methods.")
    (license license:expat)))

(define-public rust-nasm-rs-0.1
  (package
    (name "rust-nasm-rs")
    (version "0.1.7")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "nasm-rs" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0r34hiy1pc0aksrfc02zsl0zyw33i9yi7kyx8l214l7nm0mzm97y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-rayon" ,rust-rayon-1.3))))
    (home-page "https://github.com/medek/nasm-rs")
    (synopsis "Run NASM during your Cargo build")
    (description "Run NASM during your Cargo build.")
    (license (list license:expat license:asl2.0))))

(define-public rust-nalgebra-0.18
  (package
    (name "rust-nalgebra")
    (version "0.18.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "nalgebra" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "18i1npny8s45ff67p5qpdwwsn36fp23mal8847fkb32cqgdzvada"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-abomonation" ,rust-abomonation-0.7)
        ("rust-alga" ,rust-alga-0.9)
        ("rust-approx" ,rust-approx-0.3)
        ("rust-generic-array" ,rust-generic-array-0.12)
        ("rust-matrixmultiply" ,rust-matrixmultiply-0.2)
        ("rust-mint" ,rust-mint-0.5)
        ("rust-num-complex" ,rust-num-complex-0.2)
        ("rust-num-rational" ,rust-num-rational-0.2)
        ("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-pest" ,rust-pest-2.1)
        ("rust-pest-derive" ,rust-pest-derive-2.1)
        ("rust-quickcheck" ,rust-quickcheck-0.8)
        ("rust-rand" ,rust-rand-0.6)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-typenum" ,rust-typenum-1.10))
       #:cargo-development-inputs
       (("rust-rand-xorshift" ,rust-rand-xorshift-0.1)
        ("rust-serde-json" ,rust-serde-json-1.0))))
    (home-page "https://nalgebra.org")
    (synopsis "Linear algebra library")
    (description
     "This package provides a linear algebra library with transformations and
statically-sized or dynamically-sized matrices.")
    (license license:bsd-3)))

(define-public rust-named-pipe-0.4
  (package
    (name "rust-named-pipe")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "named-pipe" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0azby10wzmsrf66m1bysbil0sjfybnvhsa8py093xz4irqy4975d"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t     ; Only builds on Windows.
       #:cargo-inputs (("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/blackbeam/named_pipe")
    (synopsis "Wrapper for overlapped (asynchronous) IO of Windows's named pipes")
    (description "This package provides a wrapper for overlapped (asynchronous)
IO of Windows's named pipes.")
    (license (list license:expat license:asl2.0))))

(define-public rust-native-tls-0.2
  (package
    (name "rust-native-tls")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "native-tls" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ki7cj4wzyd2nach4qdjly69sp7rs0yz3n3z2ii4mm1gqajg2bab"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f      ; tests require network access
       #:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-openssl" ,rust-openssl-0.10)
        ("rust-openssl-probe" ,rust-openssl-probe-0.1)
        ("rust-openssl-sys" ,rust-openssl-sys-0.9)
        ("rust-schannel" ,rust-schannel-0.1)
        ("rust-security-framework" ,rust-security-framework-0.3)
        ("rust-security-framework-sys" ,rust-security-framework-sys-0.3)
        ("rust-tempfile" ,rust-tempfile-3.1))
       #:cargo-development-inputs
       (("rust-hex" ,rust-hex-0.3))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'find-openssl
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((openssl (assoc-ref inputs "openssl")))
               (setenv "OPENSSL_DIR" openssl))
             #t)))))
    (native-inputs
     `(("openssl" ,openssl)
       ("pkg-config" ,pkg-config)))
    (home-page "https://github.com/sfackler/rust-native-tls")
    (synopsis
     "Wrapper over a platform's native TLS implementation")
    (description
     "This package provides a wrapper over a platform's native TLS implementation.")
    (license (list license:expat license:asl2.0))))

(define-public rust-natord-1.0
  (package
    (name "rust-natord")
    (version "1.0.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "natord" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0z75spwag3ch20841pvfwhh3892i2z2sli4pzp1jgizbipdrd39h"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/lifthrasiir/rust-natord")
    (synopsis "Natural ordering for Rust")
    (description
     "This package provides a crate to perform natural ordering for Rust.")
    (license license:expat)))

(define-public rust-net2-0.2
  (package
    (name "rust-net2")
    (version "0.2.33")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "net2" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "126g3fgfxp06zimc1l9iyxnn9cif1hjsg7sd81nlls5nnyghsma2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/rust-lang-nursery/net2-rs")
    (synopsis "Extensions to the standard library's networking types")
    (description
     "This library contains extensions to the standard library's networking
types as proposed in RFC 1158.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-netlib-src-0.7
  (package
    (name "rust-netlib-src")
    (version "0.7.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "netlib-src" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "112hwfw1zzdj10h3j213xxqjrq38iygb3nb3ijay65ycmrg819s4"))))
    (build-system cargo-build-system)
    ;(inputs
    ; `(("gfortran:lib" ,gfortran "lib")
    ;   ("lapack" ,lapack)))
    (home-page "https://github.com/blas-lapack-rs/netlib-src")
    (synopsis "Source of BLAS and LAPACK via Netlib")
    (description
     "The package provides a source of BLAS and LAPACK via Netlib.")
    (properties '((hidden? . #t)))
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-new-debug-unreachable-1.0
  (package
    (name "rust-new-debug-unreachable")
    (version "1.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "new_debug_unreachable" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0c1br326qa0rrzxrn2rd5ah7xaprig2i9r4rwsx06vnvc1f003zl"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://github.com/mbrubeck/rust-debug-unreachable")
    (synopsis
     "Panic in debug, @code{intrinsics::unreachable()} in release")
    (description
     "Panic in debug, @code{intrinsics::unreachable() }in
release (fork of debug_unreachable)")
    (license license:expat)))

(define-public rust-nix-0.15
  (package
    (name "rust-nix")
    (version "0.15.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "nix" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0aa2l7wg9pzx24ks4p97gdy09a4hhs1sr9drxnm75v906d7hnbiv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f      ; test suite hangs
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-cc" ,rust-cc-1.0)
        ("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-void" ,rust-void-1.0))
       #:cargo-development-inputs
       (("rust-bytes" ,rust-bytes-0.4)
        ("rust-caps" ,rust-caps-0.3)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-rand" ,rust-rand-0.6)
        ("rust-sysctl" ,rust-sysctl-0.1)
        ("rust-tempfile" ,rust-tempfile-3.0))))
    (home-page "https://github.com/nix-rust/nix")
    (synopsis "Rust friendly bindings to *nix APIs")
    (description
     "Rust friendly bindings to *nix APIs.")
    (license license:expat)))

(define-public rust-nix-0.14
  (package
    (inherit rust-nix-0.15)
    (name "rust-nix")
    (version "0.14.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "nix" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1kmxdlmvnmq8cfpmr3g6wk37rwi2ybdvp1z6z3831m1p23p2nwkc"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-cc" ,rust-cc-1.0)
        ("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-void" ,rust-void-1.0))
       #:cargo-development-inputs
       (("rust-bytes" ,rust-bytes-0.4)
        ("rust-caps" ,rust-caps-0.3)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-rand" ,rust-rand-0.6)
        ("rust-sysctl" ,rust-sysctl-0.1)
        ("rust-tempfile" ,rust-tempfile-3.0))))))

(define-public rust-no-panic-0.1
  (package
    (name "rust-no-panic")
    (version "0.1.12")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "no-panic" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0xan5v9ac1aklinc8aw16raq36pb4idjrl502np8gy32gfs6s751"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1.0)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-1.0))
       #:cargo-development-inputs
       (("rust-tempfile" ,rust-tempfile-3.1))))
    (home-page "https://github.com/dtolnay/no-panic")
    (synopsis "Prove a function can't ever panic")
    (description
     "This package provides a rust attribute macro to require that the compiler
prove a function can't ever panic.")
    (license (list license:expat license:asl2.0))))

(define-public rust-nodrop-0.1
  (package
    (name "rust-nodrop")
    (version "0.1.14")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "nodrop" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1fz1v9r8ijacf0hlq0pdv5l9mz8vgqg1snmhvpjmi9aci1b4mvvj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-nodrop-union" ,rust-nodrop-union-0.1))))
    (home-page "https://github.com/bluss/arrayvec")
    (synopsis "Wrapper type to inhibit drop (destructor)")
    (description "This package provides a wrapper type to inhibit drop
(destructor).  Use @code{std::mem::ManuallyDrop} instead!")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-nodrop-union-0.1
  (package
    (name "rust-nodrop-union")
    (version "0.1.11")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "nodrop-union" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1h59pph19rxanyqcaid8pg73s7wmzdx3zhjv5snlim5qx606zxkc"))))
    (build-system cargo-build-system)
    (arguments '(#:skip-build? #t))   ; depends on features not in stable Rust
    (home-page "https://github.com/bluss/arrayvec")
    (synopsis "Wrapper type to inhibit drop (destructor)")
    (description "This package provides a wrapper type to inhibit drop
(destructor).  Implementation crate for @code{nodrop}, the untagged unions
implementation (which is unstable / requires nightly).")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-nom-4.2
  (package
    (name "rust-nom")
    (version "4.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "nom" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1mkvby8b4m61p4g1px0pwr58yfkphyp1jcfbp4qfp7l6iqdaklia"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-memchr" ,rust-memchr-2.2)
        ("rust-regex" ,rust-regex-1.1)
        ("rust-version-check" ,rust-version-check-0.1))
       #:cargo-development-inputs
       (("rust-criterion" ,rust-criterion-0.2)
        ("rust-jemallocator" ,rust-jemallocator-0.1))))
    (home-page "https://github.com/Geal/nom")
    (synopsis
     "Byte-oriented, zero-copy, parser combinators library")
    (description
     "This package provides a byte-oriented, zero-copy, parser
combinators library.")
    (license license:expat)))

(define-public rust-nom-3
  (package
    (inherit rust-nom-4.2)
    (name "rust-nom")
    (version "3.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "nom" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0yr8fazcspgawl6s7wmx5llz61s68jl88cnrph18fa7xf06cbbh5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f      ; stream::tests::seeking_consumer fails
       #:cargo-inputs
       (("rust-compiler-error" ,rust-compiler-error-0.1)
        ("rust-lazy-static" ,rust-lazy-static-0.2)
        ("rust-memchr" ,rust-memchr-1.0)
        ("rust-regex" ,rust-regex-0.2))))))

(define-public rust-nom-1.2
  (package
    (inherit rust-nom-4.2)
    (name "rust-nom")
    (version "1.2.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "nom" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1kjh42w67z1hh1dw3jrilgqrf54jk2xcvhw4rcdm4wclzmbc5f55"))))
    (arguments
      ;; This is an ancient version and all inputs are optional.
     `(#:skip-build? #t))))

(define-public rust-noop-proc-macro-0.2
  (package
    (name "rust-noop-proc-macro")
    (version "0.2.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "noop_proc_macro" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0in1l0rjxzs4fylb6zad484z1c58jxyzchhc12k0cjrvm0y6zwsz"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
      "https://github.com/lu-zero/noop_proc_macro")
    (synopsis
      "No-op proc_macro, literally does nothing")
    (description
      "No-op proc_macro, literally does nothing")
    (license license:expat)))

(define-public rust-notify-4
  (package
    (name "rust-notify")
    (version "4.0.14")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "notify" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "12vpbg8j49196rxkm01hw2xfr0mk005ljmx0p9kwf6xj6gy2i5hr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-filetime" ,rust-filetime-0.2)
        ("rust-fsevent" ,rust-fsevent-0.4)
        ("rust-fsevent-sys" ,rust-fsevent-sys-2)
        ("rust-inotify" ,rust-inotify-0.6)
        ("rust-kernel32-sys" ,rust-kernel32-sys-0.2)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-mio" ,rust-mio-0.6)
        ("rust-mio-extras" ,rust-mio-extras-2)
        ("rust-walkdir" ,rust-walkdir-2.2)
        ("rust-winapi" ,rust-winapi-0.3))
       #:cargo-development-inputs
       (("rust-tempdir" ,rust-tempdir-0.3))))
    (home-page "https://github.com/passcod/notify")
    (synopsis "Cross-platform filesystem notification library")
    (description
     "Cross-platform filesystem notification library.")
    (license license:cc0)))

(define-public rust-num-0.2
  (package
    (name "rust-num")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "num" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0dhcvhprvvx1iaaq7sxlgxw5awmj8dibni8vhizi59zyz4q60lxq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-num-bigint" ,rust-num-bigint-0.2)
        ("rust-num-complex" ,rust-num-complex-0.2)
        ("rust-num-integer" ,rust-num-integer-0.1)
        ("rust-num-iter" ,rust-num-iter-0.1)
        ("rust-num-rational" ,rust-num-rational-0.2)
        ("rust-num-traits" ,rust-num-traits-0.2))))
    (home-page "https://github.com/rust-num/num")
    (synopsis "Collection of numeric types and traits for Rust")
    (description
     "This package provides a collection of numeric types and traits for Rust,
including bigint, complex, rational, range iterators, generic integers, and more.")
    (license (list license:expat license:asl2.0))))

(define-public rust-num-0.1
  (package
    (inherit rust-num-0.2)
    (name "rust-num")
    (version "0.1.42")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "num" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0vhmyvfan380f86895z0f8rjscjc6qvwcmyvm15370ik2mjas0s7"))))
    (arguments
     `(#:cargo-inputs
       (("rust-num-bigint" ,rust-num-bigint-0.1)
        ("rust-num-complex" ,rust-num-complex-0.1)
        ("rust-num-integer" ,rust-num-integer-0.1)
        ("rust-num-iter" ,rust-num-iter-0.1)
        ("rust-num-rational" ,rust-num-rational-0.1)
        ("rust-num-traits" ,rust-num-traits-0.2))))))

(define-public rust-num-bigint-0.2
  (package
    (name "rust-num-bigint")
    (version "0.2.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "num-bigint" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "015k3wixdi4w698sappvy43pf8bvkw0f88xplmdgc3zfk2cpy309"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-num-integer" ,rust-num-integer-0.1)
        ("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-quickcheck" ,rust-quickcheck-0.8)
        ("rust-quickcheck-macros" ,rust-quickcheck-macros-0.8)
        ("rust-rand" ,rust-rand-0.5)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-autocfg" ,rust-autocfg-1.0))
       #:cargo-development-inputs
       (("rust-serde-test" ,rust-serde-test-1.0))))
    (home-page "https://github.com/rust-num/num-bigint")
    (synopsis "Big integer implementation for Rust")
    (description
     "Big integer implementation for Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-num-bigint-0.1
  (package
    (inherit rust-num-bigint-0.2)
    (name "rust-num-bigint")
    (version "0.1.44")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "num-bigint" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1hg80xd7vd5yqzks1h0zk2fcgqnf84m2cdj9q4cffk581nnrjf76"))))
    (arguments
     `(#:cargo-inputs
       (("rust-num-integer" ,rust-num-integer-0.1)
        ("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-rand" ,rust-rand-0.4)
        ("rust-rustc-serialize" ,rust-rustc-serialize-0.3)
        ("rust-serde" ,rust-serde-0.8))
       #:cargo-development-inputs
       (("rust-rand" ,rust-rand-0.4))))))

(define-public rust-num-complex-0.2
  (package
    (name "rust-num-complex")
    (version "0.2.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "num-complex" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "15dwaksw729r3v14sgzc9723s3fnfixiir8jzwx7b7kim48r9cdn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-rand" ,rust-rand-0.5)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-autocfg" ,rust-autocfg-1.0))))
    (home-page
     "https://github.com/rust-num/num-complex")
    (synopsis
     "Complex numbers implementation for Rust")
    (description
     "Complex numbers implementation for Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-num-complex-0.1
  (package
    (inherit rust-num-complex-0.2)
    (name "rust-num-complex")
    (version "0.1.43")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "num-complex" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0mln3h018lar511hadjwfkbyq1561s8kdzfg8aagbakqg0fn725j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-rustc-serialize" ,rust-rustc-serialize-0.3)
        ("rust-serde" ,rust-serde-0.8))))))

(define-public rust-num-cpus-1.11
  (package
    (name "rust-num-cpus")
    (version "1.11.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "num_cpus" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0wlxs00cpg16z09fwchj1gdz1jxnf5dgg1cbidvq0sc75bnwbnkn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
        (("rust-hermit-abi" ,rust-hermit-abi-0.1)
         ("rust-libc" ,rust-libc-0.2))
        #:cargo-development-inputs
        (("rust-doc-comment" ,rust-doc-comment-0.3))))
    (home-page "https://github.com/seanmonstar/num_cpus")
    (synopsis "Get the number of CPUs on a machine")
    (description
     "Get the number of CPUs on a machine.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-num-cpus-1.10
  (package
    (inherit rust-num-cpus-1.11)
    (name "rust-num-cpus")
    (version "1.10.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "num_cpus" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0wrj3zvj6h3q26sqj9zxpd59frjb54n7jhjwf307clq31ic47vxw"))))
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2))
       #:cargo-development-inputs
       (("rust-doc-comment" ,rust-doc-comment-0.3))))))

(define-public rust-num-derive-0.3
  (package
    (name "rust-num-derive")
    (version "0.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "num-derive" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0imprwv8cs01k46g56ajlvc97dp8kz51y2vn6cp9jkw1c6r1b2qc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1.0)
        ("rust-syn" ,rust-syn-1.0)
        ("rust-quote" ,rust-quote-1.0))))
    (home-page "https://github.com/rust-num/num-derive")
    (synopsis "Numeric syntax extensions")
    (description "This package provides numeric syntax extensions.")
    (license (list license:expat license:asl2.0))))

(define-public rust-num-derive-0.2
  (package
    (name "rust-num-derive")
    (version "0.2.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "num-derive" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1wnv7776fh4i40r3zfxcxcmm0dh029skx7gp4sjknz2kqm2hpzga"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-0.6)
        ("rust-syn" ,rust-syn-0.15))
       #:cargo-development-inputs
       (("rust-num" ,rust-num-0.2)
        ("rust-num-traits" ,rust-num-traits-0.2))))
    (home-page "https://github.com/rust-num/num-derive")
    (synopsis "Numeric syntax extensions")
    (description "Numeric syntax extensions in Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-num-integer-0.1
  (package
    (name "rust-num-integer")
    (version "0.1.42")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "num-integer" version))
       (file-name
        (string-append name "-" version ".crate"))
       (sha256
        (base32
         "1fpw8yr9xwsf3qrh91rm7mzqaiwlc2dmnalsxv9pr9w1klpacviz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-autocfg" ,rust-autocfg-1.0))))
    (home-page "https://github.com/rust-num/num-integer")
    (synopsis "Integer traits and functions")
    (description "Integer traits and functions.")
    ;; Dual licensed.
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-num-iter-0.1
  (package
    (name "rust-num-iter")
    (version "0.1.40")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "num-iter" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "005wif3bk23b5jdg7l0cprzqzyc4jg0xjyzyykciv2ci08581c6z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-num-integer" ,rust-num-integer-0.1)
        ("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-autocfg" ,rust-autocfg-1.0))))
    (home-page "https://github.com/rust-num/num-iter")
    (synopsis "External iterators for generic mathematics")
    (description
     "This crate provides external iterators for generic mathematics.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-num-rational-0.2
  (package
    (name "rust-num-rational")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "num-rational" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "18q3vq3xldhaj0z3f92am8f59m1awywgdj28c7wvx0bcksgwfkfs"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-num-bigint" ,rust-num-bigint-0.2)
        ("rust-num-integer" ,rust-num-integer-0.1)
        ("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-autocfg" ,rust-autocfg-1.0))))
    (home-page "https://github.com/rust-num/num-rational")
    (synopsis "Rational numbers implementation for Rust")
    (description
     "Rational numbers implementation for Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-num-rational-0.1
  (package
    (inherit rust-num-rational-0.2)
    (name "rust-num-rational")
    (version "0.1.42")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "num-rational" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0kkqb8j3b3nis9hs4ww4hkrmb4a6v9sr9al08xmwhgvmpms4qcgf"))))
    (arguments
     `(#:cargo-inputs
       (("rust-num-bigint" ,rust-num-bigint-0.1)
        ("rust-num-integer" ,rust-num-integer-0.1)
        ("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-rustc-serialize" ,rust-rustc-serialize-0.3)
        ("rust-serde" ,rust-serde-0.8))))))

(define-public rust-num-traits-0.2
  (package
    (name "rust-num-traits")
    (version "0.2.11")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "num-traits" version))
       (file-name
        (string-append name "-" version ".crate"))
       (sha256
        (base32
         "15khrlm1bra50nd48ijl1vln13m9xg4fxzghf28jp16ic5zf8ay6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-autocfg" ,rust-autocfg-1.0)
        ("rust-libm" ,rust-libm-0.2))))
    (home-page "https://github.com/rust-num/num-traits")
    (synopsis "Numeric traits for generic mathematics")
    (description "Numeric traits for generic mathematics.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-num-traits-0.1
  (package
    (inherit rust-num-traits-0.2)
    (name "rust-num-traits")
    (version "0.1.43")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "num-traits" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0c9whknf2dm74a3cqirafy6gj83a76gl56g4v3g19k6lkwz13rcj"))))
    (arguments
     `(#:cargo-inputs
       (("rust-num-traits" , rust-num-traits-0.2))))))

(define-public rust-number-prefix-0.3
  (package
    (name "rust-number-prefix")
    (version "0.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "number_prefix" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0slm4mqmpgs6hvz22ycny9lvyvl9ivs80a1lncslp7lszz02zc0p"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/ogham/rust-number-prefix")
    (synopsis "Format numeric prefixes: kilo, giga, kibi")
    (description
     "This package provides a library for formatting numeric prefixes: kilo,
giga, kibi.")
    (license license:expat)))

(define-public rust-numtoa-0.1
  (package
    (name "rust-numtoa")
    (version "0.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "numtoa" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1vs9rhggqbql1p26x8nkha1j06wawwgb2jp5fs88b5gi7prvvy5q"))))
    (build-system cargo-build-system)
    (arguments '(#:tests? #f))
    (home-page "https://gitlab.com/mmstick/numtoa")
    (synopsis "Convert numbers into stack-allocated byte arrays")
    (description
     "This package can convert numbers into stack-allocated byte arrays.")
    (license (list license:expat license:asl2.0))))

(define-public rust-obj-0.9
  (package
    (name "rust-obj")
    (version "0.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "obj" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "10z1r2r0xyhr4j1n07135kz4bc0zhqy98vabs99vz0x171bi8gy0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-genmesh" ,rust-genmesh-0.6))))
    (home-page "https://github.com/kvark/obj")
    (synopsis "Package for loading Wavefront .obj files")
    (description
     "This package provides a package for loading Wavefront @code{.obj} files.")
    (license license:asl2.0)))

(define-public rust-objc-0.2
  (package
    (name "rust-objc")
    (version "0.2.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "objc" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1cbpf6kz8a244nn1qzl3xyhmp05gsg4n313c9m3567625d3innwi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f  ; Tests require gcc-objc.
       #:cargo-inputs
       (("rust-malloc-buf" ,rust-malloc-buf-0.0)
        ("rust-objc-exception" ,rust-objc-exception-0.1))))
    (home-page "http://github.com/SSheldon/rust-objc")
    (synopsis "Objective-C Runtime bindings and wrapper for Rust")
    (description "This package provides an Objective-C Runtime bindings and
wrapper for Rust.")
    (license license:expat)))

(define-public rust-objc-exception-0.1
  (package
    (name "rust-objc-exception")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "objc-exception" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "191cmdmlypp6piw67y4m8y5swlxf5w0ss8n1lk5xd2l1ans0z5xd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-cc" ,rust-cc-1.0))))
    (home-page "http://github.com/SSheldon/rust-objc-exception")
    (synopsis "Rust interface for Objective-C's throw and try/catch statements")
    (description
     "This package provides a Rust interface for Objective-C's throw and
try/catch statements.")
    (license license:expat)))

(define-public rust-objc-foundation-0.1
  (package
    (name "rust-objc-foundation")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "objc-foundation" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1y9bwb3m5fdq7w7i4bnds067dhm4qxv4m1mbg9y61j9nkrjipp8s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t     ; Only available on macOS.
       #:cargo-inputs
       (("rust-block" ,rust-block-0.1)
        ("rust-objc" ,rust-objc-0.2)
        ("rust-objc-id" ,rust-objc-id-0.1))))
    (home-page "http://github.com/SSheldon/rust-objc-foundation")
    (synopsis "Rust wrapper for Objective-C's Foundation framework")
    (description "This package provides a rust wrapper for Objective-C's
Foundation framework.")
    (license license:expat)))

(define-public rust-objc-id-0.1
  (package
    (name "rust-objc-id")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "objc_id" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0fq71hnp2sdblaighjc82yrac3adfmqzhpr11irhvdfp9gdlsbf9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f  ; Tests require gcc-objc.
       #:cargo-inputs (("rust-objc" ,rust-objc-0.2))))
    (home-page "http://github.com/SSheldon/rust-objc-id")
    (synopsis "Rust smart pointers for Objective-C reference counting")
    (description
     "This package provides Rust smart pointers for Objective-C reference counting.")
    (license license:expat)))

(define-public rust-objc-test-utils-0.0
  (package
    (name "rust-objc-test-utils")
    (version "0.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "objc_test_utils" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "09rckmp5h9bbns08xzicdlk7y5lxj2ygbg3yqk1cszfnzd5n8kzx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-gcc" ,rust-gcc-0.3))))
    (home-page "http://github.com/SSheldon/rust-objc")
    (synopsis "Utilities for testing Objective-C interop")
    (description
     "This package provides utilities for testing Objective-C interop.")
    (license license:expat)))

(define-public rust-object-0.17
  (package
    (name "rust-object")
    (version "0.17.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "object" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1bmgbg4k0725lchfy9j1wnpfmywh5qhs0k4k6j2g7c0acvys8i7a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-goblin" ,rust-goblin-0.1)
        ("rust-target-lexicon" ,rust-target-lexicon-0.10)
        ("rust-scroll" ,rust-scroll-0.10)
        ("rust-parity-wasm" ,rust-parity-wasm-0.41)
        ("rust-uuid" ,rust-uuid-0.8)
        ("rust-flate2" ,rust-flate2-1.0)
        ("rust-crc32fast" ,rust-crc32fast-1.2)
        ("rust-indexmap" ,rust-indexmap-1.3))))
    (home-page "https://github.com/gimli-rs/object")
    (synopsis "Unified interface for reading and writing object file formats")
    (description "This package provides a unified interface for reading and
writing object file formats.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-object-0.12
  (package
    (name "rust-object")
    (version "0.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "object" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1dch1ajjp05d16lig1dnvisfis0hrlrvw9lcwy1hwgdcym3z6jnz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-flate2" ,rust-flate2-1.0)
        ("rust-goblin" ,rust-goblin-0.0)
        ("rust-parity-wasm" ,rust-parity-wasm-0.40)
        ("rust-scroll" ,rust-scroll-0.9)
        ("rust-uuid" ,rust-uuid-0.7))
       #:cargo-development-inputs
       (("rust-memmap" ,rust-memmap-0.7))))
    (home-page "https://github.com/gimli-rs/object")
    (synopsis "Parse object file formats")
    (description
     "This package provides a unified interface for parsing object file
formats.")
    (license (list license:expat license:asl2.0))))

(define-public rust-odds-0.3
  (package
    (name "rust-odds")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "odds" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0rdnxa0na4897yb0svb3figz35g4imxjv61yfm2j21gbh5q8v8d9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-rawpointer" ,rust-rawpointer-0.1)
        ("rust-rawslice" ,rust-rawslice-0.1)
        ("rust-unchecked-index" ,rust-unchecked-index-0.2))
       #:cargo-development-inputs
       (("rust-itertools" ,rust-itertools-0.8)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-memchr" ,rust-memchr-2.2)
        ("rust-quickcheck" ,rust-quickcheck-0.8))))
    (home-page "https://github.com/bluss/odds")
    (synopsis "Extra functionality for slices, strings and other things")
    (description
     "Odds and ends collection miscellania.  Extra functionality for
slices (@code{.find()}, @code{RevSlice}), strings and other things.
Things in odds may move to more appropriate crates if we find them.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-onig-5.0
  (package
    (name "rust-onig")
    (version "5.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "onig" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0ivr0wq1zlyjhhkxpsnmpncg92sjx3rha8pnp3m1mzvgk7y27rz4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-bitflags" ,rust-bitflags-1)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-onig-sys" ,rust-onig-sys-69.2))))
    (home-page "http://github.com/iwillspeak/rust-onig")
    (synopsis
     "Rust bindings for the Oniguruma regular expression library")
    (description
     "Rust-Onig is a set of Rust bindings for the Oniguruma regular expression
library.  Oniguruma is a modern regex library with support for multiple
character encodings and regex syntaxes.")
    (license license:expat)))

(define-public rust-onig-sys-69.2
  (package
    (name "rust-onig-sys")
    (version "69.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "onig_sys" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0kjijq29yx05xxg9snvqnfn53dl52hchb4sk3zhfr77mypxlx38a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-pkg-config" ,rust-pkg-config-0.3)
        ("rust-bindgen" ,rust-bindgen-0.50)
        ("rust-cc" ,rust-cc-1.0))))
    (home-page "http://github.com/iwillspeak/rust-onig")
    (synopsis
     "Rust bindings to the oniguruma library.")
    (description
      "The @code{onig_sys} crate contains raw rust bindings to the oniguruma
library.  This crate exposes a set of unsafe functions which can then be used by
other crates to create safe wrappers around Oniguruma.
You probably don't want to link to this crate directly; instead check out the
@code{onig} crate.")
    (license license:expat)))

(define-public rust-once-cell-1.2
  (package
    (name "rust-once-cell")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "once-cell" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1vdz8xlg3r05w3wfjimnc347hgm54i5nrqf72r4mlp0fcdplh7w9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-parking-lot" ,rust-parking-lot-0.9))
       #:cargo-development-inputs
       (("rust-crossbeam-utils" ,rust-crossbeam-utils-0.6)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-regex" ,rust-regex-1.1))))
    (home-page "https://github.com/matklad/once_cell")
    (synopsis "Single assignment cells and lazy values")
    (description
     "Single assignment cells and lazy values.")
    (license (list license:expat license:asl2.0))))

(define-public rust-oorandom-11.1
  (package
    (name "rust-oorandom")
    (version "11.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "oorandom" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "01clxfnz1zwg4maynvbgj09wlkj5m3c8kjqfrp3sqp59qb4wgkpb"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://hg.sr.ht/~icefox/oorandom")
    (synopsis "A tiny, robust PRNG implementation.")
    (description
      "This package provides a tiny, robust PRNG implementation.")
    (license license:expat)))

(define-public rust-opaque-debug-0.2
  (package
    (name "rust-opaque-debug")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "opaque-debug" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "02942l2gc7w5r4js7i9063x99szic5mzzk1055j83v4diqpbpxck"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/RustCrypto/utils")
    (synopsis "Macro for opaque Debug trait implementation")
    (description
     "Macro for opaque Debug trait implementation.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-openssl-0.10
  (package
    (name "rust-openssl")
    (version "0.10.26")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "openssl" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "11d505lwlrh5a0jc2l6q36gvsaqic3vizq5q860hiqcqkmwwag1s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-foreign-types" ,rust-foreign-types-0.3)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-openssl-sys" ,rust-openssl-sys-0.9))
       #:cargo-development-inputs
       (("rust-hex" ,rust-hex-0.3)
        ("rust-tempdir" ,rust-tempdir-0.3))))
    (home-page "https://github.com/sfackler/rust-openssl")
    (synopsis "OpenSSL bindings")
    (description "OpenSSL bindings.")
    (license license:asl2.0)))

(define-public rust-openssl-0.7
  (package
    (inherit rust-openssl-0.10)
    (name "rust-openssl")
    (version "0.7.14")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "openssl" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0cw767rbasg4dbsfcsnxqm3q5ljkv6s1jq0a2p82xi5a8ii7n4f4"))))
    (arguments
     `(#:tests? #f      ; Test directory not included in release
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-0.7)
        ("rust-gcc" ,rust-gcc-0.3)
        ("rust-lazy-static" ,rust-lazy-static-0.2)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-openssl-sys" ,rust-openssl-sys-0.7)
        ("rust-openssl-sys-extras" ,rust-openssl-sys-extras-0.7))
       #:cargo-development-inputs
       (("rust-net2" ,rust-net2-0.2)
        ("rust-rustc-serialize" ,rust-rustc-serialize-0.3)
        ("rust-winapi" ,rust-winapi-0.2)
        ("rust-ws2-32-sys" ,rust-ws2-32-sys-0.2))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-cargo-toml
           (lambda _
             (substitute* "Cargo.toml"
               ((", path =.*}") "}"))
             #t)))))
    (native-inputs
     `(("openssl" ,openssl-1.0))))) ; for openssl-sys-extras

(define-public rust-openssl-probe-0.1
  (package
    (name "rust-openssl-probe")
    (version "0.1.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "openssl-probe" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1pijrdifgsdwd45b08c2g0dsmnhz7c3kmagb70839ngrd7d29bvp"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/alexcrichton/openssl-probe")
    (synopsis "Find SSL certificate locations")
    (description
     "This package provides a tool to find SSL certificate locations on the
system for OpenSSL.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-openssl-sys-0.9
  (package
    (name "rust-openssl-sys")
    (version "0.9.53")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "openssl-sys" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
         (base32 "0vvk8vzrc73y8n5rf4yj3x8ygyxjaz7wxrbxiwqi7qy0gyp1cpa6"))
        (patches (search-patches "rust-openssl-sys-no-vendor.patch"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ;; Build dependencies:
        ("rust-autocfg" ,rust-autocfg-0.1)
        ("rust-cc" ,rust-cc-1.0)
        ("rust-pkg-config" ,rust-pkg-config-0.3)
        ("rust-vcpkg" ,rust-vcpkg-0.2))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'find-openssl
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((openssl (assoc-ref inputs "openssl")))
               (setenv "OPENSSL_DIR" openssl))
             #t)))))
    (native-inputs
     `(("openssl" ,openssl)
       ("pkg-config" ,pkg-config)))
    (home-page "https://github.com/sfackler/rust-openssl")
    (synopsis "FFI bindings to OpenSSL")
    (description
     "This package provides FFI bindings to OpenSSL for use in rust crates.")
    (license license:expat)))

(define-public rust-openssl-sys-0.7
  (package
    (inherit rust-openssl-sys-0.9)
    (name "rust-openssl-sys")
    (version "0.7.17")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "openssl-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0gswbbfkhhj8f9jifwvdssv3p2lpgyz69qzqvafylbim9klpxi49"))
       (modules '((guix build utils)))
       (snippet
        '(begin
           ;; rust-libressl-pnacl-sys vendors libressl.
           (substitute* "Cargo.toml"
             ((".*nacl.*") ""))
           #t))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-gdi32-sys" ,rust-gdi32-sys-0.2)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-user32-sys" ,rust-user32-sys-0.2)
        ("rust-pkg-config" ,rust-pkg-config-0.3))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'find-openssl
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((openssl (assoc-ref inputs "openssl")))
               (setenv "OPENSSL_DIR" openssl))
             #t)))))))

(define-public rust-openssl-sys-extras-0.7
  (package
    (name "rust-openssl-sys-extras")
    (version "0.7.14")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "openssl-sys-extras" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ymrmfnknyjji74fflbnnq9r5ihx25h0vgs5y203vl6klzdy3i8i"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-openssl-sys" ,rust-openssl-sys-0.7)
        ("rust-gcc" ,rust-gcc-0.3))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-cargo-toml
           (lambda _
             (substitute* "Cargo.toml"
               ((", path =.*}") "}"))
             #t)))))
    (native-inputs
     `(("openssl" ,openssl-1.0)))   ; openssl-1.0 specifically
    (home-page "https://github.com/sfackler/rust-openssl")
    (synopsis
     "Extra FFI bindings to OpenSSL that require a C shim")
    (description
     "Extra FFI bindings to OpenSSL that require a C shim.")
    (license license:expat)))

(define-public rust-ord-subset-3
  (package
    (name "rust-ord-subset")
    (version "3.1.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "ord-subset" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1vvb6zmz279nb59dki7kbsvixbk8zpg2gxvgcpsjfnxg9ik19knp"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/emerentius/ord_subset")
    (synopsis "Tools for working with the Ord subset of certain PartialOrd types")
    (description
     "This package provides tools for working with the Ord subset of certain
PartialOrd types, like floats.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ordered-float-1.0
  (package
    (name "rust-ordered-float")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ordered-float" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0625x96987kspdxbikry5mb7hsf5pdc5bbanxd8wjwqlx0ar71hq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-serde-test" ,rust-serde-test-1.0))))
    (home-page "https://github.com/reem/rust-ordered-float")
    (synopsis "Wrappers for total ordering on floats")
    (description
     "This package provides wrappers for total ordering on floats in Rust.")
    (license license:expat)))

(define-public rust-ordermap-0.3
  (package
    (name "rust-ordermap")
    (version "0.3.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ordermap" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0qr0a50l0qakbjcck93qdayd0xl8gzpp42x0n7b75cs4ybsx6vm8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-fnv" ,rust-fnv-1.0)
        ("rust-itertools" ,rust-itertools-0.8)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-quickcheck" ,rust-quickcheck-0.8)
        ("rust-rand" ,rust-rand-0.4)
        ("rust-serde-test" ,rust-serde-test-1.0))))
    (home-page "https://github.com/bluss/indexmap")
    (synopsis "Hash table with consistent order and fast iteration")
    (description
     "This package provides a hash table with consistent order and fast
iteration.  NOTE: This crate was renamed to @code{indexmap}.  Please use it
under its new name.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-os-pipe-0.8
  (package
    (name "rust-os-pipe")
    (version "0.8.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "os-pipe" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "049ax8shxik7mm68r2nf7xnrcq3z3p7hz54sbrcxwywxqsjdzs41"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-nix" ,rust-nix-0.15)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page
     "https://github.com/oconnor663/os_pipe.rs")
    (synopsis
     "Cross-platform library for opening OS pipes")
    (description
     "A cross-platform library for opening OS pipes.")
    (license license:expat)))

(define-public rust-output-vt100-0.1
  (package
    (name "rust-output-vt100")
    (version "0.1.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "output_vt100" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1ygqplpxz4gg3i8f3rkan2q69pqll7gv65l2mmd8r9dphnvwbkak"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/Phundrak/output-vt100-rs")
    (synopsis
     "Utility to activate escape codes in Windows' CMD and PowerShell")
    (description
     "Utility to activate escape codes in Windows' CMD and PowerShell.")
    (license license:expat)))

(define-public rust-osmesa-sys-0.1
  (package
    (name "rust-osmesa-sys")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "osmesa-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0fq1q1zcgfb0qydrg9r2738jlwc4hqxgb9vj11z72bjxx7kfrkw8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-shared-library" ,rust-shared-library-0.1))))
    (home-page "https://crates.io/crates/osmesa-sys")
    (synopsis "OSMesa library bindings for Rust")
    (description "This package provides OSMesa library bindings for Rust.")
    (license license:cc0)))

(define-public rust-owning-ref-0.4
  (package
    (name "rust-owning-ref")
    (version "0.4.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "owning_ref" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "04zgwy77lin8qz398s6g44467pd6kjhbrlqifkia5rkr47mbi929"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-stable-deref-trait" ,rust-stable-deref-trait-1.1))))
    (home-page "https://github.com/Kimundi/owning-ref-rs")
    (synopsis "Create references that carry their owner with them")
    (description
     "This package provides a library for creating references that carry their
owner with them.  This can sometimes be useful because Rust borrowing rules
normally prevent moving a type that has been borrowed from.")
    (license license:expat)))

(define-public rust-packed-simd-0.3
  (package
    (name "rust-packed-simd")
    (version "0.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "packed_simd" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0822wqf6kzw4ig9ykndg348w2bxkhs3x64brzsvdxh2a1pyajpm8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-core-arch" ,rust-core-arch-0.1)
        ("rust-sleef-sys" ,rust-sleef-sys-0.1))
       #:cargo-development-inputs
       (("rust-arrayvec" ,rust-arrayvec-0.4)
        ("rust-paste" ,rust-paste-0.1)
        ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
        ("rust-wasm-bindgen-test" ,rust-wasm-bindgen-test-0.2))))
    (home-page "https://github.com/rust-lang/packed_simd")
    (synopsis "Portable Packed SIMD vectors")
    (description "Portable Packed SIMD vectors.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-pad-0.1
  (package
    (name "rust-pad")
    (version "0.1.6")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pad" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1qy0r26r52gp034fv252mmg0s599a55h9nr4xswy04hvky49pbfj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-unicode-width" ,rust-unicode-width-0.1))))
    (home-page "https://github.com/ogham/rust-pad")
    (synopsis "Library for padding strings at runtime")
    (description
      "This package provides a library for padding strings at runtime.")
    (license license:expat)))

(define-public rust-palette-0.5
  (package
    (name "rust-palette")
    (version "0.5.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "palette" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0nfc4ycdsx2qgf2wkcpxqxc0vmx7188jjjx3ppgs8qlf8qs06p50"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-approx" ,rust-approx-0.3)
        ("rust-palette-derive" ,rust-palette-derive-0.5)
        ("rust-phf" ,rust-phf-0.8)
        ("rust-phf-codegen" ,rust-phf-codegen-0.8)
        ("rust-serde" ,rust-serde-1.0))))
    (home-page "https://github.com/Ogeon/palette")
    (synopsis "Linear color calculations and conversion")
    (description
     "This package makes linear color calculations and conversion accessible.")
    (license (list license:expat license:asl2.0))))

(define-public rust-palette-derive-0.5
  (package
    (name "rust-palette-derive")
    (version "0.5.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "palette_derive" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1x5icddb877923rpl27bg4cjsf1x0d3layxmgwa3mpb01rh5yjqb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1.0)
        ("rust-syn" ,rust-syn-1.0)
        ("rust-quote" ,rust-quote-1.0))))
    (home-page "https://github.com/Ogeon/palette")
    (synopsis "Automatically implement traits from the palette crate")
    (description
     "Automatically implement traits from the palette crate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-pango-0.7
  (package
    (name "rust-pango")
    (version "0.7.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pango" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "11np7nxb69g3kid2l78b7k519x1wk1c3f9yy7swgzy24n5qs0grr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-glib" ,rust-glib-0.8)
        ("rust-glib-sys" ,rust-glib-sys-0.9)
        ("rust-gobject-sys" ,rust-gobject-sys-0.9)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-pango-sys" ,rust-pango-sys-0.9)
        ("rust-gtk-rs-lgpl-docs" ,rust-gtk-rs-lgpl-docs-0.1))
       #:cargo-development-inputs
       (("rust-gir-format-check" ,rust-gir-format-check-0.1))))
    (inputs
     `(("pango" ,pango)))
    (home-page "https://gtk-rs.org/")
    (synopsis "Rust bindings for the Pango library")
    (description
     "Rust bindings for the Pango library.")
    (license license:expat)))

(define-public rust-pango-sys-0.9
  (package
    (name "rust-pango-sys")
    (version "0.9.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pango-sys" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0zdynikh6jrfa31fpmbrwnz46a57idci73zzkf0z0g3vj223vfc6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f      ; Some test files not included in release.
       #:cargo-inputs
       (("rust-glib-sys" ,rust-glib-sys-0.9)
        ("rust-gobject-sys" ,rust-gobject-sys-0.9)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-pkg-config" ,rust-pkg-config-0.3))
       #:cargo-development-inputs
       (("rust-shell-words" ,rust-shell-words-0.1)
        ("rust-tempfile" ,rust-tempfile-3.1))))
    (inputs
     `(("pango" ,pango)))
    (home-page "https://gtk-rs.org/")
    (synopsis "FFI bindings to libpango-1.0")
    (description "This package provides FFI bindings to @code{libpango-1.0}.")
    (license license:expat)))

(define-public rust-pangocairo-0.8
  (package
    (name "rust-pangocairo")
    (version "0.8.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pangocairo" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0qjiwsp73x3w0493dzycyjzxnzwq7ixwmf1ccr5r41pjhxbnk1kl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-cairo-rs" ,rust-cairo-rs-0.7)
        ("rust-cairo-sys-rs" ,rust-cairo-sys-rs-0.9)
        ("rust-glib" ,rust-glib-0.8)
        ("rust-glib-sys" ,rust-glib-sys-0.9)
        ("rust-gobject-sys" ,rust-gobject-sys-0.9)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-pango" ,rust-pango-0.7)
        ("rust-pango-sys" ,rust-pango-sys-0.9)
        ("rust-pangocairo-sys" ,rust-pangocairo-sys-0.10)
        ("rust-gtk-rs-lgpl-docs" ,rust-gtk-rs-lgpl-docs-0.1))
       #:cargo-development-inputs
       (("rust-gir-format-check" ,rust-gir-format-check-0.1))))
    (inputs
     `(("gtk+" ,gtk+)))
    (home-page "http://gtk-rs.org/")
    (synopsis "Rust bindings for the PangoCairo library")
    (description
     "Rust bindings for the PangoCairo library.")
    (license license:expat)))

(define-public rust-pangocairo-sys-0.10
  (package
    (name "rust-pangocairo-sys")
    (version "0.10.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pangocairo-sys" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1zlyf5vajarnxg5034b8qa5w5zajv96lfvlgiki26svpmcqip4m3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cairo-sys-rs" ,rust-cairo-sys-rs-0.9)
        ("rust-glib-sys" ,rust-glib-sys-0.9)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-pango-sys" ,rust-pango-sys-0.9)
        ("rust-pkg-config" ,rust-pkg-config-0.3))
       #:cargo-development-inputs
       (("rust-shell-words" ,rust-shell-words-0.1)
        ("rust-tempfile" ,rust-tempfile-3.1))))
    (inputs
     `(("gtk+" ,gtk+)))
    (home-page "https://gtk-rs.org/")
    (synopsis "FFI bindings to libgtk-3")
    (description "This package provides FFI bindings to libgtk-3.")
    (license license:expat)))

(define-public rust-parity-wasm-0.41
  (package
    (name "rust-parity-wasm")
    (version "0.41.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "parity-wasm" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0rfqgjyxrxrfjq5r5n81mdklahl8g4az6yhyyvw25nh0mj6qgz6x"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
      "https://github.com/paritytech/parity-wasm")
    (synopsis "WebAssembly low-level format library")
    (description
      "WebAssembly low-level format library")
    (license (list license:expat license:asl2.0))))

(define-public rust-parity-wasm-0.40
  (package
    (name "rust-parity-wasm")
    (version "0.40.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "parity-wasm" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "03qycy21avz4970zc7aj8rj5h4wvi4qsrc90a6hpws1a56mglf8y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f
       #:cargo-development-inputs
       (("rust-time" ,rust-time-0.1))))
    (home-page "https://github.com/paritytech/parity-wasm")
    (synopsis "Low-level WebAssembly format library")
    (description
     "This package provides a WebAssembly binary format serialization,
deserialization, and interpreter in Rust.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-parking-lot-0.10
  (package
    (name "rust-parking-lot")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "parking_lot" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1z0wgf2sd1266y768kxxs3313zjfzj9r3k7j4arfaz0bmd4qrscj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-lock-api" ,rust-lock-api-0.3)
        ("rust-parking-lot-core" ,rust-parking-lot-core-0.7))
       #:cargo-development-inputs
       (("rust-bincode" ,rust-bincode-1.1)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-rand" ,rust-rand-0.7))))
    (home-page "https://github.com/Amanieu/parking_lot")
    (synopsis "Compact standard synchronization primitives")
    (description
     "More compact and efficient implementations of the standard
synchronization primitives.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-parking-lot-0.9
  (package
    (inherit rust-parking-lot-0.10)
    (name "rust-parking-lot")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "parking_lot" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0lk2vq3hp88ygpgsrypdr3ss71fidnqbykva0csgxhmn5scb2hpq"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-lock-api" ,rust-lock-api-0.3)
        ("rust-parking-lot-core" ,rust-parking-lot-core-0.6))
       #:cargo-development-inputs
       (("rust-bincode" ,rust-bincode-1.1)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-rand" ,rust-rand-0.4)
        ("rust-rustc-version" ,rust-rustc-version-0.2))))))

(define-public rust-parking-lot-0.8
  (package
    (inherit rust-parking-lot-0.9)
    (name "rust-parking-lot")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "parking_lot" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1rrcdalr8l5zx3bw28l376321l6dnd6rqnsqsl0ygk01fy0nfxzs"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-lock-api" ,rust-lock-api-0.2)
        ("rust-parking-lot-core" ,rust-parking-lot-core-0.5))
       #:cargo-development-inputs
       (("rust-bincode" ,rust-bincode-1.1)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-rand" ,rust-rand-0.4)
        ("rust-rustc-version" ,rust-rustc-version-0.2))))))

(define-public rust-parking-lot-0.7
  (package
    (inherit rust-parking-lot-0.9)
    (name "rust-parking-lot")
    (version "0.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "parking_lot" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0dz32cqx9200n1lk3kwyb599vabfid3f8sj1aq85sw42s2pb8hdb"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-lock-api" ,rust-lock-api-0.1)
        ("rust-parking-lot-core" ,rust-parking-lot-core-0.4))
       #:cargo-development-inputs
       (("rust-bincode" ,rust-bincode-1.1)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-rand" ,rust-rand-0.4)
        ("rust-rustc-version" ,rust-rustc-version-0.2))))))

(define-public rust-parking-lot-core-0.7
  (package
    (name "rust-parking-lot-core")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "parking_lot_core" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1wdbrvh35nn09ga570vl5062dpwfbrwgzyrlhhy78ifzhj2870km"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-backtrace" ,rust-backtrace-0.3)
        ("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-cloudabi" ,rust-cloudabi-0.0)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-petgraph" ,rust-petgraph-0.4)
        ("rust-redox-syscall" ,rust-redox-syscall-0.1)
        ("rust-smallvec" ,rust-smallvec-1)
        ("rust-thread-id" ,rust-thread-id-3.3)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/Amanieu/parking_lot")
    (synopsis "API for creating custom synchronization primitives")
    (description
     "An advanced API for creating custom synchronization primitives in Rust.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-parking-lot-core-0.6
  (package
    (inherit rust-parking-lot-core-0.7)
    (name "rust-parking-lot-core")
    (version "0.6.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "parking_lot_core" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ay67dpnrn68ryyvp720m9i8hzp189fd4d6slrs1lvmcwywv2xmq"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-backtrace" ,rust-backtrace-0.3)
        ("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-cloudabi" ,rust-cloudabi-0.0)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-petgraph" ,rust-petgraph-0.4)
        ("rust-rand" ,rust-rand-0.4)
        ("rust-redox-syscall" ,rust-redox-syscall-0.1)
        ("rust-smallvec" ,rust-smallvec-0.6)
        ("rust-thread-id" ,rust-thread-id-3.3)
        ("rust-winapi" ,rust-winapi-0.3))
       #:cargo-development-inputs
       (("rust-rustc-version" ,rust-rustc-version-0.2))))))

(define-public rust-parking-lot-core-0.5
  (package
    (inherit rust-parking-lot-core-0.6)
    (name "rust-parking-lot-core")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "parking_lot_core" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1317j5a1yd03baza2kqqrxb4kr1vxa7rckw4frksl2vrncfcp26b"))))))

(define-public rust-parking-lot-core-0.4
  (package
    (inherit rust-parking-lot-core-0.6)
    (name "rust-parking-lot-core")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "parking_lot_core" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1jcq8aq4wv9y5fip7jg12jdwjd5g5r3x857xdma8vcin769cgj4l"))))))

(define-public rust-partial-io-0.2
  (package
    (name "rust-partial-io")
    (version "0.2.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "partial-io" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "03iynvayh11a4mckhwflm5y1qmnkw5m3b20gzi1crpasndy3h8xx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-futures" ,rust-futures-0.1)
        ("rust-quickcheck" ,rust-quickcheck-0.4)
        ("rust-tokio-io" ,rust-tokio-io-0.1))
       #:cargo-development-inputs
       (("rust-lazy-static" ,rust-lazy-static-0.2)
        ("rust-quickcheck" ,rust-quickcheck-0.4)
        ("rust-tokio-core" ,rust-tokio-core-0.1))))
    (home-page "https://github.com/facebookincubator/rust-partial-io")
    (synopsis
     "Helpers to test partial, interrupted and would-block I/O operations")
    (description
     "Helpers to test partial, interrupted and would-block I/O operations.")
    (license license:bsd-3)))

(define-public rust-paste-0.1
  (package
    (name "rust-paste")
    (version "0.1.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "paste" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0yk4zbi7128dcrklsbwfa63d39x0dv8f7pdbrylvdlcj0s9v2kxb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-paste-impl" ,rust-paste-impl-0.1)
        ("rust-proc-macro-hack" ,rust-proc-macro-hack-0.5))
       #:cargo-development-inputs
       (("rust-rustversion" ,rust-rustversion-1.0)
        ("rust-trybuild" ,rust-trybuild-1.0))))
    (home-page "https://github.com/dtolnay/paste")
    (synopsis "Macros for all your token pasting needs")
    (description
     "Macros for all your token pasting needs.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-paste-impl-0.1
  (package
    (name "rust-paste-impl")
    (version "0.1.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "paste-impl" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "12jsm83dnsqnrcabfacnwcxh3h4kykl622vi7glv2wg527hqc956"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro-hack" ,rust-proc-macro-hack-0.5)
        ("rust-proc-macro2" ,rust-proc-macro2-1.0)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-1.0))))
    (home-page "https://github.com/dtolnay/paste")
    (synopsis "Implementation detail of the paste crate")
    (description
     "Implementation detail of the paste crate.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-pcre2-0.2
  (package
    (name "rust-pcre2")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pcre2" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "103i66a998g1fjrqf9sdyvi8qi83hwglz3pjdcq9n2r207hsagb0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-pcre2-sys" ,rust-pcre2-sys-0.2)
        ("rust-thread-local" ,rust-thread-local-0.3))))
    (native-inputs
     `(("pcre2" ,pcre2)
       ("pkg-config" ,pkg-config)))
    (home-page "https://github.com/BurntSushi/rust-pcre2")
    (synopsis "High level wrapper library for PCRE2")
    (description
     "This package provides a high level wrapper library for PCRE2.")
    (license (list license:expat license:unlicense))))

(define-public rust-pcre2-sys-0.2
  (package
    (name "rust-pcre2-sys")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pcre2-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0nwdvc43dkb89qmm5q8gw1zyll0wsfqw7kczpn23mljra3874v47"))
       (modules '((guix build utils)))
       (snippet
        '(begin (delete-file-recursively "pcre2") #t))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-pkg-config" ,rust-pkg-config-0.3)
        ("rust-cc" ,rust-cc-1.0))))
    (native-inputs
     `(("pcre2" ,pcre2)
       ("pkg-config" ,pkg-config)))
    (home-page
     "https://github.com/BurntSushi/rust-pcre2")
    (synopsis "Low level bindings to PCRE2")
    (description "Low level bindings to PCRE2.")
    (license (list license:expat license:unlicense))))

(define-public rust-peeking-take-while-0.1
  (package
    (name "rust-peeking-take-while")
    (version "0.1.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "peeking_take_while" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "16bhqr6rdyrp12zv381cxaaqqd0pwysvm1q8h2ygihvypvfprc8r"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/fitzgen/peeking_take_while")
    (synopsis "Provides the peeking_take_while iterator adaptor method")
    (description
      "Like @code{Iterator::take_while}, but calls the predicate on a peeked
value.  This allows you to use @code{Iterator::by_ref} and
@code{Iterator::take_while} together, and still get the first value for which
the @code{take_while} predicate returned false after dropping the @code{by_ref}.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-percent-encoding-2.1
  (package
    (name "rust-percent-encoding")
    (version "2.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "percent-encoding" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0bp3zrsk3kr47fbpipyczidbbx4g54lzxdm77ni1i3qws10mdzfl"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/servo/rust-url/")
    (synopsis "Percent encoding and decoding")
    (description "This crate provides percent encoding and decoding.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-percent-encoding-1.0
  (package
    (inherit rust-percent-encoding-2.1)
    (name "rust-percent-encoding")
    (version "1.0.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "percent-encoding" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0cgq08v1fvr6bs5fvy390cz830lq4fak8havdasdacxcw790s09i"))))))

(define-public rust-permutohedron-0.2
  (package
    (name "rust-permutohedron")
    (version "0.2.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "permutohedron" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0b1pzh48j86v46wxngch6k1kx9cdw3jr3lwa86gd6jd4bmxzz1xn"))))
    (build-system cargo-build-system)
    (arguments '(#:skip-build? #t))
    (home-page "https://github.com/bluss/permutohedron")
    (synopsis "Generate permutations of sequences")
    (description
     "Generate permutations of sequences.  Either lexicographical order
permutations, or a minimal swaps permutation sequence implemented using Heap's
algorithm.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-pest-2.1
  (package
    (name "rust-pest")
    (version "2.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pest" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "134686mwxm73asbiads53zfchqvvcrsrsyax2cghfcizmvg8ac4k"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-serde" ,rust-serde-1.0)
        ("rust-serde-json" ,rust-serde-json-1.0)
        ("rust-ucd-trie" ,rust-ucd-trie-0.1))))
    (home-page "https://pest.rs/")
    (synopsis "The Elegant Parser")
    (description "The Elegant Parser.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-pest-derive-2.1
  (package
    (name "rust-pest-derive")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pest_derive" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1l5jfa6ril71cw5nsiw0r45br54dd8cj2r1nc2d1wq6wb3jilgc3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-pest" ,rust-pest-2.1)
        ("rust-pest-generator" ,rust-pest-generator-2.1))))
    (home-page "https://pest.rs/")
    (synopsis "Pest's derive macro")
    (description "Pest's derive macro.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-pest-generator-2.1
  (package
    (name "rust-pest-generator")
    (version "2.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pest_generator" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1h3z8jccki87mn7gppy4292s1ah98z4md998w5pd04jpkclwz7vv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-pest" ,rust-pest-2.1)
        ("rust-pest-meta" ,rust-pest-meta-2.1)
        ("rust-proc-macro2" ,rust-proc-macro2-1.0)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-1.0))))
    (home-page "https://pest.rs/")
    (synopsis "Pest code generator")
    (description "Pest code generator.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-pest-meta-2.1
  (package
    (name "rust-pest-meta")
    (version "2.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pest_meta" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0iymvrh7lcfi8iarkgq0hwgarr00np3l4xg4bx42rmvgi6czshyz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-maplit" ,rust-maplit-1.0)
        ("rust-pest" ,rust-pest-2.1)
        ("rust-sha-1" ,rust-sha-1-0.8))))
    (home-page "https://pest.rs")
    (synopsis "Pest meta language parser and validator")
    (description
     "Pest meta language parser and validator.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-petgraph-0.4
  (package
    (name "rust-petgraph")
    (version "0.4.13")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "petgraph" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0kyfmca854s54jk26g2x1kjb04c3k7cjilaxyr0if8lhxv8mjdlw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-fixedbitset" ,rust-fixedbitset-0.1)
        ("rust-ordermap" ,rust-ordermap-0.3)
        ("rust-quickcheck" ,rust-quickcheck-0.8)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0))
       #:cargo-development-inputs
       (("rust-defmac" ,rust-defmac-0.2)
        ("rust-itertools" ,rust-itertools-0.8)
        ("rust-odds" ,rust-odds-0.3)
        ("rust-rand" ,rust-rand-0.4))))
    (home-page "https://github.com/petgraph/petgraph")
    (synopsis "Graph data structure library")
    (description
     "Graph data structure library.  Provides graph types and graph
algorithms.")
    (license (list license:expat license:asl2.0))))

(define-public rust-phf-0.8
  (package
    (name "rust-phf")
    (version "0.8.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "phf" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "04pyv8bzqvw69rd5dynd5nb85py1hf7wa4ixyhrvdz1l5qin3yrx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-proc-macro-hack" ,rust-proc-macro-hack-0.5)
        ("rust-phf-shared" ,rust-phf-shared-0.8)
        ("rust-phf-macros" ,rust-phf-macros-0.8))))
    (home-page "https://github.com/sfackler/rust-phf")
    (synopsis "Runtime support for perfect hash function data structures")
    (description "This package provides runtime support for perfect hash
function data structures.")
    (license license:expat)))

(define-public rust-phf-0.7
  (package
    (name "rust-phf")
    (version "0.7.24")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "phf" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "066xwv4dr6056a9adlkarwp4n94kbpwngbmd47ngm3cfbyw49nmk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-phf-macros" ,rust-phf-macros-0.7)
        ("rust-phf-shared" ,rust-phf-shared-0.7))))
    (home-page "https://github.com/sfackler/rust-phf")
    (synopsis "Runtime support for perfect hash function data structures")
    (description
     "Runtime support for perfect hash function data structures.")
    (license license:expat)))

(define-public rust-phf-codegen-0.8
  (package
    (name "rust-phf-codegen")
    (version "0.8.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "phf_codegen" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "05d8w7aqqjb6039pfm6404gk5dlwrrf97kiy1n21212vb1hyxzyb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-phf-generator" ,rust-phf-generator-0.8)
        ("rust-phf-shared" ,rust-phf-shared-0.8))))
    (home-page "https://github.com/sfackler/rust-phf")
    (synopsis "Codegen library for PHF types")
    (description "Codegen library for PHF types.")
    (license license:expat)))

(define-public rust-phf-codegen-0.7
  (package
    (name "rust-phf-codegen")
    (version "0.7.24")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "phf-codegen" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0zjiblicfm0nrmr2xxrs6pnf6zz2394wgch6dcbd8jijkq98agmh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-phf-generator" ,rust-phf-generator-0.7)
        ("rust-phf-shared" ,rust-phf-shared-0.7))))
    (home-page
     "https://github.com/sfackler/rust-phf")
    (synopsis "Codegen library for PHF types")
    (description "Codegen library for PHF types.")
    (license license:expat)))

(define-public rust-phf-generator-0.8
  (package
    (name "rust-phf-generator")
    (version "0.8.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "phf_generator" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "09i5338d1kixq6a60fcayz6awgxjlxcfw9ic5f02abbgr067ydhp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-criterion" ,rust-criterion-0.3)
        ("rust-rand" ,rust-rand-0.7)
        ("rust-phf-shared" ,rust-phf-shared-0.8))))
    (home-page "https://github.com/sfackler/rust-phf")
    (synopsis "PHF generation logic")
    (description "PHF generation logic.")
    (license license:expat)))

(define-public rust-phf-generator-0.7
  (package
    (name "rust-phf-generator")
    (version "0.7.24")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "phf_generator" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0qi62gxk3x3whrmw5c4i71406icqk11qmpgln438p6qm7k4lqdh9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-phf-shared" ,rust-phf-shared-0.7)
        ("rust-rand" ,rust-rand-0.6))))
    (home-page "https://github.com/sfackler/rust-phf")
    (synopsis "PHF generation logic")
    (description "PHF generation logic")
    (license license:expat)))

(define-public rust-phf-macros-0.8
  (package
    (name "rust-phf-macros")
    (version "0.8.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "phf_macros" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "170qm6yqn6b9mjlwb2xmm3iad9d5nzwgfawfwy7zr7s2zwcdwvvz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-proc-macro-hack" ,rust-proc-macro-hack-0.5)
        ("rust-phf-generator" ,rust-phf-generator-0.8)
        ("rust-phf-shared" ,rust-phf-shared-0.8)
        ("rust-proc-macro2" ,rust-proc-macro2-1.0)
        ("rust-syn" ,rust-syn-1.0)
        ("rust-quote" ,rust-quote-1.0))))
    (home-page "https://github.com/sfackler/rust-phf")
    (synopsis "Macros to generate types in the phf crate")
    (description
     "This package contains macros to generate types in the phf crate.")
    (license license:expat)))

(define-public rust-phf-macros-0.7
  (package
    (name "rust-phf-macros")
    (version "0.7.24")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "phf_macros" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0dzylcy14ksy60h265l433j9ra8xhg8xlq3pd5qk658m6f1mxd5x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f      ; Depends on features not in Rust's stable release channel.
       #:cargo-inputs
       (("rust-phf-generator" ,rust-phf-generator-0.7)
        ("rust-phf-shared" ,rust-phf-shared-0.7)
        ("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-0.6)
        ("rust-syn" ,rust-syn-0.15))
       #:cargo-development-inputs
       (("rust-compiletest-rs" ,rust-compiletest-rs-0.3))))
    (home-page
     "https://github.com/sfackler/rust-phf")
    (synopsis
     "Macros to generate types in the phf crate")
    (description
     "Macros to generate types in the phf crate.")
    (license license:expat)))

(define-public rust-phf-shared-0.8
  (package
    (name "rust-phf-shared")
    (version "0.8.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "phf_shared" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1xssnqrrcn0nr9ayqrnm8xm37ac4xvwcx8pax7jxss7yxawzh360"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-siphasher" ,rust-siphasher-0.3)
        ("rust-unicase" ,rust-unicase-2.6))))
    (home-page "https://github.com/sfackler/rust-phf")
    (synopsis "Support code shared by PHF libraries")
    (description
     "This package provides support code shared by PHF libraries.")
    (license license:expat)))

(define-public rust-phf-shared-0.7
  (package
    (name "rust-phf-shared")
    (version "0.7.24")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "phf-shared" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "18371fla0vsj7d6d5rlfb747xbr2in11ar9vgv5qna72bnhp2kr3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-siphasher" ,rust-siphasher-0.2)
        ("rust-unicase" ,rust-unicase-1))))
    (home-page "https://github.com/sfackler/rust-phf")
    (synopsis "Support code shared by PHF libraries")
    (description
     "Support code shared by PHF libraries.")
    (license license:expat)))

(define-public rust-pico-sys-0.0
  (package
    (name "rust-pico-sys")
    (version "0.0.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pico-sys" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1q5pg0ms6szz6b5h26h4k40zb76zbwwjgyigac4wly9qngdj4yl5"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/reem/rust-pico-sys")
    (synopsis "Bindings to the PicoHTTPParser")
    (description
     "This package provides bindings to the PicoHTTPParser.")
    (properties '((hidden? . #t)))
    (license license:expat)))

(define-public rust-pin-utils-0.1
  (package
    (name "rust-pin-utils")
    (version "0.1.0-alpha.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pin-utils" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "11xmyx00n4m37d546by2rxb8ryxs12v55cc172i3yak1rqccd52q"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/rust-lang-nursery/pin-utils")
    (synopsis "Utilities for pinning")
    (description "This crate provides utilities for pinning values on the stack.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-piston-0.49
  (package
    (name "rust-piston")
    (version "0.49.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "piston" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1y0rbw92mzagqmwk79wv9axq0m7aid0s0d5cppyzh33wrxhdl3xj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-pistoncore-input" ,rust-pistoncore-input-0.28)
        ("rust-pistoncore-window" ,rust-pistoncore-window-0.44)
        ("rust-pistoncore-event-loop" ,rust-pistoncore-event-loop-0.49))))
    (home-page "https://github.com/PistonDevelopers/piston")
    (synopsis "Piston game engine core libraries")
    (description
     "The Piston game engine core libraries.")
    (license license:expat)))

(define-public rust-piston-float-1.0
  (package
    (name "rust-piston-float")
    (version "1.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "piston-float" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0r35aasycms79hf2vf1ap40kkp8ywgl4hmfkf762dq8jwd3vw07r"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
      "https://github.com/pistondevelopers/float")
    (synopsis
      "Traits for generic floats in game development")
    (description
      "Traits for generic floats in game development")
    (license license:expat)))

(define-public rust-piston-gfx-texture-0.40
  (package
    (name "rust-piston-gfx-texture")
    (version "0.40.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "piston-gfx_texture" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1nr5awdgk3njfvfanszrv4gxz93f6skid1c8yijswccygripchqz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-gfx" ,rust-gfx-0.18)
        ("rust-image" ,rust-image-0.22)
        ("rust-piston-texture" ,rust-piston-texture-0.8)
        ("rust-gfx-core" ,rust-gfx-core-0.9))))
    (home-page "https://github.com/pistondevelopers/gfx_texture")
    (synopsis
      "Gfx texture representation that works nicely with Piston libraries")
    (description "This package provides a Gfx texture representation that works
nicely with Piston libraries.")
    (license license:expat)))

(define-public rust-piston-graphics-api-version-0.2
  (package
    (name "rust-piston-graphics-api-version")
    (version "0.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "piston-graphics_api_version" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1b5p6s45jqv057lpbxkiq3yrdjjhvcynmi2vjf8292rf0yh4hky5"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
      "https://github.com/PistonDevelopers/graphics_api_version")
    (synopsis
      "A library for storing graphics API versions")
    (description
      "This package provides a library for storing graphics API versions")
    (license license:expat)))

(define-public rust-piston-shaders-graphics2d-0.3
  (package
    (name "rust-piston-shaders-graphics2d")
    (version "0.3.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "piston-shaders_graphics2d" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1dhh9bv4q19gdnj9d1nqq0yrvzs6gcn0c5j1p1f3xzyzq7d1gg4p"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
      "https://github.com/PistonDevelopers/shaders")
    (synopsis "Shaders for 2D graphics in Rust")
    (description "Shaders for 2D graphics in Rust")
    (license license:expat)))

(define-public rust-piston-texture-0.8
  (package
    (name "rust-piston-texture")
    (version "0.8.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "piston-texture" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1pcv5my49b8xzqcb87wqh2ndgvr4s9ipys96s0h9j2plxrj3bjb2"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
      "https://github.com/pistondevelopers/texture")
    (synopsis "A generic library for textures")
    (description
      "This package provides a generic library for textures")
    (license license:expat)))

(define-public rust-piston-viewport-1.0
  (package
    (name "rust-piston-viewport")
    (version "1.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "piston-viewport" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "16378hcy41b7x3zj2z4har0wq6fl4r62kf9p106jjl8hg2dv3aq1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-piston-float" ,rust-piston-float-1.0))))
    (home-page "https://github.com/PistonDevelopers/viewport")
    (synopsis "Library for storing viewport information")
    (description
     "This package provides a library for storing viewport information.")
    (license license:expat)))

(define-public rust-piston-window-0.105
  (package
    (name "rust-piston-window")
    (version "0.105.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "piston_window" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "05n2905gkp5ck25kbq95ia6pj1xz63dpp247jz3xcw1d41xpvi95"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-gfx-device-gl" ,rust-gfx-device-gl-0.16)
        ("rust-gfx" ,rust-gfx-0.18)
        ("rust-piston2d-graphics" ,rust-piston2d-graphics-0.35)
        ("rust-piston" ,rust-piston-0.49)
        ("rust-shader-version" ,rust-shader-version-0.6)
        ("rust-pistoncore-glutin-window" ,rust-pistoncore-glutin-window-0.63)
        ("rust-piston2d-gfx-graphics" ,rust-piston2d-gfx-graphics-0.66)
        ("rust-piston-texture" ,rust-piston-texture-0.8))))
    (home-page "https://github.com/pistondevelopers/piston_window")
    (synopsis "Official Piston window wrapper for the Piston game engine")
    (description
     "The official Piston window wrapper for the Piston game engine.")
    (license license:expat)))

(define-public rust-piston2d-gfx-graphics-0.66
  (package
    (name "rust-piston2d-gfx-graphics")
    (version "0.66.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "piston2d-gfx_graphics" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1pmlkf5rl6pr0c1lqm0059xwj9pwlws7gaq9w6r9d916di6fzki1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-gfx" ,rust-gfx-0.18)
        ("rust-piston-shaders-graphics2d" ,rust-piston-shaders-graphics2d-0.3)
        ("rust-piston-gfx-texture" ,rust-piston-gfx-texture-0.40)
        ("rust-shader-version" ,rust-shader-version-0.6)
        ("rust-draw-state" ,rust-draw-state-0.8))))
    (home-page "https://github.com/PistonDevelopers/gfx_graphics")
    (synopsis "Gfx 2D back-end for the Piston game engine")
    (description
     "This package provides a Gfx 2D back-end for the Piston game engine.")
    (license license:expat)))

(define-public rust-piston2d-graphics-0.35
  (package
    (name "rust-piston2d-graphics")
    (version "0.35.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "piston2d-graphics" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1dx2fanxc2pj76hc5l72x0fh4qg9gchjlr8rmbhdk6jpggcmq56g"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-interpolation" ,rust-interpolation-0.2)
        ("rust-rusttype" ,rust-rusttype-0.7)
        ("rust-piston-texture" ,rust-piston-texture-0.8)
        ("rust-piston-viewport" ,rust-piston-viewport-1.0)
        ("rust-read-color" ,rust-read-color-1.0)
        ("rust-vecmath" ,rust-vecmath-1.0)
        ("rust-fnv" ,rust-fnv-1.0))))
    (home-page "https://github.com/pistondevelopers/graphics")
    (synopsis "Library for 2D graphics that works with multiple back-ends")
    (description "This package provides a library for 2D graphics that works
with multiple back-ends.")
    (license license:expat)))

(define-public rust-pistoncore-event-loop-0.49
  (package
    (name "rust-pistoncore-event-loop")
    (version "0.49.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pistoncore-event_loop" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1h9ij9vx42xg39198yxdlpk842pli5jqm2kwswiv3bqqcji0fwsm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-pistoncore-input" ,rust-pistoncore-input-0.28)
        ("rust-pistoncore-window" ,rust-pistoncore-window-0.44))))
    (home-page "https://github.com/PistonDevelopers/piston")
    (synopsis "Piston event loop for games and interactive applications")
    (description "This package provides a Piston event loop for games and
interactive applications.")
    (license license:expat)))

(define-public rust-pistoncore-glutin-window-0.63
  (package
    (name "rust-pistoncore-glutin-window")
    (version "0.63.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pistoncore-glutin_window" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0dhbyxarv5i742d400bmqdqq3f8c25kcgcg0xavrc18dc913rixc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-gl" ,rust-gl-0.11)
        ("rust-glutin" ,rust-glutin-0.21)
        ("rust-pistoncore-input" ,rust-pistoncore-input-0.28)
        ("rust-pistoncore-window" ,rust-pistoncore-window-0.44)
        ("rust-shader-version" ,rust-shader-version-0.6))))
    (home-page "https://github.com/pistondevelopers/glutin_window")
    (synopsis "Piston window back-end using the Glutin library")
    (description
     "This package provides a Piston window back-end using the Glutin library.")
    (license license:expat)))

(define-public rust-pistoncore-input-0.28
  (package
    (name "rust-pistoncore-input")
    (version "0.28.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pistoncore-input" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1rrcz9px098m3nx98gvrvzirfdp3vg03cblfkcrp4wnvswc0hwq5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-piston-viewport" ,rust-piston-viewport-1.0)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-bitflags" ,rust-bitflags-1))))
    (home-page "https://github.com/PistonDevelopers/piston")
    (synopsis "Structure for user input")
    (description
     "This package provides a structure for user input.")
    (license license:expat)))

(define-public rust-pistoncore-window-0.44
  (package
    (name "rust-pistoncore-window")
    (version "0.44.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pistoncore-window" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "18qy3nnpb9jczvkiyzzznamck0pzgiyi6073jrkldnci6b3in10q"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-piston-graphics-api-version"
         ,rust-piston-graphics-api-version-0.2)
        ("rust-pistoncore-input" ,rust-pistoncore-input-0.28))))
    (home-page "https://github.com/PistonDevelopers/piston")
    (synopsis "Library for window abstraction")
    (description
     "This package provides a library for window abstraction.")
    (license license:expat)))

(define-public rust-pkg-config-0.3
  (package
    (name "rust-pkg-config")
    (version "0.3.17")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pkg-config" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0xynnaxdv0gzadlw4h79j855k0q7rj4zb9xb1vk00nc6ss559nh5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-lazy-static" ,rust-lazy-static-1))))
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (home-page "https://github.com/rust-lang/pkg-config-rs")
    (synopsis "Library to run the pkg-config system tool")
    (description
     "A library to run the pkg-config system tool at build time in order to be
used in Cargo build scripts.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-plain-0.2
  (package
    (name "rust-plain")
    (version "0.2.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "plain" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "19n1xbxb4wa7w891268bzf6cbwq4qvdb86bik1z129qb0xnnnndl"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/randomites/plain")
    (synopsis "Rust library that allows reinterpreting data safely")
    (description "This package provides a small Rust library that allows users
 to reinterpret data of certain types safely.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-plist-0.4
  (package
    (name "rust-plist")
    (version "0.4.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "plist" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0zqnxc5i4y6mj119vr0lzpb5j67vffpx2phhgh711533bw3ryajz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-line-wrap" ,rust-line-wrap-0.1)
        ("rust-base64" ,rust-base64-0.10)
        ("rust-xml-rs" ,rust-xml-rs-0.8)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-humantime" ,rust-humantime-1.3)
        ("rust-byteorder" ,rust-byteorder-1.3))))
    (home-page "https://github.com/ebarnard/rust-plist/")
    (synopsis "Rusty plist parser")
    (description
     "This package provides a rusty plist parser.  Supports Serde serialization.")
    (license license:expat)))

(define-public rust-plotters-0.2
  (package
    (name "rust-plotters")
    (version "0.2.12")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "plotters" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1ssycy9an23vs9hq098c7kl1dvp5ych20d994lhsw9vx4kdbhfsf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-gif" ,rust-gif-0.10)
        ("rust-piston-window" ,rust-piston-window-0.105)
        ("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
        ("rust-image" ,rust-image-0.22)
        ("rust-js-sys" ,rust-js-sys-0.3)
        ("rust-web-sys" ,rust-web-sys-0.3)
        ("rust-font-kit" ,rust-font-kit-0.4)
        ("rust-chrono" ,rust-chrono-0.4)
        ("rust-palette" ,rust-palette-0.5)
        ("rust-cairo-rs" ,rust-cairo-rs-0.7)
        ("rust-rusttype" ,rust-rusttype-0.8)
        ("rust-lazy-static" ,rust-lazy-static-1))))
    (home-page "https://github.com/38/plotters")
    (synopsis "Rust drawing library focus on data plotting")
    (description
     "This package provides a Rust drawing library focus on data plotting for
both WASM and native applications")
    (license license:expat)))

(define-public rust-plugin-0.2
  (package
    (name "rust-plugin")
    (version "0.2.6")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "plugin" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1q7nghkpvxxr168y2jnzh3w7qc9vfrby9n7ygy3xpj0bj71hsshs"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-typemap" ,rust-typemap-0.3))
       #:cargo-development-inputs
       (("rust-void" ,rust-void-1.0))))
    (home-page "https://github.com/reem/rust-plugin")
    (synopsis "Lazily evaluated, order-independent plugins for extensible types")
    (description
     "Lazily evaluated, order-independent plugins for extensible types.")
    (license license:expat)))

(define-public rust-pnacl-build-helper-1.4
  (package
    (name "rust-pnacl-build-helper")
    (version "1.4.11")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pnacl-build-helper" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "145hxz3m3sg8mm9sfqqqaarnna43v65l6whwswrvcvy0fzp17gnz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-tempdir" ,rust-tempdir-0.3)
        ("rust-walkdir" ,rust-walkdir-1.0))))
    (home-page "https://github.com/DiamondLovesYou/cargo-pnacl-helper")
    (synopsis
     "Build script helper for building PNaCl/NaCl C/CXX libraries from source")
    (description
     "Build script helper for building PNaCl/NaCl C/CXX libraries from source")
    (license license:mpl2.0)))

(define-public rust-png-0.15
  (package
    (name "rust-png")
    (version "0.15.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "png" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "10x2qkhyfnm3si5vgx77r2ik811gaap7ahi825wfxgsb0lirm1gg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-crc32fast" ,rust-crc32fast-1.2)
        ("rust-deflate" ,rust-deflate-0.7)
        ("rust-inflate" ,rust-inflate-0.4))
       #:cargo-development-inputs
       (("rust-getopts" ,rust-getopts-0.2)
        ;; TODO: glium has many cyclic dependencies with other packages
        ;;("rust-glium" ,rust-glium-0.24)
        ("rust-glob" ,rust-glob-0.3)
        ("rust-rand" ,rust-rand-0.7)
        ("rust-term" ,rust-term-0.6))))
    (home-page "https://github.com/image-rs/image-png.git")
    (synopsis "PNG decoding and encoding library in pure Rust")
    (description
     "PNG decoding and encoding library in pure Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-png-0.14
  (package
    (inherit rust-png-0.15)
    (name "rust-png")
    (version "0.14.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "png" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0nf3a8r9p9zrj4x30b48f7yv18dz9xkmrq9b3lnzmpnhzn0z9nk3"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-deflate" ,rust-deflate-0.7)
        ("rust-inflate" ,rust-inflate-0.4)
        ("rust-num-iter" ,rust-num-iter-0.1))
       #:cargo-development-inputs
       (("rust-getopts" ,rust-getopts-0.2)
        ;; TODO: glium has many cyclic dependencies with other packages
        ;; ("rust-glium" ,rust-glium-0.22)
        ("rust-glob" ,rust-glob-0.2)
        ("rust-rand" ,rust-rand-0.5)
        ("rust-term" ,rust-term-0.4))))))

(define-public rust-png-0.12
  (package
    (inherit rust-png-0.14)
    (name "rust-png")
    (version "0.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "png" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0nqlc8lqf8ncv3kj0gzlxwli61dbbxcjlrp176kvilw4sl09cjzm"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-deflate" ,rust-deflate-0.7)
        ("rust-inflate" ,rust-inflate-0.4)
        ("rust-num-iter" ,rust-num-iter-0.1))
       #:cargo-development-inputs
       (("rust-getopts" ,rust-getopts-0.2)
        ;; TODO: gluum has many cyclic dependencies with other packages
        ;; ("rust-glium" ,rust-glium-0.21)
        ("rust-glob" ,rust-glob-0.2)
        ("rust-term" ,rust-term-0.4))))))

(define-public rust-pocket-resources-0.3
  (package
    (name "rust-pocket-resources")
    (version "0.3.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pocket-resources" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1n2i5vmi8fdbw89wm5nz1ws1z9f1qax911p6ksg4scmdg23z6df1"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/tomaka/pocket-resources")
    (synopsis "Include resources in your applications")
    (description "This crate allows you to include resources in your
applications.")
    (license license:expat)))

(define-public rust-podio-0.1
  (package
    (name "rust-podio")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "podio" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ga5arhwakj5rwrqzf9410zrbwnf24jd59af8kr9rgwbd6vb83vq"))))
    (build-system cargo-build-system)
    ;(arguments '(#:skip-build? #t))
    (home-page "https://github.com/mvdnes/podio.git")
    (synopsis "Additional trait to read and write Plain Old Data")
    (description
     "Additional trait for Read and Write to read and write Plain Old Data.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ppv-lite86-0.2
  (package
    (name "rust-ppv-lite86")
    (version "0.2.6")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "ppv-lite86" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "06zs492wbms7j5qhy58cs3976c7kyc47rx0d6fn63rgvp580njbl"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/cryptocorrosion/cryptocorrosion")
    (synopsis "Implementation of the crypto-simd API for x86")
    (description "This crate provides an implementation of the crypto-simd API
for x86.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-precomputed-hash-0.1
  (package
    (name "rust-precomputed-hash")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "precomputed-hash" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "075k9bfy39jhs53cb2fpb9klfakx2glxnf28zdw08ws6lgpq6lwj"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://github.com/emilio/precomputed-hash")
    (synopsis
     "Base dependency to expose a precomputed hash")
    (description
     "This package provides a library intending to be a base
dependency to expose a precomputed hash.")
    (license license:expat)))

(define-public rust-pretty-assertions-0.6
  (package
    (name "rust-pretty-assertions")
    (version "0.6.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pretty_assertions" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "09yl14gnmpygiqrdlsa64lcl4w6ydjl9m8jri6kgam0v9rjf309z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-ctor" ,rust-ctor-0.1)
        ("rust-output-vt100" ,rust-output-vt100-0.1)
        ("rust-ansi-term" ,rust-ansi-term-0.11)
        ("rust-difference" ,rust-difference-2.0))))
    (home-page "https://github.com/colin-kiegel/rust-pretty-assertions")
    (synopsis "Drop-in replacements for assert_eq! and assert_ne!")
    (description
     "Overwrite @code{assert_eq!} and @code{assert_ne!} with drop-in
replacements, adding colorful diffs.")
    (license (list license:expat license:asl2.0))))

(define-public rust-pretty-env-logger-0.3
  (package
    (name "rust-pretty-env-logger")
    (version "0.3.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pretty_env_logger" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0x4hyjlnvvhyk9m74iypzybm22w3dl2k8img4b956239n5vf8zki"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-log" ,rust-log-0.4)
        ("rust-chrono" ,rust-chrono-0.4)
        ("rust-env-logger" ,rust-env-logger-0.6))))
    (home-page "https://github.com/seanmonstar/pretty-env-logger")
    (synopsis "Visually pretty env_logger")
    (description "This package provides a visually pretty env_logger.")
    (license (list license:expat license:asl2.0))))

(define-public rust-proc-macro-error-0.4
  (package
    (name "rust-proc-macro-error")
    (version "0.4.12")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "proc-macro-error" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1rvpaadwv7vmsp142qqh2axqrr9v78f1nvdsi9nhmfhy10kk1wqq"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build? #t
        #:cargo-inputs
        (("rust-proc-macro-error-attr" ,rust-proc-macro-error-attr-0.4)
         ("rust-version-check" ,rust-version-check-0.9)
         ("rust-proc-macro2" ,rust-proc-macro2-1.0)
         ("rust-syn" ,rust-syn-1.0)
         ("rust-quote" ,rust-quote-1.0))))
    (home-page "https://gitlab.com/CreepySkeleton/proc-macro-error")
    (synopsis "Almost drop-in replacement to panics in proc-macros")
    (description
     "Almost drop-in replacement to panics in proc-macros.")
    (license (list license:expat license:asl2.0))))

(define-public rust-proc-macro-error-attr-0.4
  (package
    (name "rust-proc-macro-error-attr")
    (version "0.4.12")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "proc-macro-error-attr" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1pk9mwcfnpf8favgc2cl4sqlmi818p96hg8pfb51wg5nzmvlnnwa"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-syn-mid" ,rust-syn-mid-0.5)
        ("rust-version-check" ,rust-version-check-0.9)
        ("rust-proc-macro2" ,rust-proc-macro2-1.0)
        ("rust-syn" ,rust-syn-1.0)
        ("rust-quote" ,rust-quote-1.0))))
    (home-page "https://gitlab.com/CreepySkeleton/proc-macro-error")
    (synopsis "Attribute macro for proc-macro-error crate")
    (description
     "Attribute macro for proc-macro-error crate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-proc-macro-hack-0.5
  (package
    (name "rust-proc-macro-hack")
    (version "0.5.15")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "proc-macro-hack" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0qqbfm1byabjkph56r2rlvv4cliz4960j6hav3ljazyjqvkryr8d"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-quote" ,rust-quote-1.0)
        ("rust-rustversion" ,rust-rustversion-1.0)
        ("rust-syn" ,rust-syn-1.0)
        ("rust-trybuild" ,rust-trybuild-1.0)
        ("rust-demo-hack" ,rust-demo-hack-0.0)
        ("rust-demo-hack-impl" ,rust-demo-hack-impl-0.0))))
    (home-page "https://github.com/dtolnay/proc-macro-hack")
    (synopsis
     "Procedural macros in expression position")
    (description
     "Procedural macros in expression position.")
    (license (list license:expat license:asl2.0))))

(define-public rust-proc-macro-hack-0.4
  (package
    (inherit rust-proc-macro-hack-0.5)
    (name "rust-proc-macro-hack")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "proc-macro-hack" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0fxn3qfhw76c518dfal2qqjwj5dbf0a1f7z0r5c4wd0igygg4fs6"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-proc-macro-hack-impl" ,rust-proc-macro-hack-impl-0.4))
       #:cargo-development-inputs
       (("rust-demo-hack" ,rust-demo-hack-0.0)
        ("rust-demo-hack-impl" ,rust-demo-hack-impl-0.0))))))

(define-public rust-proc-macro-hack-impl-0.4
  (package
    (name "rust-proc-macro-hack-impl")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "proc-macro-hack-impl" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0hk8g6s0zsi1ps0w48la2s8q5iqq42g8jfrgq3l2v04l2p5pvi1q"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/dtolnay/proc-macro-hack")
    (synopsis "Procedural functionlike!() macros using only Macros 1.1")
    (description
     "Procedural functionlike!() macros using only Macros 1.1.")
    (license (list license:expat license:asl2.0))))

(define-public rust-proc-macro-nested-0.1
  (package
    (name "rust-proc-macro-nested")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "proc-macro-nested" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0bmlksm8vl44wkwihmwr7jsjznhbg0n7aibcw1cs2jgjcp86x6in"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/dtolnay/proc-macro-hack")
    (synopsis
     "Support for nested proc-macro-hack invocations")
    (description
     "Support for nested proc-macro-hack invocations.")
    (license (list license:expat license:asl2.0))))

(define-public rust-proc-macro2-1.0
  (package
    (name "rust-proc-macro2")
    (version "1.0.10")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "proc-macro2" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1qxbnl8i3a5b2nxb8kdxbq6kj3pd1ckhm35wm7z3jd7n5wlns96z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-unicode-xid" ,rust-unicode-xid-0.2))
       #:cargo-development-inputs
       (("rust-quote" ,rust-quote-1.0))))
    (home-page "https://github.com/alexcrichton/proc-macro2")
    (synopsis "Stable implementation of the upcoming new `proc_macro` API")
    (description "This package provides a stable implementation of the upcoming new
`proc_macro` API.  Comes with an option, off by default, to also reimplement itself
in terms of the upstream unstable API.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-proc-macro2-0.4
  (package
    (inherit rust-proc-macro2-1.0)
    (name "rust-proc-macro2")
    (version "0.4.30")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "proc-macro2" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0nd71fl24sys066jrha6j7i34nfkjv44yzw8yww9742wmc8j0gfg"))))
    (arguments
     `(#:tests? #f      ; doc tests fail
       #:cargo-inputs
       (("rust-unicode-xid" ,rust-unicode-xid-0.1))
       #:cargo-development-inputs
       (("rust-quote" ,rust-quote-0.6))))))

(define-public rust-proc-macro2-0.3
  (package
    (name "rust-proc-macro2")
    (version "0.3.8")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "proc-macro2" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1ryaynnaj39l4zphcg5w8wszndd80vsrv89m5d2293gl6pry41hv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-unicode-xid" ,rust-unicode-xid-0.1))))
    (home-page "https://github.com/alexcrichton/proc-macro2")
    (synopsis
     "Substitute implementation of the compiler's `proc_macro` API")
    (description
     "This package provides a substitute implementation of the compiler's
@code{proc_macro} API to decouple token-based libraries from the procedural
macro use case.")
    (license (list license:expat license:asl2.0))))

(define-public rust-procedural-masquerade-0.1
  (package
    (name "rust-procedural-masquerade")
    (version "0.1.6")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "procedural-masquerade" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1l098px1hwdzqnxl376a9hfxb9q8kmj2n0y0s8k7plrz3jjp85cs"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/servo/rust-cssparser")
    (synopsis "Macro rules for proc-macro-derive")
    (description
     "This package provides @code{macro_rules} for making
@code{proc_macro_derive} pretend to be @code{proc_macro}.")
    (license (list license:expat license:asl2.0))))

(define-public rust-proptest-0.9
  (package
    (name "rust-proptest")
    (version "0.9.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "proptest" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "17sjg8isas4qk85807c4panih9k0lwa4k1mbajhciw5c5q17w56g"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-bit-set" ,rust-bit-set-0.5)
        ("rust-bitflags" ,rust-bitflags-1)
        ("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-quick-error" ,rust-quick-error-1.2)
        ("rust-rand" ,rust-rand-0.4)
        ("rust-rand-chacha" ,rust-rand-chacha-0.2)
        ("rust-rand-xorshift" ,rust-rand-xorshift-0.2)
        ("rust-regex-syntax" ,rust-regex-syntax-0.6)
        ("rust-rusty-fork" ,rust-rusty-fork-0.2)
        ("rust-tempfile" ,rust-tempfile-3.0))
       #:cargo-development-inputs
       (("rust-regex" ,rust-regex-1.1))))
    (home-page
     "https://altsysrq.github.io/proptest-book/proptest/index.html")
    (synopsis
     "Hypothesis-like property-based testing and shrinking")
    (description
     "Hypothesis-like property-based testing and shrinking.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-proptest-0.8
  (package
    (inherit rust-proptest-0.9)
    (name "rust-proptest")
    (version "0.8.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "proptest" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "07qrxwsd72wr1cqs0b5b159lnagjffp0l4s4zriz8jak8w20cvcj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f      ; 1 doc test fails
       #:cargo-inputs
       (("rust-bit-set" ,rust-bit-set-0.5)
        ("rust-bitflags" ,rust-bitflags-1)
        ("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-quick-error" ,rust-quick-error-1.2)
        ("rust-rand" ,rust-rand-0.5)
        ("rust-regex-syntax" ,rust-regex-syntax-0.6)
        ("rust-rusty-fork" ,rust-rusty-fork-0.2)
        ("rust-tempfile" ,rust-tempfile-3.0))
       #:cargo-development-inputs
       (("rust-regex" ,rust-regex-1.1))))))

(define-public rust-psm-0.1
  (package
    (name "rust-psm")
    (version "0.1.6")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "psm" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1q1hdbnp2j3zz1vhzp1xhds6ynan3mg5bhjlhfy5m1sg8n5wckxi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-cc" ,rust-cc-1.0))))
    (home-page "https://github.com/rust-lang/stacker/")
    (synopsis "Stack manipulation and introspection routines")
    (description "This crate provides very portable functions to control the
stack pointer and inspect the properties of the stack.")
    (license (list license:isc license:asl2.0))))

(define-public rust-pulldown-cmark-0.4
  (package
    (name "rust-pulldown-cmark")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pulldown-cmark" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1db8vlhm3n72051bkq4am80q28rfrh88796i3y9ajf5hhk3lrdyi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-getopts" ,rust-getopts-0.2)
        ("rust-memchr" ,rust-memchr-2.2)
        ("rust-unicase" ,rust-unicase-2.4))
       #:cargo-development-inputs
       (("rust-criterion" ,rust-criterion-0.2)
        ("rust-html5ever" ,rust-html5ever-0.23)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-regex" ,rust-regex-1.1)
        ("rust-tendril" ,rust-tendril-0.4))))
    (home-page "https://github.com/raphlinus/pulldown-cmark")
    (synopsis "Pull parser for CommonMark")
    (description
     "This package provides a pull parser for CommonMark.")
    (license license:expat)))

(define-public rust-pulldown-cmark-0.2
  (package
    (name "rust-pulldown-cmark")
    (version "0.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pulldown-cmark" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "05gfnqa0wzix5m17jrmgj0yyr9sflqm0knn79ndppsnhcan2zxgf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-getopts" ,rust-getopts-0.2)
        ("rust-bitflags" ,rust-bitflags-1))))
    (home-page "https://github.com/raphlinus/pulldown-cmark")
    (synopsis "Pull parser for CommonMark")
    (description
     "This package provides a pull parser for CommonMark.")
    (license license:expat)))

(define-public rust-quantiles-0.7
  (package
    (name "rust-quantiles")
    (version "0.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "quantiles" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1wjp16a3d4bmldq9w2wds0q4gjz4mnsqac3g38r6ryr6zc9sh3y1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0))
       #:cargo-development-inputs
       (("rust-quickcheck" ,rust-quickcheck-0.5))))
    (home-page "https://github.com/postmates/quantiles")
    (synopsis "Collection of approximate quantile algorithms")
    (description
     "This package provides a collection of approximate quantile algorithms.")
    (license license:expat)))

(define-public rust-quasi-0.32
  (package
    (name "rust-quasi")
    (version "0.32.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "quasi" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1csqqgz3aw85q570ywmhb34r3sqgi1sprf8xadfwzlfnai45ri0q"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-clippy" ,rust-clippy-0.0)
        ("rust-syntex-errors" ,rust-syntex-errors-0.58)
        ("rust-syntex-syntax" ,rust-syntex-syntax-0.58))))
    (home-page "https://github.com/serde-rs/quasi")
    (synopsis "Quasi-quoting macro system")
    (description
     "This package provides a quasi-quoting macro system.")
    (license (list license:expat license:asl2.0))))

(define-public rust-quasi-codegen-0.32
  (package
    (name "rust-quasi-codegen")
    (version "0.32.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "quasi_codegen" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1m3nwzn5ip8y86cyfk6hdnbhiinsk2faag7l0cc4q11wl9gy5fai"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-aster" ,rust-aster-0.41)
        ("rust-clippy" ,rust-clippy-0.0)
        ("rust-syntex" ,rust-syntex-0.58)
        ("rust-syntex-errors" ,rust-syntex-errors-0.58)
        ("rust-syntex-syntax" ,rust-syntex-syntax-0.58))))
    (home-page "https://github.com/serde-rs/quasi")
    (synopsis "Quasi-quoting macro system")
    (description "This package provides a quasi-quoting macro system.")
    (license (list license:expat license:asl2.0))))

(define-public rust-quasi-macros-0.32
  (package
    (name "rust-quasi-macros")
    (version "0.32.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "quasi_macros" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1p825s96wa9xcc01pm5f4nlb01nx0pah50qnwkbncrw1q9xwiki9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-clippy" ,rust-clippy-0.0)
        ("rust-quasi-codegen" ,rust-quasi-codegen-0.32))
       #:cargo-development-inputs
       (("rust-aster" ,rust-aster-0.41)
        ("rust-quasi" ,rust-quasi-0.32))))
    (home-page "https://github.com/serde-rs/quasi")
    (synopsis "Quasi-quoting macro system")
    (description "This package provides a quasi-quoting macro system.")
    (license (list license:expat license:asl2.0))))

(define-public rust-quick-error-1.2
  (package
    (name "rust-quick-error")
    (version "1.2.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "quick-error" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1q6za3v78hsspisc197bg3g7rpc989qycy8ypr8ap8igv10ikl51"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/tailhook/quick-error")
    (synopsis "Macro which makes error types pleasant to write")
    (description "This crate provides a macro which makes error types pleasant
to write.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-quickcheck-0.9
  (package
    (name "rust-quickcheck")
    (version "0.9.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "quickcheck" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0pwl7j21wmf843kpa9gr0byb40hg975ghjrwp0yxcym99bkq6j54"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-env-logger" ,rust-env-logger-0.7)
        ("rust-log" ,rust-log-0.4)
        ("rust-rand" ,rust-rand-0.7)
        ("rust-rand-core" ,rust-rand-core-0.5))))
    (home-page "https://github.com/BurntSushi/quickcheck")
    (synopsis "Automatic property based testing with shrinking")
    (description
     "QuickCheck is a way to do property based testing using randomly generated
input.  This crate comes with the ability to randomly generate and shrink
integers, floats, tuples, booleans, lists, strings, options and results.")
    (license (list license:unlicense license:expat))))

(define-public rust-quickcheck-0.8
  (package
    (inherit rust-quickcheck-0.9)
    (name "rust-quickcheck")
    (version "0.8.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "quickcheck" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0mkl4wnvvjk4m32aq3an4ayfyvnmbxnzcybfm7n3fbsndb1xjdcw"))))
    (arguments
     `(#:cargo-inputs
       (("rust-env-logger" ,rust-env-logger-0.6)
        ("rust-log" ,rust-log-0.4)
        ("rust-rand" ,rust-rand-0.6)
        ("rust-rand-core" ,rust-rand-core-0.4))))))

(define-public rust-quickcheck-0.7
  (package
    (inherit rust-quickcheck-0.9)
    (name "rust-quickcheck")
    (version "0.7.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "quickcheck" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "05pqzja6fwdyrs1za5vmxb9ifb993knmpdsrs1fs2wyz9qz7slyl"))))
    (arguments
     `(#:cargo-inputs
       (("rust-env-logger" ,rust-env-logger-0.5)
        ("rust-log" ,rust-log-0.4)
        ("rust-rand" ,rust-rand-0.5)
        ("rust-rand-core" ,rust-rand-core-0.2))))))

(define-public rust-quickcheck-0.6
  (package
    (inherit rust-quickcheck-0.9)
    (name "rust-quickcheck")
    (version "0.6.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "quickcheck" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1dyazm2fcq0v9fscq1a7597zsvdl9f0j8c2bfj1jm2nlzz2sn6y0"))))
    (arguments
     `(#:cargo-inputs
       (("rust-env-logger" ,rust-env-logger-0.5)
        ("rust-log" ,rust-log-0.4)
        ("rust-rand" ,rust-rand-0.4))))))

(define-public rust-quickcheck-0.5
  (package
    (inherit rust-quickcheck-0.9)
    (name "rust-quickcheck")
    (version "0.5.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "quickcheck" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1jzm1ygfbn4igaq14b9nipc8yvsn6c8panpgd1qiy5r2insjllyd"))))
    (arguments
     `(#:cargo-inputs
       (("rust-env-logger" ,rust-env-logger-0.4)
        ("rust-log" ,rust-log-0.3)
        ("rust-rand" ,rust-rand-0.3))))))

(define-public rust-quickcheck-0.4
  (package
    (inherit rust-quickcheck-0.5)
    (name "rust-quickcheck")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "quickcheck" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "01hligcv1h4pvc8ykch65qjzi7jgcq2s462v69j27slc84fl3hh2"))))
    (arguments
     `(#:cargo-inputs
       (("rust-env-logger" ,rust-env-logger-0.3)
        ("rust-log" ,rust-log-0.3)
        ("rust-rand" ,rust-rand-0.3))))))

(define-public rust-quickcheck-0.2
  (package
    (inherit rust-quickcheck-0.4)
    (name "rust-quickcheck")
    (version "0.2.27")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "quickcheck" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1vb4acppaavlnchzc1jmn5wlkgir9x9gmhgp97bavyxxqxgsg1nh"))))))

(define-public rust-quickcheck-macros-0.8
  (package
    (name "rust-quickcheck-macros")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "quickcheck_macros" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0b3mhn0xcrdd3fkbkx3rghhivwzwil8w991ngp6gaj70l72c3pyp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-0.6)
        ("rust-syn" ,rust-syn-0.15))
       #:cargo-development-inputs
       (("rust-quickcheck" ,rust-quickcheck-0.8))))
    (home-page "https://github.com/BurntSushi/quickcheck")
    (synopsis "Macro attribute for quickcheck")
    (description
     "This package provides a macro attribute for quickcheck.")
    (license (list license:unlicense license:expat))))

(define-public rust-quote-1.0
  (package
    (name "rust-quote")
    (version "1.0.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "quote" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0zwd6fp74xfg4jnnnwj4v84lkzif2giwj4ch1hka9g35ghc6rp1b"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1.0))
       #:cargo-development-inputs
       (("rust-rustversion" ,rust-rustversion-1.0)
        ("rust-trybuild" ,rust-trybuild-1.0))))
    (home-page "https://github.com/dtolnay/quote")
    (synopsis "Quasi-quoting macro quote!(...)")
    (description "Quasi-quoting macro quote!(...)")
    (license (list license:asl2.0 license:expat))))

(define-public rust-quote-0.6
  (package
    (inherit rust-quote-1.0)
    (name "rust-quote")
    (version "0.6.13")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "quote" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1qgqq48jymp5h4y082aanf25hrw6bpb678xh3zw993qfhxmkpqkc"))))
    (arguments
     `(#:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-0.4))))))

(define-public rust-quote-0.5
  (package
    (inherit rust-quote-0.6)
    (name "rust-quote")
    (version "0.5.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "quote" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1s01fh0jl8qv4xggs85yahw0h507nzrxkjbf7vay3zw8d3kcyjcr"))))
    (arguments
      `(#:skip-build? #t
        #:cargo-inputs
        (("rust-proc-macro2" ,rust-proc-macro2-0.3))))))

(define-public rust-quote-0.3
  (package
    (inherit rust-quote-0.6)
    (name "rust-quote")
    (version "0.3.15")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "quote" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0yhnnix4dzsv8y4wwz4csbnqjfh73al33j35msr10py6cl5r4vks"))))
    (arguments '())))

(define-public rust-rand-0.7
  (package
    (name "rust-rand")
    (version "0.7.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rand" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "00sdaimkbz491qgi6qxkv582yivl32m2jd401kzbn94vsiwicsva"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-getrandom" ,rust-getrandom-0.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-packed-simd" ,rust-packed-simd-0.3)
        ("rust-rand-chacha" ,rust-rand-chacha-0.2)
        ("rust-rand-core" ,rust-rand-core-0.5)
        ("rust-rand-hc" ,rust-rand-hc-0.2)
        ("rust-rand-pcg" ,rust-rand-pcg-0.2))
       #:cargo-development-inputs
       (("rust-rand-hc" ,rust-rand-hc-0.2)
        ("rust-rand-pcg" ,rust-rand-pcg-0.2))))
    (home-page "https://crates.io/crates/rand")
    (synopsis "Random number generators and other randomness functionality")
    (description
     "Rand provides utilities to generate random numbers, to convert them to
useful types and distributions, and some randomness-related algorithms.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-rand-0.6
  (package
    (inherit rust-rand-0.7)
    (name "rust-rand")
    (version "0.6.5")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rand" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1jl4449jcl4wgmzld6ffwqj5gwxrp8zvx8w573g1z368qg6xlwbd"))))
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-packed-simd" ,rust-packed-simd-0.3)
        ("rust-rand-chacha" ,rust-rand-chacha-0.1)
        ("rust-rand-core" ,rust-rand-core-0.4)
        ("rust-rand-hc" ,rust-rand-hc-0.1)
        ("rust-rand-isaac" ,rust-rand-isaac-0.1)
        ("rust-rand-jitter" ,rust-rand-jitter-0.1)
        ("rust-rand-os" ,rust-rand-os-0.1)
        ("rust-rand-pcg" ,rust-rand-pcg-0.1)
        ("rust-rand-xorshift" ,rust-rand-xorshift-0.1)
        ("rust-winapi" ,rust-winapi-0.3)
        ("rust-autocfg" ,rust-autocfg-0.1)) ; build-dependency
       #:cargo-development-inputs
       (("rust-average" ,rust-average-0.9)
        ("rust-rand-xoshiro" ,rust-rand-xoshiro-0.1))))))

(define-public rust-rand-0.5
  (package
    (inherit rust-rand-0.7)
    (name "rust-rand")
    (version "0.5.6")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rand" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1fdcgja9167hlzkf4g5daqwp498lwiyq7aqm05whklpbsdyc8666"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-cloudabi" ,rust-cloudabi-0.0)
        ("rust-fuchsia-cprng" ,rust-fuchsia-cprng-0.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-rand-core" ,rust-rand-core-0.3)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-stdweb" ,rust-stdweb-0.4)
        ("rust-winapi" ,rust-winapi-0.3))
       #:cargo-development-inputs
       (("rust-bincode" ,rust-bincode-1.1))))))

(define-public rust-rand-0.4
  (package
    (inherit rust-rand-0.6)
    (name "rust-rand")
    (version "0.4.6")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rand" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "14qjfv3gggzhnma20k0sc1jf8y6pplsaq7n1j9ls5c8kf2wl0a2m"))))
    (arguments
     `(#:cargo-inputs
       (("rust-fuchsia-cprng" ,rust-fuchsia-cprng-0.1)
        ("rust-rand-core" ,rust-rand-core-0.3)
        ("rust-rdrand" ,rust-rdrand-0.4)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-winapi" ,rust-winapi-0.3))))))

(define-public rust-rand-0.3
  (package
    (inherit rust-rand-0.6)
    (name "rust-rand")
    (version "0.3.23")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rand" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0v679h38pjjqj5h4md7v2slsvj6686qgcn7p9fbw3h43iwnk1b34"))))
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-rand" ,rust-rand-0.4))))))

(define-public rust-rand-chacha-0.2
  (package
    (name "rust-rand-chacha")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand_chacha" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "00il36fkdbsmpr99p9ksmmp6dn1md7rmnwmz0rr77jbrca2yvj7l"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-c2-chacha" ,rust-c2-chacha-0.2)
        ("rust-rand-core" ,rust-rand-core-0.5))))
    (home-page "https://crates.io/crates/rand-chacha")
    (synopsis "ChaCha random number generator")
    (description "ChaCha random number generator.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-rand-chacha-0.1
  (package
    (inherit rust-rand-chacha-0.2)
    (name "rust-rand-chacha")
    (version "0.1.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rand_chacha" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1vxwyzs4fy1ffjc8l00fsyygpiss135irjf7nyxgq2v0lqf3lvam"))))
    (arguments
     `(#:cargo-inputs
       (("rust-rand-core" ,rust-rand-core-0.3))
       #:cargo-development-inputs
       (("rust-autocfg" ,rust-autocfg-0.1))))))

(define-public rust-rand-core-0.5
  (package
    (name "rust-rand-core")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand_core" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "06bdvx08v3rkz451cm7z59xwwqn1rkfh6v9ay77b14f8dwlybgch"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-getrandom" ,rust-getrandom-0.1)
        ("rust-serde" ,rust-serde-1.0))))
    (home-page "https://crates.io/crates/rand-core")
    (synopsis
     "Core random number generator traits and tools for implementation")
    (description
     "Core random number generator traits and tools for implementation.")
    (license (list license:expat license:asl2.0))))

(define-public rust-rand-core-0.4
  (package
    (inherit rust-rand-core-0.5)
    (name "rust-rand-core")
    (version "0.4.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rand_core" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1p09ynysrq1vcdlmcqnapq4qakl2yd1ng3kxh3qscpx09k2a6cww"))))
    (arguments
     `(#:cargo-inputs
       (("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0))))))

(define-public rust-rand-core-0.3
  (package
    (inherit rust-rand-core-0.4)
    (name "rust-rand-core")
    (version "0.3.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rand_core" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0jzdgszfa4bliigiy4hi66k7fs3gfwi2qxn8vik84ph77fwdwvvs"))))
    ;; This version is a 0.3 API wrapper around the 0.4 version.
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rand-core" ,rust-rand-core-0.4))))))

(define-public rust-rand-core-0.2
  (package
    (inherit rust-rand-core-0.5)
    (name "rust-rand-core")
    (version "0.2.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rand-core" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0wikbw2a36bz8ywjyycjrd7db6ra3yzj14zs1ysxz2fiqhia8q8r"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-rand-core" ,rust-rand-core-0.3))))))

(define-public rust-rand-hc-0.2
  (package
    (name "rust-rand-hc")
    (version "0.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rand_hc" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0g31sqwpmsirdlwr0svnacr4dbqyz339im4ssl9738cjgfpjjcfa"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-rand-hc" ,rust-rand-core-0.5))))
    (home-page "https://crates.io/crates/rand_hc")
    (synopsis "HC128 random number generator")
    (description "This package provides a cryptographically secure random number
generator that uses the HC-128 algorithm.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-rand-hc-0.1
  (package
    (inherit rust-rand-hc-0.2)
    (name "rust-rand-hc")
    (version "0.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rand_hc" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1i0vl8q5ddvvy0x8hf1zxny393miyzxkwqnw31ifg6p0gdy6fh3v"))))
    (arguments
     `(#:cargo-inputs (("rust-rand-core" ,rust-rand-core-0.3))))))

(define-public rust-rand-isaac-0.2
  (package
    (name "rust-rand-isaac")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand_isaac" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0xlb9415x518ffkazxhvk8b04i9i548nva4i5l5s34crvjrv1xld"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-rand-core" ,rust-rand-core-0.5)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-bincode" ,rust-bincode-1.1))))
    (home-page "https://crates.io/crates/rand_isaac")
    (synopsis "ISAAC random number generator")
    (description "This package implements the @code{ISAAC} and @code{ISAAC-64}
random number generators.  ISAAC stands for \"Indirection, Shift, Accumulate,
Add, and Count\" which are the principal bitwise operations employed.")
    (license (list license:expat license:asl2.0))))

(define-public rust-rand-isaac-0.1
  (package
    (inherit rust-rand-isaac-0.2)
    (name "rust-rand-isaac")
    (version "0.1.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rand_isaac" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "027flpjr4znx2csxk7gxb7vrf9c7y5mydmvg5az2afgisp4rgnfy"))))
    (arguments
     `(#:cargo-inputs
       (("rust-rand-core" ,rust-rand-core-0.3)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0))
       #:cargo-development-inputs
       (("rust-bincode" ,rust-bincode-1.1))))))

(define-public rust-rand-jitter-0.1
  (package
    (name "rust-rand-jitter")
    (version "0.1.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rand_jitter" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "16z387y46bfz3csc42zxbjq89vcr1axqacncvv8qhyy93p4xarhi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-rand-core" ,rust-rand-core-0.4)
        ("rust-winapi" ,rust-winapi-0.3)
        ("rust-log" ,rust-log-0.4))))
    (home-page "https://github.com/rust-random/rand")
    (synopsis "Random number generator based on timing jitter")
    (description "This package provides a non-physical true random number
generator based on timing jitter.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-rand-os-0.2
  (package
    (name "rust-rand-os")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand_os" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "06is69f8rfzs620g5b54k6cgy5yaycrsyqg55flyfrsf8g88733f"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-getrandom" ,rust-getrandom-0.1)
        ("rust-rand-core" ,rust-rand-core-0.5))))
    (home-page "https://crates.io/crates/rand-os")
    (synopsis "OS backed Random Number Generator")
    (description "OS backed Random Number Generator.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-rand-os-0.1
  (package
    (inherit rust-rand-os-0.2)
    (name "rust-rand-os")
    (version "0.1.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rand_os" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0wahppm0s64gkr2vmhcgwc0lij37in1lgfxg5rbgqlz0l5vgcxbv"))))
    (arguments
     `(#:cargo-inputs
       (("rust-cloudabi" ,rust-cloudabi-0.0)
        ("rust-fuchsia-cprng" ,rust-fuchsia-cprng-0.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-rand-core" ,rust-rand-core-0.4)
        ("rust-rdrand" ,rust-rdrand-0.4)
        ("rust-stdweb" ,rust-stdweb-0.4)
        ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
        ("rust-winapi" ,rust-winapi-0.3))))))

(define-public rust-rand-pcg-0.2
  (package
    (name "rust-rand-pcg")
    (version "0.2.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rand_pcg" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0ab4h6s6x3py833jk61lwadq83qd1c8bih2hgi6yps9rnv0x1aqn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-rand-core" ,rust-rand-core-0.5)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-bincode" ,rust-bincode-1.1))))
    (home-page "https://crates.io/crates/rand_pcg")
    (synopsis
     "Selected PCG random number generators")
    (description
     "Implements a selection of PCG random number generators.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-rand-pcg-0.1
  (package
    (inherit rust-rand-pcg-0.2)
    (name "rust-rand-pcg")
    (version "0.1.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rand_pcg" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0i0bdla18a8x4jn1w0fxsbs3jg7ajllz6azmch1zw33r06dv1ydb"))))
    (arguments
     `(#:cargo-inputs
       (("rust-autocfg" ,rust-autocfg-0.1)
        ("rust-rand-core" ,rust-rand-core-0.4)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0))
       #:cargo-development-inputs
       (("rust-bincode" ,rust-bincode-1.1))))))

(define-public rust-rand-xorshift-0.2
  (package
    (name "rust-rand-xorshift")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand_xorshift" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1a6wy76lc5fimm1n9n8fzhp4cfjwfwxh4hx63bg3vlh1d2w1dm3p"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-rand-core" ,rust-rand-core-0.5)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-bincode" ,rust-bincode-1.1))))
    (home-page "https://crates.io/crates/rand-xorshift")
    (synopsis "Xorshift random number generator")
    (description
     "Xorshift random number generator.")
    (license (list license:expat license:asl2.0))))

(define-public rust-rand-xorshift-0.1
  (package
    (name "rust-rand-xorshift")
    (version "0.1.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rand_xorshift" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0p2x8nr00hricpi2m6ca5vysiha7ybnghz79yqhhx6sl4gkfkxyb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-rand-core" ,rust-rand-core-0.3)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0))
       #:cargo-development-inputs
       (("rust-bincode" ,rust-bincode-1.1))))
    (home-page "https://crates.io/crates/rand-xorshift")
    (synopsis "Xorshift random number generator")
    (description
      "Xorshift random number generator")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-rand-xoshiro-0.4
  (package
    (name "rust-rand-xoshiro")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand-xoshiro" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "013h45rikipv5bda2ixmwx5rwsk9wpc7mr0a77cz20hxi0pdvz59"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-rand-core" ,rust-rand-core-0.5)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-bincode" ,rust-bincode-1.1))))
    (home-page "https://crates.io/crates/rand_xoshiro")
    (synopsis "Xoshiro, xoroshiro and splitmix64 random number generators")
    (description "This package provides the xoshiro, xoroshiro and splitmix64
random number generators.")
    (license (list license:expat license:asl2.0))))

(define-public rust-rand-xoshiro-0.3
  (package
    (inherit rust-rand-xoshiro-0.4)
    (name "rust-rand-xoshiro")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand_xoshiro" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "07w3qgrac8r356lz5vqff42rly6yd9vs3g5lx5pbn13rcmb05rqb"))))
    (arguments
     `(#:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-rand-core" ,rust-rand-core-0.5)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-bincode" ,rust-bincode-1.1))))))

(define-public rust-rand-xoshiro-0.1
  (package
    (inherit rust-rand-xoshiro-0.4)
    (name "rust-rand-xoshiro")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand_xoshiro" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ac9ha6ll8b6l1930bd99k29jrjpsbpddvr6ycrnbi5rkwb1id03"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-rand-core" ,rust-rand-core-0.3))
       #:cargo-development-inputs
       (("rust-rand" ,rust-rand-0.6))))))

(define-public rust-raw-window-handle-0.3
  (package
    (name "rust-raw-window-handle")
    (version "0.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "raw-window-handle" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "04c2wir7qq3g2b143yav52a1g5ack8ffqx2bpmrn9bc0dix1li0a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/rust-windowing/raw-window-handle")
    (synopsis "Interoperability library for Rust Windowing applications")
    (description
     "Interoperability library for Rust Windowing applications.")
    (license license:expat)))

(define-public rust-rawpointer-0.2
  (package
    (name "rust-rawpointer")
    (version "0.2.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rawpointer" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1qy1qvj17yh957vhffnq6agq0brvylw27xgks171qrah75wmg8v0"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/bluss/rawpointer/")
    (synopsis "Extra methods for raw pointers")
    (description "Extra methods for raw pointers.  For example
@code{.post_inc()} and @code{.pre_dec()} (c.f. @code{ptr++} and @code{--ptr})
and @code{ptrdistance}.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-rawpointer-0.1
  (package
    (inherit rust-rawpointer-0.2)
    (name "rust-rawpointer")
    (version "0.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rawpointer" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "06ghpm9y7gacks78s3maakha07kbnwrxif5q37r2l7z1sali3b7b"))))))

(define-public rust-rawslice-0.1
  (package
    (name "rust-rawslice")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rawslice" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "09bympww1rpsd422da3w444q5w1znjbjh7mjninhq9gaaygkpci2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-rawpointer" ,rust-rawpointer-0.1))
       #:cargo-development-inputs
       (("rust-quickcheck" ,rust-quickcheck-0.8))))
    (home-page "https://github.com/bluss/rawslice/")
    (synopsis "Reimplementation of the slice iterators, with extra features")
    (description
     "Reimplementation of the slice iterators, with extra features.
For example creation from raw pointers and start, end pointer
accessors.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-rayon-1.3
  (package
    (name "rust-rayon")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rayon" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1650g13bxlmywhdlw65q3g1zyyb7l0wcm35v45kf31cwgwly6v6v"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-crossbeam-deque" ,rust-crossbeam-deque-0.7)
        ("rust-either" ,rust-either-1.5)
        ("rust-rayon-core" ,rust-rayon-core-1.7))
       #:cargo-development-inputs
       (("rust-doc-comment" ,rust-doc-comment-0.3)
        ("rust-docopt" ,rust-docopt-1.1)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-rand" ,rust-rand-0.7)
        ("rust-rand-xorshift" ,rust-rand-xorshift-0.2)
        ("rust-serde" ,rust-serde-1.0))))
    (home-page "https://github.com/rayon-rs/rayon")
    (synopsis "Simple work-stealing parallelism for Rust")
    (description
     "Simple work-stealing parallelism for Rust.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-rayon-1.1
  (package
    (inherit rust-rayon-1.3)
    (name "rust-rayon")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rayon" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "190hkbcdfvcphyyzkdg52zdia2y9d9yanpm072bmnzbn49p1ic54"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-crossbeam-deque" ,rust-crossbeam-deque-0.6)
        ("rust-either" ,rust-either-1.5)
        ("rust-rayon-core" ,rust-rayon-core-1.5))
       #:cargo-development-inputs
       (("rust-doc-comment" ,rust-doc-comment-0.3)
        ("rust-docopt" ,rust-docopt-1.1)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-rand" ,rust-rand-0.4)
        ("rust-rand-xorshift" ,rust-rand-xorshift-0.2)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0))))))

(define-public rust-rayon-core-1.7
  (package
    (name "rust-rayon-core")
    (version "1.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rayon-core" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ac55kpnh2390ah7r071vnjbiy308qpznql0n597x5dgxx39pa08"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-crossbeam-deque" ,rust-crossbeam-deque-0.7)
        ("rust-crossbeam-queue" ,rust-crossbeam-queue-0.2)
        ("rust-crossbeam-utils" ,rust-crossbeam-utils-0.7)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-num-cpus" ,rust-num-cpus-1.10))
       #:cargo-development-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-rand" ,rust-rand-0.7)
        ("rust-rand-xorshift" ,rust-rand-xorshift-0.2)
        ("rust-scoped-tls" ,rust-scoped-tls-1.0))))
    (home-page "https://github.com/rayon-rs/rayon")
    (synopsis "Core APIs for Rayon")
    (description "Core APIs for Rayon.")
    (license (list license:expat license:asl2.0))))

(define-public rust-rayon-core-1.5
  (package
    (inherit rust-rayon-core-1.7)
    (name "rust-rayon-core")
    (version "1.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rayon-core" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ljva6blaf1wmzvg77h1i9pd0hsmsbbcmdk7sjbw7h2s8gw0vgpb"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-crossbeam-deque" ,rust-crossbeam-deque-0.7)
        ("rust-crossbeam-queue" ,rust-crossbeam-queue-0.1)
        ("rust-crossbeam-utils" ,rust-crossbeam-utils-0.6)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-num-cpus" ,rust-num-cpus-1.10))
       #:cargo-development-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-rand" ,rust-rand-0.4)
        ("rust-rand-xorshift" ,rust-rand-xorshift-0.2)
        ("rust-scoped-tls" ,rust-scoped-tls-1.0))))))

(define-public rust-rctree-0.3
  (package
    (name "rust-rctree")
    (version "0.3.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rctree" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1a54z2b850albiqx9vw009p9xg363vqzh1ybkwb89zn8375jk7my"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/RazrFalcon/rctree")
    (synopsis "DOM-like tree implemented using reference counting")
    (description "This package provides a @code{DOM-like} tree implemented using
reference counting.")
    (license license:expat)))

(define-public rust-rdrand-0.4
  (package
    (name "rust-rdrand")
    (version "0.4.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rdrand" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1cjq0kwx1bk7jx3kzyciiish5gqsj7620dm43dc52sr8fzmm9037"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-rand-core" ,rust-rand-core-0.3))))
    (home-page "https://github.com/nagisa/rust_rdrand/")
    (synopsis "Random number generator")
    (description
     "This package is an implementation of random number generator based on
@code{rdrand} and @code{rdseed} instructions")
    (license license:isc)))

(define-public rust-read-color-1.0
  (package
    (name "rust-read-color")
    (version "1.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "read_color" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1np0pk31ak7hni4hri3m75mbf8py1wdfjshmrj5krbd4p9c8hk4z"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
      "https://github.com/pistondevelopers/read_color")
    (synopsis
      "A simple library for reading hex colors")
    (description
      "This package provides a simple library for reading hex colors")
    (license (list license:expat license:asl2.0))))

(define-public rust-recycler-0.1
  (package
    (name "rust-recycler")
    (version "0.1.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "recycler" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1yll0sqswy6afk9ik7r22djqafa3wfgvgdzqqh7jbczyiqr2gp4q"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/frankmcsherry/recycler")
    (synopsis "Rust library for recycling types containing owned memory")
    (description
     "This package provides a small Rust library for recycling types containing
owned memory.")
    (license license:expat)))

;; This package requires features which are unavailable
;; on the stable releases of Rust.
(define-public rust-redox-syscall-0.1
  (package
    (name "rust-redox-syscall")
    (version "0.1.56")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "redox_syscall" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "110y7dyfm2vci4x5vk7gr0q551dvp31npl99fnsx2fb17wzwcf94"))))
    (build-system cargo-build-system)
    (arguments '(#:skip-build? #t))
    (home-page "https://gitlab.redox-os.org/redox-os/syscall")
    (synopsis "Rust library to access raw Redox system calls")
    (description "This package provides a Rust library to access raw Redox
system calls.")
    (license license:expat)))

(define-public rust-redox-termios-0.1
  (package
    (name "rust-redox-termios")
    (version "0.1.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "redox-termios" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0xhgvdh62mymgdl3jqrngl8hr4i8xwpnbsxnldq0l47993z1r2by"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-redox-syscall" ,rust-redox-syscall-0.1))))
    (home-page "https://github.com/redox-os/termios")
    (synopsis "Rust library to access Redox termios functions")
    (description
     "This package provides a Rust library to access Redox termios functions.")
    (license license:expat)))

(define-public rust-redox-users-0.3
  (package
    (name "rust-redox-users")
    (version "0.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "redox_users" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0cbl5w16l3bqm22i4vszclf6hzpljxicghmllw7j13az4s9k1ch9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-getrandom" ,rust-getrandom-0.1)
        ("rust-redox-syscall" ,rust-redox-syscall-0.1)
        ("rust-rust-argon2" ,rust-rust-argon2-0.7))))
    (home-page "https://gitlab.redox-os.org/redox-os/users")
    (synopsis "Access Redox users and groups")
    (description
     "This package provides a Rust library to access Redox users and groups
functionality.")
    (license license:expat)))

(define-public rust-ref-cast-1.0
  (package
    (name "rust-ref-cast")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ref-cast" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1vy378bdzb4kcz13kh96c5n5qw1jinhfrya5j4bf9rxz65x1jzq7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-ref-cast-impl" ,rust-ref-cast-impl-1.0))
       #:cargo-development-inputs
       (("rust-rustversion" ,rust-rustversion-1.0)
        ("rust-trybuild" ,rust-trybuild-1.0))))
    (home-page "https://github.com/dtolnay/ref-cast")
    (synopsis "Safely cast &T to &U")
    (description
     "Safely cast &T to &U where the struct U contains a single field of type T.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ref-cast-0.2
  (package
    (name "rust-ref-cast")
    (version "0.2.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ref-cast" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1fcbpfb7xhr992qvyfg9hr5p63xqykjp48pm3f7a1q21vmhzksvv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-ref-cast-impl" ,rust-ref-cast-impl-0.2))
       #:cargo-development-inputs
       (("rust-rustversion" ,rust-rustversion-0.1)
        ("rust-trybuild" ,rust-trybuild-1.0))))
    (home-page "https://github.com/dtolnay/ref-cast")
    (synopsis "Safely cast &T to &U")
    (description
     "Safely cast &T to &U where the struct U contains a single field of type T.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-ref-cast-impl-1.0
  (package
    (name "rust-ref-cast-impl")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ref-cast-impl" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "07rc752npmkyc5b8xcqk2ydbl3gxi1n4fzrq0wx9wz5qd4mvavn3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1.0)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-1.0))))
    (home-page "https://github.com/dtolnay/ref-cast")
    (synopsis "Derive implementation for @code{ref_cast::RefCast}")
    (description
     "Derive implementation for @code{ref_cast::RefCast}.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ref-cast-impl-0.2
  (package
    (inherit rust-ref-cast-impl-1.0)
    (name "rust-ref-cast-impl")
    (version "0.2.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ref-cast-impl" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0av43xxjlinfqklb67rpj217cmaxfjsf8151gs0hbs4hnr5664ck"))))))

(define-public rust-regex-1.3
  (package
    (name "rust-regex")
    (version "1.3.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "regex" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1cx4lcgy7vdi2kij2n1dp2whl33d7974g1kxwiklhs192nclcsbz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-aho-corasick" ,rust-aho-corasick-0.7)
        ("rust-memchr" ,rust-memchr-2.3)
        ("rust-regex-syntax" ,rust-regex-syntax-0.6)
        ("rust-thread-local" ,rust-thread-local-1.0))
       #:cargo-development-inputs
       (("rust-doc-comment" ,rust-doc-comment-0.3)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-quickcheck" ,rust-quickcheck-0.8)
        ("rust-rand" ,rust-rand-0.6))))
    (home-page "https://github.com/rust-lang/regex")
    (synopsis "Regular expressions for Rust")
    (description
     "An implementation of regular expressions for Rust.  This implementation
uses finite automata and guarantees linear time matching on all inputs.")
    (license (list license:expat license:asl2.0))))

(define-public rust-regex-1.1
  (package
    (inherit rust-regex-1.3)
    (name "rust-regex")
    (version "1.1.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "regex" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ba47ivq8l1yikiwikjnq5barag6iqfgcpxlz2263fqbq9y2kn6r"))))
    (arguments
     `(#:cargo-inputs
       (("rust-aho-corasick" ,rust-aho-corasick-0.7)
        ("rust-memchr" ,rust-memchr-2.2)
        ("rust-regex-syntax" ,rust-regex-syntax-0.6)
        ("rust-thread-local" ,rust-thread-local-0.3)
        ("rust-utf8-ranges" ,rust-utf8-ranges-1.0))
       #:cargo-development-inputs
       (("rust-doc-comment" ,rust-doc-comment-0.3)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-quickcheck" ,rust-quickcheck-0.8)
        ("rust-rand" ,rust-rand-0.6))))))

(define-public rust-regex-0.2
  (package
    (inherit rust-regex-1.3)
    (name "rust-regex")
    (version "0.2.11")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "regex" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1163ir1k5zjspirfjl4wqbviwrxlhmfwy95xxb69y4irkv4snack"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-aho-corasick" ,rust-aho-corasick-0.6)
        ("rust-memchr" ,rust-memchr-2.2)
        ("rust-regex-syntax" ,rust-regex-syntax-0.5)
        ("rust-thread-local" ,rust-thread-local-0.3)
        ("rust-utf8-ranges" ,rust-utf8-ranges-1.0))
       #:cargo-development-inputs
       (("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-quickcheck" ,rust-quickcheck-0.6)
        ("rust-rand" ,rust-rand-0.4))))))

(define-public rust-regex-0.1
  (package
    (inherit rust-regex-0.2)
    (name "rust-regex")
    (version "0.1.80")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "regex" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0bs036h3vzc6pj5jj4vc909s9rppq7b808ic99qn0y6gm3karm2g"))))
    (arguments
     `(#:skip-build? #t     ; Can't find dependent crates.
       #:cargo-inputs
       (("rust-aho-corasick" ,rust-aho-corasick-0.5)
        ("rust-memchr" ,rust-memchr-0.1)
        ("rust-regex-syntax" ,rust-regex-syntax-0.3)
        ("rust-simd" ,rust-simd-0.2) ; 0.1?
        ("rust-thread-local" ,rust-thread-local-0.2)
        ("rust-utf8-ranges" ,rust-utf8-ranges-0.1))
       #:cargo-development-inputs
       (("rust-lazy-static" ,rust-lazy-static-0.1)
        ("rust-quickcheck" ,rust-quickcheck-0.2)
        ("rust-rand" ,rust-rand-0.3))))))

(define-public rust-regex-automata-0.1
  (package
    (name "rust-regex-automata")
    (version "0.1.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "regex-automata" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1r3aqa9c0s9sfrmd2w0mli16ldjzbar0rzb1x7srfjkasrqys7df"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-fst" ,rust-fst-0.4)
        ("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-regex-syntax" ,rust-regex-syntax-0.6))
       #:cargo-development-inputs
       (("rust-bstr" ,rust-bstr-0.2)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-regex" ,rust-regex-1.1)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-bytes" ,rust-serde-bytes-0.11)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-toml" ,rust-toml-0.5)))) ; 0.4
    (home-page "https://github.com/BurntSushi/regex-automata")
    (synopsis
     "Automata construction and matching using regular expressions")
    (description
     "Automata construction and matching using regular expressions.")
    (license (list license:expat license:unlicense))))

(define-public rust-regex-syntax-0.6
  (package
    (name "rust-regex-syntax")
    (version "0.6.17")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "regex-syntax" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1blmlgzcg7in3kcxqabpfzzrbnamr2i671flbrmlqhfps5bvvrbz"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/rust-lang/regex")
    (synopsis "Regular expression parser")
    (description
     "This package provides a regular expression parser.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-regex-syntax-0.5
  (package
    (inherit rust-regex-syntax-0.6)
    (name "rust-regex-syntax")
    (version "0.5.6")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "regex-syntax" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "19zp25jr3dhmclg3qqjk3bh1yrn7bqi05zgr5v52szv3l97plw3x"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-ucd-util" ,rust-ucd-util-0.1))))))

(define-public rust-regex-syntax-0.3
  (package
    (inherit rust-regex-syntax-0.6)
    (name "rust-regex-syntax")
    (version "0.3.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "regex-syntax" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ms9hgdhhsxw9w920i7gipydvagf100bb56jbs192rz86ln01v7r"))))
    (arguments
     `(#:cargo-development-inputs
       (("rust-quickcheck" ,rust-quickcheck-0.2)
        ("rust-rand" ,rust-rand-0.3))))))

(define-public rust-remove-dir-all-0.5
  (package
    (name "rust-remove-dir-all")
    (version "0.5.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "remove_dir_all" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0bkrlyg26mgizpiy1yb2hhpgscxcag8r5fnckqsvk25608vzm0sa"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-winapi" ,rust-winapi-0.3))
       #:cargo-development-inputs
       (("rust-doc-comment" ,rust-doc-comment-0.3))))
    (home-page "https://github.com/XAMPPRocky/remove_dir_all")
    (synopsis "Implementation of remove_dir_all for Windows")
    (description
     "This package provides a safe, reliable implementation of
@code{remove_dir_all} for Windows")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-reopen-0.3
  (package
    (name "rust-reopen")
    (version "0.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "reopen" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "12b3mfxkwb8akdfa701nzvqr6lsc6n84vrq088gmjy8lxlmr4an6"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build? #t
        #:cargo-inputs
        (("rust-signal-hook" ,rust-signal-hook-0.1)
         ("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/vorner/reopen")
    (synopsis "File reopening utility")
    (description "File reopening utility.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-resolv-conf-0.6
  (package
    (name "rust-resolv-conf")
    (version "0.6.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "resolv-conf" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1jvdsmksdf6yiipm3aqahyv8n1cjd7wqc8sa0p0gzsax3fmb8qxj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-quick-error" ,rust-quick-error-1.2)
        ("rust-hostname", rust-hostname-0.1))))
    (home-page "https://github.com/tailhook/resolv-conf")
    (synopsis "Parser for /etc/resolv.conf")
    (description
     "An /etc/resolv.conf parser crate for Rust.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-ron-0.4
  (package
    (name "rust-ron")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ron" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1mrqdgw3w0yypg24jyq9mphp4zr9lr0ks7yam82m4n34x6njijyr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-base64" ,rust-base64-0.10)
        ("rust-bitflags" ,rust-bitflags-1)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-serde-bytes" ,rust-serde-bytes-0.11)
        ("rust-serde-json" ,rust-serde-json-1.0))))
    (home-page "https://github.com/ron-rs/ron")
    (synopsis "Rusty Object Notation")
    (description "Rusty Object Notation.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-rust-argon2-0.7
  (package
    (name "rust-rust-argon2")
    (version "0.7.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rust-argon2" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "05xh5wfxgzq3b6jys8r34f3hmqqfs8ylvf934n9z87wfv95szj1b"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-constant-time-eq" ,rust-constant-time-eq-0.1)
        ("rust-base64" ,rust-base64-0.11)
        ("rust-blake2b-simd" ,rust-blake2b-simd-0.5)
        ("rust-crossbeam-utils" ,rust-crossbeam-utils-0.7))))
    (home-page "https://github.com/sru-systems/rust-argon2")
    (synopsis
     "Rust implementation of the Argon2 password hashing function")
    (description
     "This package provides a Rust implementation of the Argon2 password
hashing function.")
    (license (list license:expat license:asl2.0))))

(define-public rust-rust-argon2-0.5
  (package
    (name "rust-rust-argon2")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rust-argon2" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1krjkmyfn37hy7sfs6lqia0fsvw130nn1z2850glsjcva7pym92c"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-base64" ,rust-base64-0.10)
        ("rust-blake2b-simd" ,rust-blake2b-simd-0.5)
        ("rust-crossbeam-utils" ,rust-crossbeam-utils-0.6))
       #:cargo-development-inputs
       (("rust-hex" ,rust-hex-0.3))))
    (home-page "https://github.com/sru-systems/rust-argon2")
    (synopsis "Rust implementation of the Argon2 password hashing function")
    (description "This package contains a rust implementation of the Argon2
password hashing function.")
    (license (list license:expat license:asl2.0))))

(define-public rust-rust-hawktracer-0.7
  (package
    (name "rust-rust-hawktracer")
    (version "0.7.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rust_hawktracer" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1h9an3b73pmhhpzc2kk93nh93lplkvsffysj0rp6rxi7p4lhlj73"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-rust-hawktracer-normal-macro"
         ,rust-rust-hawktracer-normal-macro-0.4)
        ("rust-rust-hawktracer-proc-macro"
         ,rust-rust-hawktracer-proc-macro-0.4))))
    (home-page "https://github.com/AlexEne/rust_hawktracer")
    (synopsis "Rust bindings for hawktracer profiling library")
    (description
     "Rust bindings for hawktracer profiling library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-rust-hawktracer-proc-macro-0.4
  (package
    (name "rust-rust-hawktracer-proc-macro")
    (version "0.4.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rust_hawktracer_proc_macro" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1qfksscfv8rbbzv2zb0i9sbbqmig0dr0vrma3c1kzsfmpsynlqnb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-rust-hawktracer-sys" ,rust-rust-hawktracer-sys-0.4))))
    (home-page "https://github.com/AlexEne/rust_hawktracer_proc_macro")
    (synopsis
     "Helper crate for hawktracer profiling library")
    (description
     "This package is a helper crate for hawktracer profiling library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-rust-hawktracer-normal-macro-0.4
  (package
    (name "rust-rust-hawktracer-normal-macro")
    (version "0.4.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri
               "rust_hawktracer_normal_macro"
               version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1sfjmipdbb5s498c150czr6wihjlkwwgla2jyg3cs7cyjich0mwa"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-rust-hawktracer-sys" ,rust-rust-hawktracer-sys-0.4))))
    (home-page "https://github.com/AlexEne/rust_hawktracer_normal_macro")
    (synopsis "Helper crate for hawktracer profiling library")
    (description
     "This package provides a helper crate for hawktracer profiling library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-rust-hawktracer-sys-0.4
  (package
    (name "rust-rust-hawktracer-sys")
    (version "0.4.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rust_hawktracer_sys" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "15acrj881y2g7cwsgf1nr22cixrknp8m4x08dkx1an6zf4q8bk37"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-cmake" ,rust-cmake-0.1)
        ("rust-pkg-config" ,rust-pkg-config-0.3)
        ("rust-bindgen" ,rust-bindgen-0.37)
        ("rust-itertools" ,rust-itertools-0.8))))
    (home-page "https://github.com/AlexEne/rust_hawktracer_sys")
    (synopsis
     "Sys crate for the rust_hawktracer library")
    (description
     "This package provides a sys crate for the rust_hawktracer library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-rustc-demangle-0.1
  (package
    (name "rust-rustc-demangle")
    (version "0.1.16")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rustc-demangle" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "10qp42sl1wrdbgbbh8rnay2grm976z7hqgz32c4y09l1c071qsac"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
        ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1.0))))
    (home-page "https://github.com/alexcrichton/rustc-demangle")
    (synopsis "Rust compiler symbol demangling")
    (description
     "This package demanges the symbols from the Rust compiler.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-rustc-hash-1.1
  (package
    (name "rust-rustc-hash")
    (version "1.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rustc-hash" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1qkc5khrmv5pqi5l5ca9p5nl5hs742cagrndhbrlk3dhlrx3zm08"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
      "https://github.com/rust-lang-nursery/rustc-hash")
    (synopsis
      "speed, non-cryptographic hash used in rustc")
    (description
      "speed, non-cryptographic hash used in rustc")
    (license (list license:asl2.0 license:expat))))

(define-public rust-rustc-hash-1.0
  (package
    (name "rust-rustc-hash")
    (version "1.0.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rustc-hash" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1f4cnbcmz2c3zjidqszc9c4fip37ch4xl74nkkp9dw291j5zqh3m"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1.3))))
    (home-page "https://github.com/rust-lang/rustc-hash")
    (synopsis "Speedy, non-cryptographic hash used in rustc")
    (description
     "This package provides a speedy, non-cryptographic hash used in rustc.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-rustc-serialize-0.3
  (package
    (name "rust-rustc-serialize")
    (version "0.3.24")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rustc-serialize" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1nkg3vasg7nk80ffkazizgiyv3hb1l9g3d8h17cajbkx538jiwfw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-rand" ,rust-rand-0.3))))
    (home-page "https://github.com/rust-lang-deprecated/rustc-serialize")
    (synopsis "Generic serialization/deserialization support")
    (description
     "This package provides generic serialization/deserialization support
corresponding to the @code{derive(RustcEncodable, RustcDecodable)} mode in the
compiler.  Also includes support for hex, base64, and json encoding and
decoding.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-rustc-std-workspace-alloc-1.0
  (package
    (name "rust-rustc-std-workspace-alloc")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustc-std-workspace-alloc" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "11psmqk6glglxl3zwh8slz6iynfxaifh4spd2wcnws552dqdarpz"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://crates.io/crates/rustc-std-workspace-alloc")
    (synopsis "Rust workspace hack")
    (description "This package is a Rust workspace hack.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-rustc-std-workspace-core-1.0
  (package
    (name "rust-rustc-std-workspace-core")
    (version "1.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rustc-std-workspace-core" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1309xhwyai9xpz128xrfjqkmnkvgjwddznmj7brbd8i8f58zamhr"))))
    (build-system cargo-build-system)
    (arguments '(#:skip-build? #t))
    (home-page "https://crates.io/crates/rustc-std-workspace-core")
    (synopsis "Explicitly empty crate for rust-lang/rust integration")
    (description "This crate provides an explicitly empty crate for
rust-lang/rust integration.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-rustc-std-workspace-std-1.0
  (package
    (name "rust-rustc-std-workspace-std")
    (version "1.0.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rustc-std-workspace-std" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1vq4vaclamwhk0alf4f7wq3i9wxa993sxpmhy6qfaimy1ai7d9mb"))))
    (build-system cargo-build-system)
    (arguments '(#:skip-build? #t))
    (home-page "https://crates.io/crates/rustc-std-workspace-std")
    (synopsis "Workaround for rustbuild")
    (description "This package provides a workaround for rustbuild.")
    (license (list license:expat license:asl2.0))))

(define-public rust-rustc-test-0.3
  (package
    (name "rust-rustc-test")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustc-test" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0a27mlcg0ck0hgsdvwk792x9z1k1qq1wj091f1l5yggbdbcsnx5w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-getopts" ,rust-getopts-0.2)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-rustc-serialize" ,rust-rustc-serialize-0.3)
        ("rust-term" ,rust-term-0.4)
        ("rust-time" ,rust-time-0.1)
        ("rust-rustc-version" ,rust-rustc-version-0.2))))
    (home-page "https://github.com/servo/rustc-test")
    (synopsis "Fork of Rust's test crate")
    (description
     "This package provides a fork of Rust's test crate that doesn't
require unstable language features.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-rustc-tools-util-0.2
  (package
    (name "rust-rustc-tools-util")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustc_tools_util" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1vj4ymv29igs7n52m12k138zbsn5k5d7ya4sys6lig7sx7ddl9dp"))))
    (build-system cargo-build-system)
    (arguments '(#:skip-build? #t))
    (home-page
     "https://github.com/rust-lang/rust-clippy")
    (synopsis
     "small helper to generate version information for git packages")
    (description
     "small helper to generate version information for git packages")
    (license (list license:expat license:asl2.0))))

(define-public rust-rustc-version-0.2
  (package
    (name "rust-rustc-version")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustc_version" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "02h3x57lcr8l2pm0a645s9whdh33pn5cnrwvn5cb57vcrc53x3hk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-semver" ,rust-semver-0.9))))
    (home-page "https://github.com/Kimundi/rustc-version-rs")
    (synopsis
     "Library for querying the version of a installed rustc compiler")
    (description
     "This package provides a library for querying the version of a installed
rustc compiler.")
    (license (list license:expat license:asl2.0))))

(define-public rust-rustdoc-stripper-0.1
  (package
    (name "rust-rustdoc-stripper")
    (version "0.1.9")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rustdoc-stripper" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "13rf65a0xk1zyb92jd8p12x529rsbfchwk9zvjr0snr9savpxw19"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-tempfile" ,rust-tempfile-3.1))))
    (home-page "https://github.com/GuillaumeGomez/rustdoc-stripper")
    (synopsis "Nanipulate rustdoc comments")
    (description
     "This package provides a tool to manipulate rustdoc comments.")
    (license license:asl2.0)))

(define-public rust-rustfix-0.4
  (package
    (name "rust-rustfix")
    (version "0.4.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustfix" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "01zn0ysnass3mmrhxk90584y713vjfq1x97mi4saac99g9vsql3i"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-failure" ,rust-failure-0.1)
        ("rust-log" ,rust-log-0.4)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-json" ,rust-serde-json-1.0))
       #:cargo-development-inputs
       (("rust-difference" ,rust-difference-2.0)
        ("rust-duct" ,rust-duct-0.13)
        ("rust-env-logger" ,rust-env-logger-0.6)
        ("rust-log" ,rust-log-0.4)
        ("rust-proptest" ,rust-proptest-0.9)
        ("rust-tempdir" ,rust-tempdir-0.3))))
    (home-page "https://github.com/rust-lang/rustfix")
    (synopsis "Automatically apply the suggestions made by rustc")
    (description
     "Automatically apply the suggestions made by rustc.")
    (license (list license:expat license:asl2.0))))

(define-public rust-rusttype-0.8
  (package
    (name "rust-rusttype")
    (version "0.8.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rusttype" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "12hwfg85iii7sbgsyyr23yw862dzp7f8zwn9xv5iqydm5w1i3a8l"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f      ; Artifacts for tests not included.
       #:cargo-inputs
       (("rust-approx" ,rust-approx-0.3)
        ("rust-arrayvec" ,rust-arrayvec-0.5)
        ("rust-crossbeam-deque" ,rust-crossbeam-deque-0.7)
        ("rust-crossbeam-utils" ,rust-crossbeam-utils-0.7)
        ("rust-libm" ,rust-libm-0.2)
        ("rust-linked-hash-map" ,rust-linked-hash-map-0.5)
        ("rust-num-cpus" ,rust-num-cpus-1.11)
        ("rust-ordered-float" ,rust-ordered-float-1.0)
        ("rust-rustc-hash" ,rust-rustc-hash-1.0)
        ("rust-stb-truetype" ,rust-stb-truetype-0.3))))
    (home-page "https://gitlab.redox-os.org/redox-os/rusttype")
    (synopsis "Pure Rust alternative to libraries like FreeType")
    (description
     "This package provides a pure Rust alternative to libraries like FreeType.
RustType provides an API for loading, querying and rasterising TrueType fonts.
It also provides an implementation of a dynamic GPU glyph cache for hardware
font rendering.")
    (license (list license:expat license:asl2.0))))

(define-public rust-rusttype-0.7
  (package
    (inherit rust-rusttype-0.8)
    (name "rust-rusttype")
    (version "0.7.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rusttype" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1m9ms4p94cgif74y1rzkj04rx8i1la193c0jgvnip61rd904429i"))))
    (arguments
     `(#:tests? #f      ; Artifacts for tests not included.
       #:cargo-inputs
       (("rust-rusttype" ,rust-rusttype-0.8))
       #:cargo-development-inputs
       (("rust-arrayvec" ,rust-arrayvec-0.4)
        ("rust-blake2" ,rust-blake2-0.8)
        ("rust-glium" ,rust-glium-0.25)
        ("rust-image" ,rust-image-0.21)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-unicode-normalization" ,rust-unicode-normalization-0.1))))))

(define-public rust-rustversion-1.0
  (package
    (name "rust-rustversion")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustversion" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1xkr1g792w728py2qpg2zj0vfviv2xzmxkkd9w6035l9d5ss3fxk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1.0)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-1.0))))
    (home-page "https://github.com/dtolnay/rustversion")
    (synopsis "Conditional compilation according to rustc compiler version")
    (description
     "This package provides conditional compilation according to the
@code{rustc} compiler version.")
    (license (list license:expat license:asl2.0))))

(define-public rust-rustversion-0.1
  (package
    (name "rust-rustversion")
    (version "0.1.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rustversion" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1s3ib2paa5gq17x4qsmjmnsw68z7b5d5av1wsiqcrihmqb7kk0dl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1.0)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-1.0))))
    (home-page "https://github.com/dtolnay/rustversion")
    (synopsis "Conditional compilation according to rustc compiler version")
    (description "This package provides conditional compilation according to
rustc compiler version.")
    (license (list license:expat license:asl2.0))))

(define-public rust-rusty-fork-0.2
  (package
    (name "rust-rusty-fork")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rusty-fork" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1bjg8adk0i921088j52rn0hmvsry34q19g96x41pamqcw5j35n9x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-fnv" ,rust-fnv-1.0)
        ("rust-quick-error" ,rust-quick-error-1.2)
        ("rust-tempfile" ,rust-tempfile-3.0)
        ("rust-wait-timeout" ,rust-wait-timeout-0.2))))
    (home-page "https://github.com/altsysrq/rusty-fork")
    (synopsis "Library for running Rust tests in sub-processes")
    (description
     "Cross-platform library for running Rust tests in sub-processes
using a fork-like interface.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-ryu-1.0
  (package
    (name "rust-ryu")
    (version "1.0.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "ryu" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0xlx9ybzncrb7d6r9533g8ydlg6mr252pfzl4g9cqaqkpvk24mjk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-no-panic" ,rust-no-panic-0.1))
       #:cargo-development-inputs
       (("rust-num-cpus" ,rust-num-cpus-1.11)
        ("rust-rand" ,rust-rand-0.7)
        ("rust-rand-xorshift" ,rust-rand-xorshift-0.2))))
    (home-page "https://github.com/dtolnay/ryu")
    (synopsis "Fast floating point to string conversion")
    (description
     "This package provides a pure Rust implementation of Ryū, an algorithm to
quickly convert floating point numbers to decimal strings.")
    (license (list license:asl2.0 license:boost1.0))))

(define-public rust-safemem-0.3
  (package
    (name "rust-safemem")
    (version "0.3.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "safemem" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0wp0d2b2284lw11xhybhaszsczpbq1jbdklkxgifldcknmy3nw7g"))))
    (build-system cargo-build-system)
    (arguments '(#:skip-build? #t))
    (home-page "https://github.com/abonander/safemem")
    (synopsis "Safe wrappers for memory-accessing functions")
    (description
     "Safe wrappers for memory-accessing functions, like @code{std::ptr::copy()}.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-same-file-1.0
  (package
    (name "rust-same-file")
    (version "1.0.6")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "same-file" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "00h5j1w87dmhnvbv9l8bic3y7xxsnjmssvifw2ayvgx9mb1ivz4k"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-winapi-util" ,rust-winapi-util-0.1))
       #:cargo-development-inputs
       (("rust-doc-comment" ,rust-doc-comment-0.3))))
    (home-page "https://github.com/BurntSushi/same-file")
    (synopsis "Determine whether two file paths point to the same file")
    (description
     "This package provides a simple crate for determining whether two file
paths point to the same file.")
    (license (list license:unlicense
                   license:expat))))

(define-public rust-same-file-0.1
  (package
    (inherit rust-same-file-1.0)
    (name "rust-same-file")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "same-file" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "19qpl6j8s3ph9jm8rh1k0wp2nkyw5ah34xly00vqcfx4v97s8cfr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-kernel32-sys" ,rust-kernel32-sys-0.2)
        ("rust-winapi" ,rust-winapi-0.2))
       #:cargo-development-inputs
       (("rust-rand" ,rust-rand-0.3))))))

(define-public rust-scan-fmt-0.2
  (package
    (name "rust-scan-fmt")
    (version "0.2.5")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "scan_fmt" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1gmaa07z8bkkdv5xhq2lrgml6ri7fqyyrjpiks3phmpmq3p8d0i4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-regex" ,rust-regex-1.3))))
    (home-page "https://github.com/wlentz/scan_fmt")
    (synopsis "Simple scanf()-like input for Rust")
    (description
     "This package provides a simple scanf()-like input for Rust")
    (license license:expat)))

(define-public rust-schannel-0.1
  (package
    (name "rust-schannel")
    (version "0.1.16")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "schannel" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "08d0p5iy574vdrax4l3laazic0crj7rp7vp3if5rrfkcdfq51xc7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/steffengy/schannel-rs")
    (synopsis "Rust bindings to the Windows SChannel APIs")
    (description
     "Rust bindings to the Windows SChannel APIs providing TLS client and
server functionality.")
    (license license:expat)))

(define-public rust-scoped-threadpool-0.1
  (package
    (name "rust-scoped-threadpool")
    (version "0.1.9")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "scoped_threadpool" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1a26d3lk40s9mrf4imhbik7caahmw2jryhhb6vqv6fplbbgzal8x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-development-inputs
       (("rust-lazy-static" ,rust-lazy-static-1))))
    (home-page "https://github.com/Kimundi/scoped-threadpool-rs")
    (synopsis "Library for scoped and cached threadpools")
    (description
     "This crate provides a stable, safe and scoped threadpool.  It can be used
to execute a number of short-lived jobs in parallel without the need to respawn
the underlying threads.  Jobs are runnable by borrowing the pool for a given
scope, during which an arbitrary number of them can be executed.  These jobs can
access data of any lifetime outside of the pools scope, which allows working on
non-'static references in parallel.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-scoped-tls-1.0
  (package
    (name "rust-scoped-tls")
    (version "1.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "scoped-tls" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1hj8lifzvivdb1z02lfnzkshpvk85nkgzxsy2hc0zky9wf894spa"))))
    (build-system cargo-build-system)
    (arguments '(#:skip-build? #t))
    (home-page "https://github.com/alexcrichton/scoped-tls")
    (synopsis "Rust library providing the old standard library's scoped_thread_local")
    (description "This crate provides a library implementation of the standard
library's old @code{scoped_thread_local!} macro for providing scoped access to
@dfn{thread local storage} (TLS) so any type can be stored into TLS.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-scoped-tls-0.1
  (package
    (inherit rust-scoped-tls-1.0)
    (name "rust-scoped-tls")
    (version "0.1.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "scoped-tls" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0a2bn9d2mb07c6l16sadijy4p540g498zddfxyiq4rsqpwrglbrk"))))))

(define-public rust-scopeguard-1.0
  (package
    (name "rust-scopeguard")
    (version "1.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "scopeguard" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "03aay84r1f6w87ckbpj6cc4rnsxkxcfs13n5ynxjia0qkgjiabml"))))
    (build-system cargo-build-system)
    (arguments '(#:skip-build? #t))
    (home-page "https://github.com/bluss/scopeguard")
    (synopsis "Scope guard which will run a closure even out of scope")
    (description "This package provides a RAII scope guard that will run a
given closure when it goes out of scope, even if the code between panics
(assuming unwinding panic).  Defines the macros @code{defer!},
@code{defer_on_unwind!}, @code{defer_on_success!} as shorthands for guards
with one of the implemented strategies.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-scopeguard-0.3
  (package
    (inherit rust-scopeguard-1.0)
    (name "rust-scopeguard")
    (version "0.3.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "scopeguard" version))
        (file-name
          (string-append name "-" version ".crate"))
        (sha256
         (base32
          "09sy9wbqp409pkwmqni40qmwa99ldqpl48pp95m1xw8sc19qy9cl"))))))

(define-public rust-scroll-0.10
  (package
    (name "rust-scroll")
    (version "0.10.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "scroll" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1cbcns8538sqmfnmdbphqy0fd4j8z75z802pvmz3zlwmnln37cmb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-scroll-derive" ,rust-scroll-derive-0.10))))
    (home-page "https://github.com/m4b/scroll")
    (synopsis "Endian-aware Read/Write traits for byte buffers")
    (description
     "This package provides a suite of powerful, extensible, generic,
endian-aware Read/Write traits for byte buffers.")
    (license license:expat)))

(define-public rust-scroll-0.9
  (package
    (name "rust-scroll")
    (version "0.9.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "scroll" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "10q3w86bn22xrjlfg1c90dfi9c26qjkzn26nad0i9z8pxwad311g"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-scroll-derive" ,rust-scroll-derive-0.9)
        ("rust-rustc-version" ,rust-rustc-version-0.2))
       #:cargo-development-inputs
       (("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-rayon" ,rust-rayon-1.1))))
    (home-page "https://github.com/m4b/scroll")
    (synopsis "Read/Write traits for byte buffers")
    (description
     "This package provides a suite of powerful, extensible, generic,
endian-aware Read/Write traits for byte buffers.")
    (license license:expat)))

(define-public rust-scroll-derive-0.10
  (package
    (name "rust-scroll-derive")
    (version "0.10.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "scroll_derive" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0a7f0xybi27p1njs4bqmxh9zyb2dqal4dbvgnhjjix4zkgm4wn7q"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1.0)
        ("rust-syn" ,rust-syn-1.0)
        ("rust-quote" ,rust-quote-1.0))))
    (home-page "https://github.com/m4b/scroll")
    (synopsis "Pread and Pwrite traits from the scroll crate")
    (description
     "This package provides a macros 1.1 derive implementation for Pread and
Pwrite traits from the scroll crate.")
    (license license:expat)))

(define-public rust-scroll-derive-0.9
  (package
    (name "rust-scroll-derive")
    (version "0.9.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "scroll_derive" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1jqg5mm8nvii6avl1z1rc89agzh2kwkppgpsnwfakxg78mnaj6lg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-0.6)
        ("rust-syn" ,rust-syn-0.15))
       #:cargo-development-inputs
       (("rust-scroll" ,rust-scroll-0.9))))
    (home-page "https://github.com/m4b/scroll_derive")
    (synopsis "Derive Pread and Pwrite traits from the scroll crate")
    (description
     "This package provides a macros 1.1 derive implementation for Pread and
Pwrite traits from the scroll crate.")
    (license license:expat)))

(define-public rust-seahash-3.0
  (package
    (name "rust-seahash")
    (version "3.0.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "seahash" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0iqg12lxkn0ivsfa1gkylcwj5wmi6zl87mbizlrkg918s6hprxaq"))))
    (build-system cargo-build-system)
    (home-page
     "https://gitlab.redox-os.org/redox-os/seahash")
    (synopsis
     "Hash function with proven statistical guarantees")
    (description
     "This package provides a blazingly fast, portable hash function with
proven statistical guarantees.")
    (license license:expat)))

(define-public rust-security-framework-0.3
  (package
    (name "rust-security-framework")
    (version "0.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "security-framework" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1pqn79cl9njnnhsmjvvphkzx8is5jhfd8bhxpllgvrgggjfl5wlf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f      ; Some test files not included in release.
       #:cargo-inputs
       (("rust-core-foundation" ,rust-core-foundation-0.6)
        ("rust-core-foundation-sys" ,rust-core-foundation-sys-0.6)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-security-framework-sys" ,rust-security-framework-sys-0.3))
       #:cargo-development-inputs
       (("rust-hex" ,rust-hex-0.4)
        ("rust-tempdir" ,rust-tempdir-0.3))))
    (home-page "https://lib.rs/crates/security_framework")
    (synopsis
     "Security.framework bindings for macOS and iOS")
    (description
     "Security.framework bindings for macOS and iOS.")
    (license (list license:expat license:asl2.0))))

(define-public rust-security-framework-sys-0.3
  (package
    (name "rust-security-framework-sys")
    (version "0.3.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "security-framework-sys" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "15gqhhi206lzynd0pcbswxhvqc4p9bmpl2h9qnwfnpb16zy96573"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-core-foundation-sys" ,rust-core-foundation-sys-0.6))))
    (home-page "https://lib.rs/crates/security-framework-sys")
    (synopsis "Apple `Security.framework` low-level FFI bindings")
    (description
     "Apple @code{Security.framework} low-level FFI bindings.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-sema-0.1
  (package
    (name "rust-sema")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sema" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ckq33sg84785p195m54h03jcn7fai8w08hjnb94nzaakgzibbz3"))
        (modules '((guix build utils)))
        (snippet
         '(begin (substitute* "Cargo.toml"
                   (("libc.*") "libc = \"0.2\"\n"))
                 #t))))
    (build-system cargo-build-system)
    (arguments
     `( #:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-rand" ,rust-rand-0.3)
        ("rust-time" ,rust-time-0.1))
       #:cargo-development-inputs
       (("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-nix" ,rust-nix-0.15))))
    (home-page "https://github.com/cpjreynolds/sema")
    (synopsis "Rust semaphore library")
    (description "Rust semaphore library.")
    (license license:expat)))

(define-public rust-semver-0.9
  (package
    (name "rust-semver")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "semver" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "00q4lkcj0rrgbhviv9sd4p6qmdsipkwkbra7rh11jrhq5kpvjzhx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-semver-parser" ,rust-semver-parser-0.7)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-crates-index" ,rust-crates-index-0.13)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-serde-json" ,rust-serde-json-1.0)
        ("rust-tempdir" ,rust-tempdir-0.3))))
    (home-page "https://docs.rs/crate/semver")
    (synopsis
     "Semantic version parsing and comparison")
    (description
     "Semantic version parsing and comparison.")
    (license (list license:expat license:asl2.0))))

(define-public rust-semver-parser-0.9
  (package
    (name "rust-semver-parser")
    (version "0.9.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "semver-parser" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1ahqhvgpzhcsd28id7xnrjv4419i9yyalhm7d7zi430qx0hi2vml"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/steveklabnik/semver-parser")
    (synopsis "Parsing of the semver spec")
    (description "This package provides for parsing of the semver spec.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-semver-parser-0.7
  (package
    (inherit rust-semver-parser-0.9)
    (name "rust-semver-parser")
    (version "0.7.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "semver-parser" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "18vhypw6zgccnrlm5ps1pwa0khz7ry927iznpr88b87cagr1v2iq"))))))

(define-public rust-serde-1.0
  (package
    (name "rust-serde")
    (version "1.0.105")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "serde" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1zrj157dxvmymp5ii60anap2qqks4pkr3fwsp71wi3sv4nzzn1z7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-serde-derive" ,rust-serde-derive-1.0))
       #:cargo-development-inputs
       (("rust-serde-derive" ,rust-serde-derive-1.0))))
    (home-page "https://serde.rs")
    (synopsis "Generic serialization/deserialization framework")
    (description
     "This package provides a generic serialization/deserialization framework.")
    (license (list license:expat license:asl2.0))))

(define-public rust-serde-0.9
  (package
    (inherit rust-serde-1.0)
    (name "rust-serde")
    (version "0.9.15")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1bsla8l5xr9pp5sirkal6mngxcq6q961km88jvf339j5ff8j7dil"))))
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-cargo-toml
           (lambda _
             (substitute* "Cargo.toml"
               ((", path =.*}") "}"))
             #t)))
       #:cargo-inputs
       (("rust-serde-derive" ,rust-serde-derive-0.9))
       #:cargo-development-inputs
       (("rust-serde-derive" ,rust-serde-derive-0.9))))))

(define-public rust-serde-0.8
  (package
    (inherit rust-serde-1.0)
    (name "rust-serde")
    (version "0.8.23")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1j4ajipn0sf4ya0crgcb94s848qp7mfc35n6d0q2rf8rk5skzbcx"))))
    (arguments
     `(#:cargo-development-inputs
       (("rust-clippy" ,rust-clippy-0.0))
       #:tests? #f))))

(define-public rust-serde-0.4
  (package
    (inherit rust-serde-0.9)
    (name "rust-serde")
    (version "0.4.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "06s2ayx1p5zzj4q7bfld60c9iprsk1256pnh8qj6h794mjinw11b"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-num" ,rust-num-0.2))))))

(define-public rust-serde-big-array-0.1
  (package
    (name "rust-serde-big-array")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde-big-array" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0gkyqxk760mp1lfcg6lhjk95ajc89nr0qdd0vl4ic0g8pyxcy9mr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0))
       #:cargo-development-inputs
       (("rust-serde-json" ,rust-serde-json-1.0))))
    (home-page "https://github.com/est31/serde-big-array")
    (synopsis "Big array helper for serde")
    (description "This package provides a big array helper for serde.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-serde-bytes-0.11
  (package
    (name "rust-serde-bytes")
    (version "0.11.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde_bytes" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1bl45kf3c71xclv7wzk5525nswm4bgsnjd3s1s15f4k2a8whfnij"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-bincode" ,rust-bincode-1.1)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-serde-test" ,rust-serde-test-1.0))))
    (home-page "https://github.com/serde-rs/bytes")
    (synopsis
     "Handle of integer arrays and vectors for Serde")
    (description
     "Optimized handling of @code{&[u8]} and @code{Vec<u8>} for Serde.")
    (license (list license:expat license:asl2.0))))

(define-public rust-serde-cbor-0.11
  (package
    (name "rust-serde-cbor")
    (version "0.11.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "serde-cbor" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "08m62mfqjnpa543kd9r9cyxlqc6y73avhsl3n8svgs4h5zxaq60y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-half" ,rust-half-1.3)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-serde-derive" ,rust-serde-derive-1.0))))
    (home-page "https://github.com/pyfisch/cbor")
    (synopsis "CBOR support for serde")
    (description "CBOR support for serde.")
    (license (list license:expat license:asl2.0))))

(define-public rust-serde-cbor-0.10
  (package
    (inherit rust-serde-cbor-0.11)
    (name "rust-serde-cbor")
    (version "0.10.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde_cbor" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0kyizacjabsa78p9f7qvj31zirpnsgsr4zpfv1p6lwpcb3biw27p"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-half" ,rust-half-1.3)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-serde-derive" ,rust-serde-derive-1.0))))))

(define-public rust-serde-codegen-0.4
  (package
    (name "rust-serde-codegen")
    (version "0.4.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde_codegen" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0167ghvqs0n8qin8fjx2ihn3gx92m55685qpv4nzihw48h4rq0vq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-aster" ,rust-aster-0.41)
        ("rust-quasi" ,rust-quasi-0.32)
        ("rust-quasi-macros" ,rust-quasi-macros-0.32)
        ("rust-syntex" ,rust-syntex-0.58)
        ("rust-syntex-syntax" ,rust-syntex-syntax-0.58))
       #:cargo-development-inputs
       (("rust-quasi-codegen" ,rust-quasi-codegen-0.32)
        ("rust-syntex" ,rust-syntex-0.58))))
    (home-page "https://serde.rs")
    (synopsis "Macros for the serde framework")
    (description "This package provides macros to auto-generate implementations
for the serde framework.")
    (license (list license:expat license:asl2.0))))

(define-public rust-serde-codegen-internals-0.14
  (package
    (name "rust-serde-codegen-internals")
    (version "0.14.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde_codegen_internals" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0004s3wlc85vi6hq62hq84cv5b6qbbin1n6hdaqj095xhg98p25w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-syn" ,rust-syn-0.11))))
    (home-page "https://serde.rs")
    (synopsis "AST representation used by Serde codegen")
    (description
     "Unstable AST representation used by Serde codegen.")
    (license (list license:expat license:asl2.0))))

(define-public rust-serde-derive-1.0
  (package
    (name "rust-serde-derive")
    (version "1.0.105")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "serde-derive" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1y5gzwpy8yjv9pwh1js11vr18nfz4gg1g2kmyr6p58hvavy00pdc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1.0)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-1.0))
       #:cargo-development-inputs
       (("rust-serde" ,rust-serde-1.0))))
    (home-page "https://serde.rs")
    (synopsis
      "Macros 1.1 implementation of #[derive(Serialize, Deserialize)]")
    (description
      "Macros 1.1 implementation of #[derive(Serialize, Deserialize)]")
    (license (list license:expat license:asl2.0))))

(define-public rust-serde-derive-0.9
  (package
    (inherit rust-serde-derive-1.0)
    (name "rust-serde-derive")
    (version "0.9.15")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde-derive" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1fkldf0lnl6pwxs00qpyp79m30qmfpi3bk0wm22211ylyikdi3wp"))))
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-cargo-toml
           (lambda _
             (substitute* "Cargo.toml"
               ((", path =.*}") "}"))
             #t)))
       #:cargo-inputs
       (("rust-quote" ,rust-quote-0.3)
        ("rust-serde-codegen-internals" ,rust-serde-codegen-internals-0.14)
        ("rust-syn" ,rust-syn-0.11))))))

(define-public rust-serde-json-1.0
  (package
    (name "rust-serde-json")
    (version "1.0.50")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "serde-json" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0rs8rsk59kgkgsrw8hyyjrlhas9k1by2jwxxqcz3c2bq2qna39vq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-indexmap" ,rust-indexmap-1.3)
        ("rust-itoa" ,rust-itoa-0.4)
        ("rust-ryu" ,rust-ryu-1.0)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (;("rust-automod" ,rust-automod-0.1)
        ("rust-rustversion" ,rust-rustversion-1.0)
        ("rust-serde-bytes" ,rust-serde-bytes-0.11)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ;("rust-serde-stacker" ,rust-serde-stacker-0.1)
        ("rust-trybuild" ,rust-trybuild-1.0))))
    (home-page "https://github.com/serde-rs/json")
    (synopsis "JSON serialization file format")
    (description
     "This package provides a JSON serialization file format.")
    (license (list license:expat license:asl2.0))))

(define-public rust-serde-json-0.9
  (package
    (inherit rust-serde-json-1.0)
    (name "rust-serde-json")
    (version "0.9.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde_json" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "188nbf56m7p6mnh3xd71rwqxd4g95lqh8gsl7mfy3lp7gd4cz2xd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-dtoa" ,rust-dtoa-0.4)
        ("rust-itoa" ,rust-itoa-0.3)
        ("rust-linked-hash-map" ,rust-linked-hash-map-0.4)
        ("rust-num-traits" ,rust-num-traits-0.1)
        ("rust-serde" ,rust-serde-0.9))
       #:cargo-development-inputs
       (("rust-serde-derive" ,rust-serde-derive-0.9))))))

(define-public rust-serde-macros-0.4
  (package
    (name "rust-serde-macros")
    (version "0.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde_macros" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1717rpncvvyvyrpb7hdjgxpiki9vdgygwv2r3d9aal5n8cm8xi8i"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-cargo-toml
           (lambda _
             (substitute* "Cargo.toml"
               ((", path =.*}") "}"))
             #t)))
       #:cargo-inputs
       (("rust-serde-codegen" ,rust-serde-codegen-0.4))
       #:cargo-development-inputs
       (("rust-num" ,rust-num-0.2)
        ("rust-rustc-serialize" ,rust-rustc-serialize-0.3)
        ("rust-serde" ,rust-serde-0.4))))
    (home-page "https://serde.rs")
    (synopsis
     "Macros to auto-generate implementations for the serde framework")
    (description
     "Macros to auto-generate implementations for the serde framework.")
    (license (list license:expat license:asl2.0))))

(define-public rust-serde-test-1.0
  (package
    (name "rust-serde-test")
    (version "1.0.105")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde_test" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1vnp0wld20z1wjr8qp2hxcy6yh2zhicg1mfb0qrzxgwq2a4n6raa"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0))))
    (home-page "https://serde.rs")
    (synopsis
     "Token De/Serializer for testing De/Serialize implementations")
    (description
     "Token De/Serializer for testing De/Serialize implementations.")
    (license (list license:expat license:asl2.0))))

(define-public rust-serde-test-0.9
  (package
    (inherit rust-serde-test-1.0)
    (name "rust-serde-test")
    (version "0.9.15")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde_test" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "193mf0qkhvjywd06x6hhmkixlqcyfbpfwfmr75dp2b8xwzpsvxwf"))))
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-cargo-toml
           (lambda _
             (substitute* "Cargo.toml"
               ((", path =.*}") "}"))
             #t)))
       #:cargo-inputs (("rust-serde" ,rust-serde-0.9))))))

(define-public rust-serde-test-0.8
  (package
    (inherit rust-serde-test-1.0)
    (name "rust-serde-test")
    (version "0.8.23")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde-test" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1m939j7cgs7i58r6vxf0ffp3nbr8advr8p9dqa9w8zk0z2yks2qi"))))
    (arguments
     `(#:cargo-inputs (("rust-serde" ,rust-serde-0.8))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-Cargo-toml
           (lambda _
             (substitute* "Cargo.toml"
               ((", path = \"../serde\"") ""))
             #t)))))))

(define-public rust-serde-yaml-0.8
  (package
    (name "rust-serde-yaml")
    (version "0.8.11")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde_yaml" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0d9wdjrlx9gxg80kzc6pvdwz5pwhja2n8n0bxja9vv61kzqif6v9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-dtoa" ,rust-dtoa-0.4)
        ("rust-linked-hash-map" ,rust-linked-hash-map-0.5)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-yaml-rust" ,rust-yaml-rust-0.4))
       #:cargo-development-inputs
       (("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-unindent" ,rust-unindent-0.1))))
    (home-page
     "https://github.com/dtolnay/serde-yaml")
    (synopsis "YAML support for Serde")
    (description "YAML support for Serde.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-servo-fontconfig-0.4
  (package
    (name "rust-servo-fontconfig")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "servo-fontconfig" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1nach6s4hdf86jz5hlm4p5r7vin91cs7gg89mr533id5fpbzi250"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-servo-fontconfig-sys" ,rust-servo-fontconfig-sys-4))))
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (inputs
     `(("fontconfig" ,fontconfig)))
    (home-page "https://github.com/servo/rust-fontconfig/")
    (synopsis "Rust bindings for fontconfig")
    (description "This package provides Rust bindings for fontconfig.")
    (license (list license:expat license:asl2.0))))

(define-public rust-servo-fontconfig-sys-4
  (package
    (name "rust-servo-fontconfig-sys")
    (version "4.0.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "servo-fontconfig-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0v0mbicy74wd6cjd5jyqnm4nvrrr5lmg053cn16kylhg8mkf3cv2"))
        (modules '((guix build utils)))
        (snippet
         '(begin
            (for-each delete-file-recursively
                      (find-files "." "[^Cargo.toml,^build\\.rs]"))
            #t))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-expat-sys" ,rust-expat-sys-2.1)
        ("rust-servo-freetype-sys" ,rust-servo-freetype-sys-4)
        ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (inputs
     `(("fontconfig" ,fontconfig)))
    (home-page "https://crates.io/crates/servo-fontconfig-sys")
    (synopsis "Rust wrapper around Fontconfig")
    (description
     "This package provides a Rust wrapper around Fontxonfig.")
    (license license:mpl2.0)))  ; build.rs is mpl2.0

(define-public rust-servo-freetype-sys-4
  (package
    (name "rust-servo-freetype-sys")
    (version "4.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "servo-freetype-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1z0dvnakans4vn4vlpx4nxg984427lh8dskxxz9pglij1mnwnk1c"))
        (modules '((guix build utils)))
        (snippet
         '(begin (delete-file-recursively "freetype2") #t))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cmake" ,rust-cmake-0.1)
        ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (inputs
     `(("freetype" ,freetype)))
    (home-page "http://www.freetype.org/")
    (synopsis "Rust wrapper around freetype")
    (description
     "This package provides a Rust wrapper around the FreeType library.")
    (license license:mpl2.0)))  ; build.rs is mpl2.0

(define-public rust-sha-1-0.8
  (package
    (name "rust-sha-1")
    (version "0.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sha-1" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0s6fdy5wp3x4h2z4fcl2d9vjvrpzr87v4h49r51xcq8nm4qj35i3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-block-buffer" ,rust-block-buffer-0.7)
        ("rust-digest" ,rust-digest-0.8)
        ("rust-fake-simd" ,rust-fake-simd-0.1)
        ("rust-opaque-debug" ,rust-opaque-debug-0.2)
        ("rust-sha1-asm" ,rust-sha1-asm-0.4))
       #:cargo-development-inputs
       (("rust-digest" ,rust-digest-0.8)
        ("rust-hex-literal" ,rust-hex-literal-0.2))))
    (home-page "https://github.com/RustCrypto/hashes")
    (synopsis "SHA-1 hash function")
    (description "SHA-1 hash function.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-sha1-0.6
  (package
    (name "rust-sha1")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sha1" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "03gs2q4m67rn2p8xcdfxhip6mpgahdwm12bnb3vh90ahv9grhy95"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-openssl" ,rust-openssl-0.10)
        ("rust-rand" ,rust-rand-0.4)
        ("rust-serde-json" ,rust-serde-json-1.0))))
    (home-page "https://github.com/mitsuhiko/rust-sha1")
    (synopsis "Minimal implementation of SHA1 for Rust")
    (description
     "Minimal implementation of SHA1 for Rust.")
    (license license:bsd-3)))

(define-public rust-sha1-0.2
  (package
    (inherit rust-sha1-0.6)
    (name "rust-sha1")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sha1" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0p09zfhd27z6yr5in07gfjcx345010rw51ivlcf14364x3hv2c6c"))))
    (arguments
     `(#:cargo-development-inputs
       (("rust-openssl" ,rust-openssl-0.7)
        ("rust-rand" ,rust-rand-0.3))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-cargo-toml
           (lambda _
             (substitute* "Cargo.toml"
               ((", path =.*}") "}"))
             #t)))))
    (native-inputs
     `(("openssl" ,openssl-1.0))))) ; for openssl-sys-extras

(define-public rust-sha1-asm-0.4
  (package
    (name "rust-sha1-asm")
    (version "0.4.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sha1-asm" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1i1i8viy6y30mv9v5hwhg9w6b722qkyh9c6n8bn4d27jpv14pg0s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-development-inputs
       (("rust-cc" ,rust-cc-1.0))))
    (home-page "https://github.com/RustCrypto/asm-hashes")
    (synopsis "Assembly implementation of SHA-1 compression function")
    (description
     "Assembly implementation of SHA-1 compression function.")
    (license license:expat)))

(define-public rust-shader-version-0.6
  (package
    (name "rust-shader-version")
    (version "0.6.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "shader_version" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1yk651xc9irl3pl0rlplypzyzy44d0j03ji0j7hjjdjknwzpi3j7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-piston-graphics-api-version"
         ,rust-piston-graphics-api-version-0.2))))
    (home-page "https://github.com/pistondevelopers/shader_version")
    (synopsis
     "Helper library for detecting and picking compatible shaders")
    (description "This package provides a helper library for detecting and
picking compatible shaders.")
    (license license:expat)))

(define-public rust-shared-child-0.3
  (package
    (name "rust-shared-child")
    (version "0.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "shared-child" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1lmjmr7931dr9cpalw2n7ss4i9mnl7285j2dygxflk9y80xczswc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/oconnor663/shared_child.rs")
    (synopsis "Use child processes from multiple threads")
    (description
     "A library for using child processes from multiple threads.")
    (license license:expat)))

(define-public rust-shared-library-0.1
  (package
    (name "rust-shared-library")
    (version "0.1.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "shared_library" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "04fs37kdak051hm524a360978g58ayrcarjsbf54vqps5c7px7js"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/tomaka/shared_library/")
    (synopsis "Bind to and load shared libraries")
    (description
     "This package allows easy binding to, and loading of, shared libraries.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-shell-words-0.1
  (package
    (name "rust-shell-words")
    (version "0.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "shell-words" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0jnrw3f174974fsi2hg48l0klpy24767ib28w0xcvi2ll5axxb1r"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/tmiasko/shell-words")
    (synopsis
     "Process command line according to parsing rules of UNIX shell")
    (description
     "Process command line according to parsing rules of UNIX shell.")
    (license (list license:expat license:asl2.0))))

(define-public rust-shlex-0.1
  (package
    (name "rust-shlex")
    (version "0.1.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "shlex" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1lmv6san7g8dv6jdfp14m7bdczq9ss7j7bgsfqyqjc3jnjfippvz"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/comex/rust-shlex")
    (synopsis "Split a string into shell words, like Python's shlex")
    (description "This crate provides a method to split a string into shell
words, like Python's shlex.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-signal-hook-0.1
  (package
    (name "rust-signal-hook")
    (version "0.1.13")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "signal-hook" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0b0yh6hlb5hs5kq6adyk0bn168y1ncymxvlizlygaabad2hz7f8h"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-futures" ,rust-futures-0.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-mio" ,rust-mio-0.6)
        ("rust-mio-uds" ,rust-mio-uds-0.6)
        ("rust-signal-hook-registry" ,rust-signal-hook-registry-1.2)
        ("rust-tokio-reactor" ,rust-tokio-reactor-0.1))
       #:cargo-development-inputs
       (("rust-tokio" ,rust-tokio-0.1)
        ("rust-version-sync" ,rust-version-sync-0.8))))
    (home-page "https://github.com/vorner/signal-hook")
    (synopsis "Unix signal handling")
    (description "Unix signal handling.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-signal-hook-registry-1.2
  (package
    (name "rust-signal-hook-registry")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "signal-hook-registry" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0haz828bif1lbp3alx17zkcy5hwy15bbpmvks72j8iznx7npix4l"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-arc-swap" ,rust-arc-swap-0.4)
        ("rust-libc" ,rust-libc-0.2))
       #:cargo-development-inputs
       (("rust-signal-hook" ,rust-signal-hook-0.1)
        ("rust-version-sync" ,rust-version-sync-0.8))))
    (home-page "https://github.com/vorner/signal-hook")
    (synopsis "Backend crate for signal-hook")
    (description "Backend crate for signal-hook.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-signal-hook-registry-1.0
  (package
    (inherit rust-signal-hook-registry-1.2)
    (name "rust-signal-hook-registry")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "signal-hook-registry" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1mw5v909fn99h5qb96ma4almlik80lr1c7xbakn24rql6bx4zvfd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-arc-swap" ,rust-arc-swap-0.3)
        ("rust-libc" ,rust-libc-0.2))
       #:cargo-development-inputs
       (("rust-signal-hook" ,rust-signal-hook-0.1)
        ("rust-version-sync" ,rust-version-sync-0.8))))))

(define-public rust-simd-0.2
  (package
    (name "rust-simd")
    (version "0.2.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "simd" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1dgpmfzd4favsckd5m0p6bna1dcgw19hjigkqcgwfhc4d05hxczj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t     ; Crate no longer builds on Rust 1.33+
       #:cargo-inputs
       (("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0))
       #:cargo-development-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1))))
    (home-page "https://github.com/hsivonen/simd")
    (synopsis "Limited cross-platform access to SIMD instructions on CPUs")
    (description
     "@code{simd} offers limited cross-platform access to SIMD instructions on
CPUs, as well as raw interfaces to platform-specific instructions.
(To be obsoleted by the @code{std::simd} implementation RFC 2366.)
")
    (license (list license:expat license:asl2.0))))

(define-public rust-simd-0.1
  (package
    (inherit rust-simd-0.2)
    (name "rust-simd")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "simd" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "08vhhz1w5m7amfp1d9lvfyyzl0jqjm82hrr7fb7afv3n5my89db3"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-serde" ,rust-serde-0.4)
        ("rust-serde-macros" ,rust-serde-macros-0.4))
       #:cargo-development-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1))))))

(define-public rust-simd-helpers-0.1
  (package
    (name "rust-simd-helpers")
    (version "0.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "simd_helpers" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "19idqicn9k4vhd04ifh2ff41wvna79zphdf2c81rlmpc7f3hz2cm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-quote" ,rust-quote-1.0))))
    (home-page "https://github.com/lu-zero/simd_helpers")
    (synopsis "Helpers to write more compact simd code")
    (description
     "This package provides helpers to write more compact simd code.")
    (license license:expat)))

(define-public rust-siphasher-0.3
  (package
    (name "rust-siphasher")
    (version "0.3.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "siphasher" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "08xvk3yi4vawppm1f81s4zrkksf95psz8gczh36y808candgi24f"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-serde" ,rust-serde-1.0))))
    (home-page "https://docs.rs/siphasher")
    (synopsis "SipHash-2-4, SipHash-1-3 and 128-bit variants in pure Rust")
    (description "This package provides SipHash-2-4, SipHash-1-3 and 128-bit
variants in pure Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-siphasher-0.2
  (package
    (name "rust-siphasher")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "siphasher" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1b53m53l24lyhr505lwqzrpjyq5qfnic71mynrcfvm43rybf938b"))))
    (build-system cargo-build-system)
    (home-page "https://docs.rs/siphasher")
    (synopsis "SipHash functions from rust-core < 1.13")
    (description
     "SipHash functions from rust-core < 1.13.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-skeptic-0.13
  (package
    (name "rust-skeptic")
    (version "0.13.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "skeptic" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0rai61hbs65nbvbhqlk1nap5hlav5qx3zmjjjzh9rhgxagc8xyyn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-error-chain" ,rust-error-chain-0.12)
        ("rust-pulldown-cmark" ,rust-pulldown-cmark-0.2)
        ("rust-glob" ,rust-glob-0.2)
        ("rust-tempdir" ,rust-tempdir-0.3)
        ("rust-bytecount" ,rust-bytecount-0.4)
        ("rust-cargo-metadata" ,rust-cargo-metadata-0.6)
        ("rust-serde-json" ,rust-serde-json-1.0)
        ("rust-walkdir" ,rust-walkdir-2.3))))
    (home-page "https://github.com/budziq/rust-skeptic")
    (synopsis "Test your Rust markdown documentation via Cargo")
    (description
     "Test your Rust markdown documentation via Cargo.")
    (license (list license:expat license:asl2.0))))

(define-public rust-slab-0.4
  (package
    (name "rust-slab")
    (version "0.4.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "slab" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1y59xsa27jk84sxzswjk60xcjf8b4fm5960jwpznrrcmasyva4f1"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/carllerche/slab")
    (synopsis "Pre-allocated storage for a uniform data type")
    (description "This create provides a pre-allocated storage for a uniform
data type.")
    (license license:expat)))

(define-public rust-sleef-sys-0.1
  (package
    (name "rust-sleef-sys")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sleef-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1881q2yc17j2m1yvh01447c93ws1mspnrj3k2nbvwbvcm8z81kkv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-libc" ,rust-libc-0.2))
       #:cargo-development-inputs
       (("rust-bindgen" ,rust-bindgen-0.50)
        ("rust-cmake" ,rust-cmake-0.1)
        ("rust-env-logger" ,rust-env-logger-0.6))))
    (home-page "https://github.com/gnzlbg/sleef-sys")
    (synopsis
     "Rust FFI bindings to the SLEEF Vectorized Math Library")
    (description
     "Rust FFI bindings to the SLEEF Vectorized Math Library.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-slog-2.5
  (package
    (name "rust-slog")
    (version "2.5.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "slog" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "16bv6zrdn1sm315vbnia02g31xvsmbjyz5gv3z0vrgxdli0cdj8w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-erased-serde" ,rust-erased-serde-0.3))))
    (home-page "https://github.com/slog-rs/slog")
    (synopsis "Structured, extensible, composable logging for Rust")
    (description
     "This package provides structured, extensible, composable logging for Rust.")
    (license
      (list license:mpl2.0
            license:expat
            license:asl2.0))))

(define-public rust-slog-2.4
  (package
    (name "rust-slog")
    (version "2.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "slog" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "13jh74jlckzh5cygkhs0k4r82wnmw8ha2km829xwslhr83n2w6hy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-erased-serde" ,rust-erased-serde-0.3))))
    (home-page "https://github.com/slog-rs/slog")
    (synopsis "Structured, extensible, composable logging for Rust")
    (description
     "Structured, extensible, composable logging for Rust.")
    (license (list license:mpl2.0
                   license:expat
                   license:asl2.0))))

(define-public rust-smallvec-1
  (package
    (name "rust-smallvec")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "smallvec" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1z6f47i3qpg9pdjzzvb0g5i1vvdm2ymk3kqc1mdnl8fdkgnb4bsw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-bincode" ,rust-bincode-1.1))))
    (home-page "https://github.com/servo/rust-smallvec")
    (synopsis "Small vector optimization")
    (description
     "'Small vector' optimization: store up to a small number of items on the
stack.")
    (license (list license:expat license:asl2.0))))

(define-public rust-smallvec-0.6
  (package
    (inherit rust-smallvec-1)
    (name "rust-smallvec")
    (version "0.6.13")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "smallvec" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1dl219vnfkmsfx28lm3f83lyw24zap6fdsli6rg8nnp1aa67bc7p"))))
    (arguments
     `(#:cargo-inputs
       (("rust-maybe-uninit" ,rust-maybe-uninit-2.0)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-bincode" ,rust-bincode-1.1))))))

(define-public rust-smithay-client-toolkit-0.6
  (package
    (name "rust-smithay-client-toolkit")
    (version "0.6.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "smithay-client-toolkit" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0m20687zs36l6xak2s5k9s7qp78ly8xfjpbmrhacp7whfn4hx5lk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-andrew" ,rust-andrew-0.2)
        ("rust-bitflags" ,rust-bitflags-1)
        ("rust-dlib" ,rust-dlib-0.4)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-memmap" ,rust-memmap-0.7)
        ("rust-nix" ,rust-nix-0.14)
        ("rust-wayland-client" ,rust-wayland-client-0.23)
        ("rust-wayland-protocols" ,rust-wayland-protocols-0.23))
       #:cargo-development-inputs
       (("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-image" ,rust-image-0.21)
        ("rust-wayland-client" ,rust-wayland-client-0.23))))
    (home-page "https://github.com/smithay/client-toolkit")
    (synopsis "Toolkit for making client wayland applications")
    (description
     "Toolkit for making client wayland applications.")
    (license license:expat)))

(define-public rust-smithay-client-toolkit-0.4
  (package
    (inherit rust-smithay-client-toolkit-0.6)
    (name "rust-smithay-client-toolkit")
    (version "0.4.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "smithay-client-toolkit" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1yj8yzd0lhqpsgq0x4iikl9a02q2hnkky81brk938alv0ibqrjrc"))))
    (arguments
     `(#:cargo-inputs
       (("rust-andrew" ,rust-andrew-0.2)
        ("rust-bitflags" ,rust-bitflags-1)
        ("rust-dlib" ,rust-dlib-0.4)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-memmap" ,rust-memmap-0.7)
        ("rust-nix" ,rust-nix-0.14)
        ("rust-wayland-client" ,rust-wayland-client-0.21)
        ("rust-wayland-commons" ,rust-wayland-commons-0.21)
        ("rust-wayland-protocols" ,rust-wayland-protocols-0.21))
       #:cargo-development-inputs
       (("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-image" ,rust-image-0.20)
        ("rust-wayland-client" ,rust-wayland-client-0.21))))))

(define-public rust-smithay-clipboard-0.3
  (package
    (name "rust-smithay-clipboard")
    (version "0.3.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "smithay-clipboard" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1h7qhcx44cgwncgpn5llky0c56vgsg9mqrkybb2z37vsxxia4rwn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-nix" ,rust-nix-0.14)
        ("rust-smithay-client-toolkit" ,rust-smithay-client-toolkit-0.6))
       #:cargo-development-inputs
       (("rust-andrew" ,rust-andrew-0.2))))
    (inputs
     `(("wayland" ,wayland)))
    (home-page "https://github.com/smithay/smithay-clipboard")
    (synopsis
     "Provides access to the wayland clipboard for client applications")
    (description
     "This package provides access to the wayland clipboard for client applications.")
    (license license:expat)))

(define-public rust-socket2-0.3
  (package
    (name "rust-socket2")
    (version "0.3.11")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "socket2" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "11bdcz04i106g4q7swkll0qxrb4287srqd2k3aq2q6i22zjlvdz8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f      ; tests require network access
       #:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-redox-syscall" ,rust-redox-syscall-0.1)
        ("rust-winapi" ,rust-winapi-0.3))
       #:cargo-development-inputs
       (("rust-tempdir" ,rust-tempdir-0.3))))
    (home-page "https://github.com/alexcrichton/socket2-rs")
    (synopsis "Networking sockets in Rust")
    (description
     "This package provides utilities for handling networking sockets with a
maximal amount of configuration possible intended.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-sourcefile-0.1
  (package
    (name "rust-sourcefile")
    (version "0.1.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "sourcefile" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1lwa6973zs4bgj29my7agfjgk4nw9hp6j7dfnr13nid85fw7rxsb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-tempfile" ,rust-tempfile-3.1))))
    (home-page "https://github.com/derekdreery/sourcefile-rs")
    (synopsis "Concatenate source from multiple files")
    (description
     "A library for concatenating source from multiple files, whilst keeping
track of where each new file and line starts.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-speculate-0.1
  (package
    (name "rust-speculate")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "speculate" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ph01n3fqkmnfr1wd13dqsi4znv06xy6p4h3hqqdzk81r0r5vd1w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-0.15)
        ("rust-unicode-xid" ,rust-unicode-xid-0.1))))
    (home-page "https://github.com/utkarshkukreti/speculate.rs")
    (synopsis "RSpec inspired testing framework for Rust")
    (description
     "An RSpec inspired minimal testing framework for Rust.")
    (license license:expat)))

(define-public rust-spin-0.5
  (package
    (name "rust-spin")
    (version "0.5.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "spin" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0b84m6dbzrwf2kxylnw82d3dr8w06av7rfkr8s85fb5f43rwyqvf"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/mvdnes/spin-rs")
    (synopsis "Synchronization primitives based on spinning")
    (description "This crate provides synchronization primitives based on
spinning.  They may contain data, are usable without @code{std},and static
initializers are available.")
    (license license:expat)))

(define-public rust-spin-0.4
  (package
    (inherit rust-spin-0.5)
    (name "rust-spin")
    (version "0.4.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "spin" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "07ywqn1vrpi3c43fmvsx7pawk9h3rb77yyqbnhap2micl454kb6f"))))
    (arguments '(#:skip-build? #t))))

(define-public rust-spsc-buffer-0.1
  (package
    (name "rust-spsc-buffer")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "spsc-buffer" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0fsv5zpxkax2n46flxhyajq1yblgh8f33la39gp86hksqcwkyv5y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-criterion" ,rust-criterion-0.2))))
    (home-page "https://github.com/davidhewitt/spsc-buffer")
    (synopsis "Single-producer single-consumer lock-free buffer")
    (description
     "This package provides a single-producer single-consumer lock-free buffer.")
    (license license:expat)))

(define-public rust-stable-deref-trait-1.1
  (package
    (name "rust-stable-deref-trait")
    (version "1.1.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "stable_deref_trait" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1j2lkgakksmz4vc5hfawcch2ipiskrhjs1sih0f3br7s7rys58fv"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/storyyeller/stable_deref_trait0")
    (synopsis "Defines an unsafe marker trait, StableDeref")
    (description
      "This crate defines an unsafe marker trait, StableDeref, for container
types which deref to a fixed address which is valid even when the containing
type is moved.  For example, Box, Vec, Rc, Arc and String implement this trait.
Additionally, it defines CloneStableDeref for types like Rc where clones deref
to the same address.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-stacker-0.1
  (package
    (name "rust-stacker")
    (version "0.1.6")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "stacker" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "12igajfgqz96c7vcwi91xdfsphawik6g36ndlglqih0a7bqw8vyr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-psm" ,rust-psm-0.1)
        ("rust-winapi" ,rust-winapi-0.3))
       #:cargo-development-inputs
       (("rust-cc" ,rust-cc-1.0))))
    (home-page "https://github.com/rust-lang/stacker")
    (synopsis "Manual segmented stacks for Rust")
    (description
     "This package provides a stack growth library useful when implementing
deeply recursive algorithms that may accidentally blow the stack.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-stackvector-1.0
  (package
    (name "rust-stackvector")
    (version "1.0.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "stackvector" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1bv820fhdad16islwli1g3iksk39ivf0zaqz4j1m08vq15jjaiqw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-unreachable" ,rust-unreachable-1.0))
       #:cargo-development-inputs
       (("rust-rustc-version" ,rust-rustc-version-0.2))))
    (home-page "https://github.com/Alexhuszagh/rust-stackvector")
    (synopsis "Vector-like facade for stack-allocated arrays")
    (description
     "StackVec: vector-like facade for stack-allocated arrays.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-static-assertions-0.3
  (package
    (name "rust-static-assertions")
    (version "0.3.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "static-assertions" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1lw33i89888yb3x29c6dv4mrkg3534n0rlg3r7qzh4p58xmv6gkz"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/nvzqz/static-assertions-rs")
    (synopsis "Compile-time assertions for rust")
    (description
     "This package provides compile-time assertions to ensure that invariants
are met.")
    (license (list license:expat license:asl2.0))))

(define-public rust-stb-truetype-0.3
  (package
    (name "rust-stb-truetype")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "stb_truetype" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0lgvnh3ma6cz811bk8imj45djz76zs47b8327sgnmik2x03nnyzp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f      ; tests not included in release
       #:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-libm" ,rust-libm-0.2))
       #:cargo-development-inputs
       (("rust-approx" ,rust-approx-0.3))))
    (home-page "https://gitlab.redox-os.org/redox-os/stb_truetype-rs")
    (synopsis "Translation of the font loading code to Rust")
    (description
     "This package provides a straight translation of the font loading code
in @code{stb_truetype.h} from C to Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-stdweb-0.4
  (package
    (name "rust-stdweb")
    (version "0.4.20")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "stdweb" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1md14n9rzxzdskz3hpgln8vxfwqsw2cswc0f5nslh4r82rmlj8nh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-discard" ,rust-discard-1.0)
        ("rust-futures-channel-preview" ,rust-futures-channel-preview-0.3)
        ("rust-futures-core-preview" ,rust-futures-core-preview-0.3)
        ("rust-futures-executor-preview" ,rust-futures-executor-preview-0.3)
        ("rust-futures-util-preview" ,rust-futures-util-preview-0.3)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-json" ,rust-serde-json-1.0)
        ("rust-stdweb-derive" ,rust-stdweb-derive-0.5)
        ("rust-stdweb-internal-macros" ,rust-stdweb-internal-macros-0.2)
        ("rust-stdweb-internal-runtime" ,rust-stdweb-internal-runtime-0.1)
        ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
        ("rust-rustc-version" ,rust-rustc-version-0.2))
       #:cargo-development-inputs
       (("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-serde-json" ,rust-serde-json-1.0)
        ("rust-stdweb-internal-test-macro" ,rust-stdweb-internal-test-macro-0.1)
        ("rust-wasm-bindgen-test" ,rust-wasm-bindgen-test-0.2))))
    (home-page "https://github.com/koute/stdweb")
    (synopsis "Standard library for the client-side Web")
    (description
     "This package provides a standard library for the client-side
Web.")
    (license (list license:expat license:asl2.0))))

(define-public rust-stdweb-derive-0.5
  (package
    (name "rust-stdweb-derive")
    (version "0.5.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "stdweb-derive" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1vsh7g0gaxn4kxqq3knhymdn02p2pfxmnd2j0vplpj6c1yj60yn8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f
       #:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1.0)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-syn" ,rust-syn-1.0))))
    (home-page "https://github.com/koute/stdweb")
    (synopsis "Derive macros for the stdweb crate")
    (description
     "This crate currently defines a derive macro for @code{stdweb} which allows
you to define custom reference types outside of the @code{stdweb} library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-stdweb-internal-macros-0.2
  (package
    (name "rust-stdweb-internal-macros")
    (version "0.2.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "stdweb-internal-macros" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "049fq8fl5ny9l5if2qv7kxwng7g6ns95h4fbm3zx360dmpv5zyjq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-base-x" ,rust-base-x-0.2)
        ("rust-proc-macro2" ,rust-proc-macro2-1.0)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-serde-json" ,rust-serde-json-1.0)
        ("rust-sha1" ,rust-sha1-0.6)
        ("rust-syn" ,rust-syn-1.0))))
    (home-page "https://github.com/koute/stdweb")
    (synopsis "Internal procedural macros for the stdweb crate")
    (description
     "Internal procedural macros for the @code{stdweb} crate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-stdweb-internal-runtime-0.1
  (package
    (name "rust-stdweb-internal-runtime")
    (version "0.1.5")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "stdweb-internal-runtime" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1h0nkppb4r8dbrbms2hw9n5xdcs392m0r5hj3b6lsx3h6fx02dr1"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/koute/stdweb")
    (synopsis "Internal runtime for the @code{stdweb} crate")
    (description "This crate provides internal runtime for the @code{stdweb}
crate.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-stdweb-internal-test-macro-0.1
  (package
    (name "rust-stdweb-internal-test-macro")
    (version "0.1.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "stdweb-internal-test-macro" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0wx3jlm98qrg1pdw149fprzs9x3x3igqkm5ll23jv2v62yddfrjf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1.0)
        ("rust-quote" ,rust-quote-1.0))))
    (home-page "https://github.com/koute/stdweb")
    (synopsis "Internal crate of the `stdweb` crate")
    (description
     "Internal crate of the @code{stdweb} crate.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-stream-cipher-0.3
  (package
    (name "rust-stream-cipher")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "stream-cipher" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1g1nd8r6pph70rzk5yyvg7a9ji7pkap9ddiqpp4v9xa9ys0bqqc8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-blobby" ,rust-blobby-0.1)
        ("rust-generic-array" ,rust-generic-array-0.13))))
    (home-page "https://github.com/RustCrypto/traits")
    (synopsis "Stream cipher traits")
    (description "Stream cipher traits.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-streaming-stats-0.2
  (package
    (name "rust-streaming-stats")
    (version "0.2.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "streaming-stats" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0iz5dlq51w5hxjrv6a4hpf8rrj91kgvy0s9mhj0j12il9v771mmh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-num-traits" ,rust-num-traits-0.2))))
    (home-page "https://github.com/BurntSushi/rust-stats")
    (synopsis "Compute basic statistics on streams")
    (description
     "Experimental crate for computing basic statistics on streams.")
    (license (list license:unlicense
                   license:expat))))

(define-public rust-string-cache-0.7
  (package
    (name "rust-string-cache")
    (version "0.7.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "string_cache" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0rrdb822gc1fs3qq4camgj3kh4182bs79hpqxhdrpmlz5yl5ih49"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-new-debug-unreachable"
         ,rust-new-debug-unreachable-1.0)
        ("rust-phf-shared" ,rust-phf-shared-0.7)
        ("rust-precomputed-hash" ,rust-precomputed-hash-0.1)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-string-cache-codegen" ,rust-string-cache-codegen-0.4)
        ("rust-string-cache-shared" ,rust-string-cache-shared-0.3))
       #:cargo-development-inputs
       (("rust-rand" ,rust-rand-0.4))))
    (home-page "https://github.com/servo/string-cache")
    (synopsis "String interning library for Rust")
    (description
     "This package provides a string interning library for Rust,
developed as part of the Servo project.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-string-cache-codegen-0.4
  (package
    (name "rust-string-cache-codegen")
    (version "0.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "string-cache-codegen" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ik78h9gs874i24rkyh0myg6x4ni2a9cazbv5yzs9yavnv8mxx7h"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-phf-generator" ,rust-phf-generator-0.7)
        ("rust-phf-shared" ,rust-phf-shared-0.7)
        ("rust-proc-macro2" ,rust-proc-macro2-1.0)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-string-cache-shared"
         ,rust-string-cache-shared-0.3))))
    (home-page "https://github.com/servo/string-cache")
    (synopsis "Codegen library for string-cache")
    (description
     "This package provides a codegen library for string-cache,
developed as part of the Servo project.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-string-cache-shared-0.3
  (package
    (name "rust-string-cache-shared")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "string-cache-shared" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1z7dpdix1m42x6ddshdcpjf91ml9mhvnskmiv5kd8hcpq0dlv25i"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/servo/string-cache")
    (synopsis "Code share between string_cache and string_cache_codegen")
    (description
     "Code share between string_cache and string_cache_codegen.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-strsim-0.9
  (package
    (name "rust-strsim")
    (version "0.9.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "strsim" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0k497pv882qn3q977ckznm13vxx927g8s1swvcv68j3c1pccwik4"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/dguo/strsim-rs")
    (synopsis "Rust implementations of string similarity metrics")
    (description "This crate includes implementations of string similarity
metrics.  It includes Hamming, Levenshtein, OSA, Damerau-Levenshtein, Jaro,
and Jaro-Winkler.")
    (license license:expat)))

(define-public rust-strsim-0.8
  (package
    (inherit rust-strsim-0.9)
    (name "rust-strsim")
    (version "0.8.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "strsim" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0sjsm7hrvjdifz661pjxq5w4hf190hx53fra8dfvamacvff139cf"))))))

(define-public rust-strsim-0.6
  (package
    (inherit rust-strsim-0.9)
    (name "rust-strsim")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "strsim" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "151ngha649cyybr3j50qg331b206zrinxqz7fzw1ra8r0n0mrldl"))))))

(define-public rust-strsim-0.5
  (package
    (inherit rust-strsim-0.9)
    (name "rust-strsim")
    (version "0.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "strsim" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0z3zzvmilfldp4xw42qbkjf901dcnbk58igrzsvivydjzd24ry37"))))))

(define-public rust-structopt-0.3
  (package
    (name "rust-structopt")
    (version "0.3.12")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "structopt" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "178m7wxnjyy9a8a961z74nazjsg79rfv3gv9g3bykfrrjmqs5yn8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-structopt-derive" ,rust-structopt-derive-0.4)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-clap" ,rust-clap-2))))
    (home-page "https://github.com/TeXitoi/structopt")
    (synopsis "Parse command line argument by defining a struct")
    (description
     "Parse command line argument by defining a struct.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-structopt-0.2
  (package
    (name "rust-structopt")
    (version "0.2.18")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "structopt" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1mvfv1l8vp3y402fkl2wcl34hi7gmr4bqha13dfz2xf3kjzwvhhn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f
       #:cargo-inputs
       (("rust-clap" ,rust-clap-2)
        ("rust-structopt-derive" ,rust-structopt-derive-0.2))))
    (home-page "https://github.com/TeXitoi/structopt")
    (synopsis "Parse command line arguments by defining a struct")
    (description
     "Parse command line arguments by defining a struct.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-structopt-derive-0.4
  (package
    (name "rust-structopt-derive")
    (version "0.4.5")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "structopt-derive" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0c04bbzc5bmr2ns6qy35yz55nn3xvlq4dpwxdynnljb9ikhvi21z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-heck" ,rust-heck-0.3)
        ("rust-proc-macro-error" ,rust-proc-macro-error-0.4)
        ("rust-proc-macro2" ,rust-proc-macro2-1.0)
        ("rust-syn" ,rust-syn-1.0)
        ("rust-quote" ,rust-quote-1.0))))
    (home-page "https://github.com/TeXitoi/structopt")
    (synopsis "Parse command line argument by defining a struct, derive crate")
    (description
     "Parse command line argument by defining a struct, derive crate.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-structopt-derive-0.2
  (package
    (name "rust-structopt-derive")
    (version "0.2.18")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "structopt-derive" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "01sis9z5kqmyhvzbnmlzpdxcry99a0b9blypksgnhdsbm1hh40ak"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-heck" ,rust-heck-0.3)
        ("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-0.6)
        ("rust-syn" ,rust-syn-0.15))))
    (home-page "https://github.com/TeXitoi/structopt")
    (synopsis
     "Parse command line argument by defining a struct, derive crate")
    (description
     "Parse command line argument by defining a struct, derive crate.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-subtle-1.0
  (package
    (name "rust-subtle")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "subtle" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1vm80mxbwfj334izwm8x8l65v1xl9hr0kwrg36r1rq565fkaarrd"))))
    (build-system cargo-build-system)
    (home-page "https://dalek.rs/")
    (synopsis
     "Pure-Rust traits and utilities for cryptographic implementations")
    (description
     "This package provides Pure-Rust traits and utilities for constant-time
cryptographic implementations.")
    (license license:bsd-3)))

(define-public rust-sval-0.4
  (package
    (name "rust-sval")
    (version "0.4.7")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "sval" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1aljggx64481q4wp3wx9hxsfh2bs7d64nqsrwbb2zxcpmdnbn6yk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-sval-derive" ,rust-sval-derive-0.4)
        ("rust-smallvec" ,rust-smallvec-0.6)
        ("rust-serde" ,rust-serde-1.0))))
    (home-page "https://github.com/sval-rs/sval")
    (synopsis "No-std, object-safe serialization framework")
    (description
     "This package provides a no-std, object-safe serialization framework.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-sval-derive-0.4
  (package
    (name "rust-sval-derive")
    (version "0.4.7")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "sval_derive" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "07s7jqsdczsg0wnydfnxyrsj8zyrjmiwl4is1dfgn8dfvyi8n2bj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1.0)
        ("rust-syn" ,rust-syn-1.0)
        ("rust-quote" ,rust-quote-1.0))))
    (home-page "https://github.com/sval-rs/sval")
    (synopsis "Custom derive for sval")
    (description "Custom derive for sval.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-syn-1.0
  (package
    (name "rust-syn")
    (version "1.0.17")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "syn" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "00xvf772ys4fj9fr8kplmsqb9if215dsipi3nv54aw9q7xkfpw0d"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-unicode-xid" ,rust-unicode-xid-0.2)
        ("rust-proc-macro2" ,rust-proc-macro2-1.0)
        ("rust-quote" ,rust-quote-1.0))
       #:cargo-development-inputs
       (("rust-anyhow" ,rust-anyhow-1.0)
        ("rust-flate2" ,rust-flate2-1.0)
        ;("rust-insta" ,rust-insta-0.12)
        ("rust-rayon" ,rust-rayon-1.3)
        ("rust-ref-cast" ,rust-ref-cast-1.0)
        ("rust-regex" ,rust-regex-1.3)
        ;("rust-reqwest" ,rust-reqwest-0.10)
        ("rust-tar" ,rust-tar-0.4)
        ("rust-termcolor" ,rust-termcolor-1.0)
        ("rust-walkdir" ,rust-walkdir-2.3))))
    (home-page "https://github.com/dtolnay/syn")
    (synopsis "Parser for Rust source code")
    (description "Parser for Rust source code")
    (license (list license:expat license:asl2.0))))

(define-public rust-syn-0.15
  (package
    (inherit rust-syn-1.0)
    (name "rust-syn")
    (version "0.15.44")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "syn" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1id5g6x6zihv3j7hwrw3m1jp636bg8dpi671r7zy3jvpkavb794w"))))
    (arguments
     `(#:cargo-test-flags '("--release" "--all-features")
       #:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-0.6)
        ("rust-unicode-xid" ,rust-unicode-xid-0.1))
       #:cargo-development-inputs
       (("rust-insta" ,rust-insta-0.8)
        ("rust-rayon" ,rust-rayon-1.1)
        ("rust-ref-cast" ,rust-ref-cast-0.2)
        ("rust-regex" ,rust-regex-1.1)
        ("rust-termcolor" ,rust-termcolor-1.0)
        ("rust-walkdir" ,rust-walkdir-2.2))))
    (properties '())))

(define-public rust-syn-0.11
  (package
    (inherit rust-syn-0.15)
    (name "rust-syn")
    (version "0.11.11")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "syn" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1b8x8jdsmj6r9ck7n1pg371526n1q90kx6rv6ivcb22w06wr3f6k"))))
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-before 'build 'fixup-cargo-toml
           (lambda _
             (substitute* "Cargo.toml"
               ((", path =.*,") ","))
             #t)))
       #:cargo-inputs
       (("rust-quote" ,rust-quote-0.3)
        ("rust-synom" ,rust-synom-0.11)
        ("rust-unicode-xid" ,rust-unicode-xid-0.0))
       #:cargo-development-inputs
       (("rust-syntex-pos" ,rust-syntex-pos-0.58)
        ("rust-syntex-syntax" ,rust-syntex-syntax-0.58)
        ("rust-tempdir" ,rust-tempdir-0.3)
        ("rust-walkdir" ,rust-walkdir-1.0))))))

(define-public rust-syn-mid-0.5
  (package
    (name "rust-syn-mid")
    (version "0.5.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "syn-mid" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "12ikg5jfklixq0wsgfl7sdzjqlxgq50ygklxy4f972hjdjgm7qvv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1.0)
        ("rust-syn" ,rust-syn-1.0)
        ("rust-quote" ,rust-quote-1.0))))
    (home-page "https://github.com/taiki-e/syn-mid")
    (synopsis
     "Provide the features between \"full\" and \"derive\" of syn.")
    (description
     "This package provides the features between \"full\" and \"derive\" of syn.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-synom-0.11
  (package
    (name "rust-synom")
    (version "0.11.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "synom" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1dj536sh5xxhan2h0znxhv0sl6sb7lvzmsmrc3nvl3h1v5p0d4x3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f      ; doc tests fail
       #:phases
       (modify-phases %standard-phases
         (add-before 'build 'fixup-cargo-toml
           (lambda _
             (substitute* "Cargo.toml"
               (("^path =.*") ""))
             #t)))
       #:cargo-inputs
       (("rust-unicode-xid" ,rust-unicode-xid-0.0))
       #:cargo-development-inputs
       (("rust-syn" ,rust-syn-0.11))))
    (home-page "https://github.com/dtolnay/syn")
    (synopsis "Stripped-down Nom parser used by Syn")
    (description
     "Stripped-down Nom parser used by Syn.")
    (license (list license:expat license:asl2.0))))

(define-public rust-synstructure-0.12
  (package
    (name "rust-synstructure")
    (version "0.12.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "synstructure" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0igmc5fzpk6fg7kgff914j05lbpc6ai2wmji312v2h8vvjhnwrb7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-unicode-xid" ,rust-unicode-xid-0.2)
        ("rust-proc-macro2" ,rust-proc-macro2-1.0)
        ("rust-syn" ,rust-syn-1.0)
        ("rust-quote" ,rust-quote-1.0))))
    (home-page "https://github.com/mystor/synstructure")
    (synopsis "Helper methods and macros for custom derives")
    (description
     "This package provides helper methods and macros for custom derives.")
    (license license:expat)))

(define-public rust-synstructure-0.10
  (package
    (name "rust-synstructure")
    (version "0.10.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "synstructure" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0grirdkgh2wl4hf9a3nbiazpgccxgq54kn52ms0xrr6njvgkwd82"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-0.6)
        ("rust-syn" ,rust-syn-0.15)
        ("rust-unicode-xid" ,rust-unicode-xid-0.1))
       #:cargo-development-inputs
       (("rust-synstructure-test-traits" ,rust-synstructure-test-traits-0.1))))
    (home-page "https://github.com/mystor/synstructure")
    (synopsis "Helper methods and macros for custom derives")
    (description
     "Helper methods and macros for custom derives.")
    (license license:expat)))

(define-public rust-synstructure-test-traits-0.1
  (package
    (name "rust-synstructure-test-traits")
    (version "0.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "synstructure_test_traits" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1b3fs2b9kc1gy9dilaxqjbdl4z0mlrbbxjzkprdx953rif1c3q66"))))
    (build-system cargo-build-system)
    (home-page "https://crates.io/crates/synstructure_test_traits")
    (synopsis "Helper test traits for synstructure doctests")
    (description
     "This package provides helper test traits for synstructure doctests.")
    (license license:expat)))

(define-public rust-syntect-3.3
  (package
    (name "rust-syntect")
    (version "3.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "syntect" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1f6qn1yy15b0hq9h6q1rikqnm3lh56ic6bq3ywsmdsjy8ni9splm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-plist" ,rust-plist-0.4)
        ("rust-yaml-rust" ,rust-yaml-rust-0.4)
        ("rust-regex-syntax" ,rust-regex-syntax-0.6)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-flate2" ,rust-flate2-1.0)
        ("rust-serde-json" ,rust-serde-json-1.0)
        ("rust-fnv" ,rust-fnv-1.0)
        ("rust-bitflags" ,rust-bitflags-1)
        ("rust-lazycell" ,rust-lazycell-1.2)
        ("rust-bincode" ,rust-bincode-1.2)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-walkdir" ,rust-walkdir-2.3)
        ("rust-onig" ,rust-onig-5.0))))
    (home-page "https://github.com/trishume/syntect")
    (synopsis "Library for syntax highlighting and code intelligence")
    (description
     "This package provides a library for syntax highlighting and code
intelligence using Sublime Text's grammars.")
    (license license:expat)))

(define-public rust-syntex-0.58
 (package
   (name "rust-syntex")
   (version "0.58.1")
   (source
    (origin
      (method url-fetch)
      (uri (crate-uri "syntex" version))
      (file-name
       (string-append name "-" version ".tar.gz"))
      (sha256
       (base32
        "03lgd36cxhc6gzaab0wqvckbhml00s6s73lk34ymf6cklymf7xd8"))))
   (build-system cargo-build-system)
   (arguments
    `(#:skip-build? #t
      #:cargo-inputs
      (("rust-syntex-errors" ,rust-syntex-errors-0.58)
       ("rust-syntex-syntax" ,rust-syntex-syntax-0.58))))
   (home-page "https://github.com/erickt/rust-syntex")
   (synopsis "Compile time syntax extension expansion")
   (description
    "This package provides a library that enables compile time
syntax extension expansion.")
   (license (list license:expat license:asl2.0))))

(define-public rust-syntex-errors-0.58
  (package
    (name "rust-syntex-errors")
    (version "0.58.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "syntex_errors" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "176vma7sjv6li17q7dsilryac66b76zyis9ampmff2hlsz1caz46"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-rustc-serialize" ,rust-rustc-serialize-0.3)
        ("rust-syntex-pos" ,rust-syntex-pos-0.58)
        ("rust-term" ,rust-term-0.4)
        ("rust-unicode-xid" ,rust-unicode-xid-0.0))))
    (home-page "https://github.com/serde-rs/syntex")
    (synopsis "Backport of librustc_errors")
    (description "This package provides a backport of @code{librustc_errors}.")
    (license (list license:expat license:asl2.0))))

(define-public rust-syntex-pos-0.58
  (package
    (name "rust-syntex-pos")
    (version "0.58.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "syntex_pos" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0iqhircpr723da1g97xrrj8smqqz3gxw91cf03sckasjzri4gb8k"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-rustc-serialize" ,rust-rustc-serialize-0.3))))
    (home-page "https://github.com/serde-rs/syntex")
    (synopsis "Backport of libsyntax_pos")
    (description "This package provides a backport of @code{libsyntax_pos}.")
    (license (list license:expat license:asl2.0))))

(define-public rust-syntex-syntax-0.58
  (package
    (name "rust-syntex-syntax")
    (version "0.58.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "syntex_syntax" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "14f74l7yzwl6fr9i23k4j23k66qn0gakvhk4jjc9ipb3w6x4s3kf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-0.8)
        ("rust-log" ,rust-log-0.3)
        ("rust-rustc-serialize" ,rust-rustc-serialize-0.3)
        ("rust-syntex-errors" ,rust-syntex-errors-0.58)
        ("rust-syntex-pos" ,rust-syntex-pos-0.58)
        ("rust-unicode-xid" ,rust-unicode-xid-0.0))))
    (home-page "https://github.com/serde-rs/syntex")
    (synopsis "Backport of libsyntax")
    (description "This package provides a backport of libsyntax.")
    (license (list license:expat license:asl2.0))))

(define-public rust-sysctl-0.4
  (package
    (name "rust-sysctl")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sysctl" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0p6bfjsw3v12nb2qsgm6r9klwb5qyh4w55zzmccv8r5aqb8g0085"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-failure" ,rust-failure-0.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-walkdir" ,rust-walkdir-2.2))))
    (home-page "https://github.com/johalun/sysctl-rs")
    (synopsis "Simplified interface to libc::sysctl")
    (description
     "Simplified interface to libc::sysctl.")
    (license license:expat)))

(define-public rust-sysctl-0.1
  (package
    (inherit rust-sysctl-0.4)
    (name "rust-sysctl")
    (version "0.1.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "sysctl" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "10wxlk4nkzlxp4fg435jmdmfwl4hy0y4w2rcsgs634lvbp8pgksb"))))
    (arguments
     `(#:skip-build? #t ; Unsupported on Linux.
       #:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-errno" ,rust-errno-0.2)
        ("rust-libc" ,rust-libc-0.2))))))

(define-public rust-syslog-4.0
  (package
    (name "rust-syslog")
    (version "4.0.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "syslog" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "09ykcbvwx8icvf303mqyz76ji8j6fgyyx97zpr23s788ni112r50"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-time" ,rust-time-0.1)
        ("rust-error-chain" ,rust-error-chain-0.11)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-log" ,rust-log-0.4))))
    (home-page "https://github.com/Geal/rust-syslog")
    (synopsis "Send log messages to syslog")
    (description "Send log messages to syslog.")
    (license license:expat)))

(define-public rust-syslog-3.3
  (package
    (name "rust-syslog")
    (version "3.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "syslog" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0hpdnk2zm6xawpz6fv6qbn0ncfm5p0wm5c6gq7yhaz2gvsnb1jdv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-time" ,rust-time-0.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-log" ,rust-log-0.3)
        ("rust-unix-socket" ,rust-unix-socket-0.5))))
    (home-page "https://github.com/Geal/rust-syslog")
    (synopsis "Send log messages to syslog")
    (description "Send log messages to syslog.")
    (license license:expat)))

(define-public rust-takeable-option-0.4
  (package
    (name "rust-takeable-option")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "takeable-option" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0hvd6vk4ksgg2y99498jw52ric4lxm0i6ygpzqm95gdrhvsxyynp"))))
    (build-system cargo-build-system)
    (home-page "https://docs.rs/takeable-option/")
    (synopsis "A small wrapper around option.")
    (description
     "This package provides a small wrapper around option.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-tar-0.4
  (package
    (name "rust-tar")
    (version "0.4.26")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "tar" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1lr6v3cpkfxd2lk5ll2jd8wr1xdskwj35smnh5sfb8xvzzxnn6dk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f      ; Test tarballs not included in crate.
       #:cargo-inputs
       (("rust-filetime" ,rust-filetime-0.2)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-redox-syscall" ,rust-redox-syscall-0.1)
        ("rust-xattr" ,rust-xattr-0.2))
       #:cargo-development-inputs
       (("rust-tempdir" ,rust-tempdir-0.3))))
    (home-page "https://github.com/alexcrichton/tar-rs")
    (synopsis "Tar file reading/writing for Rust")
    (description
     "This package provides a Rust implementation of a TAR file reader and
writer.  This library does not currently handle compression, but it is abstract
over all I/O readers and writers.  Additionally, great lengths are taken to
ensure that the entire contents are never required to be entirely resident in
memory all at once.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-target-build-utils-0.3
  (package
    (name "rust-target-build-utils")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "target_build_utils" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0p7713x4bpbwi11l196z1mi8ym8qj1cdnab1mm2ffpm2wi516g81"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-phf" ,rust-phf-0.7)
        ("rust-serde-json" ,rust-serde-json-0.9)
        ("rust-phf-codegen" ,rust-phf-codegen-0.7))))
    (home-page "https://github.com/nagisa/target_build_utils.rs")
    (synopsis "Rust utility to handle TARGET environment variable")
    (description
     "Utility crate to handle the @code{TARGET} environment variable passed into
@code{build.rs} scripts.")
    (license (list license:isc license:asl2.0))))

(define-public rust-target-lexicon-0.10
  (package
    (name "rust-target-lexicon")
    (version "0.10.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "target-lexicon" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "17diw9c3d1vb5rmwwk2ghsyhfs0gj5jm78hrwxxhmd67vhw743mb"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
      "https://github.com/CraneStation/target-lexicon")
    (synopsis
      "Targeting utilities for compilers and related tools")
    (description
      "Targeting utilities for compilers and related tools")
    (license license:asl2.0)))

(define-public rust-tempdir-0.3
  (package
    (name "rust-tempdir")
    (version "0.3.7")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "tempdir" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1n5n86zxpgd85y0mswrp5cfdisizq2rv3la906g6ipyc03xvbwhm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-rand" ,rust-rand-0.4)
        ("rust-remove-dir-all" ,rust-remove-dir-all-0.5))))
    (home-page "https://github.com/rust-lang-deprecated/tempdir")
    (synopsis "Temporary directory management for Rust")
    (description
     "This package provides a library for managing a temporary directory and
deleting all contents when it's dropped.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-tempfile-3.1
  (package
    (name "rust-tempfile")
    (version "3.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "tempfile" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1a9cfdqw70n7bcnkx05aih9xdba8lqazmqlkjpkmn2la6gcj8vks"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-rand" ,rust-rand-0.7)
        ("rust-redox-syscall" ,rust-redox-syscall-0.1)
        ("rust-remove-dir-all" ,rust-remove-dir-all-0.5)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://stebalien.com/projects/tempfile-rs")
    (synopsis "Library for managing temporary files and directories")
    (description
     "This package provides a library for managing temporary files and
directories.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-tempfile-3.0
  (package
    (inherit rust-tempfile-3.1)
    (name "rust-tempfile")
    (version "3.0.8")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "tempfile" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1vqk7aq2l04my2r3jiyyxirnf8f90nzcvjasvrajivb85s7p7i3x"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-rand" ,rust-rand-0.6)
        ("rust-redox-syscall" ,rust-redox-syscall-0.1)
        ("rust-remove-dir-all" ,rust-remove-dir-all-0.5)
        ("rust-winapi" ,rust-winapi-0.3))))))

(define-public rust-tendril-0.4
  (package
    (name "rust-tendril")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tendril" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0fsx7blrrzgca8aa2yqy8zxyi8s7amskhgkk1ml5sbaqyalyszvh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-encoding" ,rust-encoding-0.2)
        ("rust-encoding-rs" ,rust-encoding-rs-0.8)
        ("rust-futf" ,rust-futf-0.1)
        ("rust-mac" ,rust-mac-0.1)
        ("rust-utf-8" ,rust-utf-8-0.7))
       #:cargo-development-inputs
       (("rust-rand" ,rust-rand-0.4))))
    (home-page "https://github.com/servo/tendril")
    (synopsis "Compact buffer/string type for zero-copy parsing")
    (description
     "Compact buffer/string type for zero-copy parsing.")
    (license (list license:expat license:asl2.0))))

(define-public rust-term-0.6
 (package
   (name "rust-term")
   (version "0.6.1")
   (source
    (origin
      (method url-fetch)
      (uri (crate-uri "term" version))
      (file-name
       (string-append name "-" version ".tar.gz"))
      (sha256
       (base32
        "1ddqxq9hrk8zqq1f8pqhz72vrlfc8vh2xcza2gb623z78lrkm1n0"))))
   (build-system cargo-build-system)
   (arguments
    `(#:cargo-inputs
      (("rust-dirs" ,rust-dirs-2.0)
       ("rust-winapi" ,rust-winapi-0.3))))
   (home-page "https://github.com/Stebalien/term")
   (synopsis "Terminal formatting library")
   (description
    "This package provides a terminal formatting library.")
   (license (list license:expat license:asl2.0))))

(define-public rust-term-0.5
  (package
    (inherit rust-term-0.6)
    (name "rust-term")
    (version "0.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "term" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0hkgjrfisj6zjwz525639pmsvzhlc48a0h65nw87qrdp6jihdlgd"))))
    (arguments
     `(#:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-dirs" ,rust-dirs-1.0)
        ("rust-winapi" ,rust-winapi-0.3))))))

(define-public rust-term-0.4
  (package
    (inherit rust-term-0.6)
    (name "rust-term")
    (version "0.4.6")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "term" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1wbh8ngqkqr3f6wz902yplf60bd5yapnckvrkgmzp5nffi7n8qzs"))))
    (arguments
     `(#:cargo-inputs
       (("rust-kernel32-sys" ,rust-kernel32-sys-0.2)
        ("rust-winapi" ,rust-winapi-0.2))))))

(define-public rust-term-grid-0.1
  (package
    (name "rust-term-grid")
    (version "0.1.7")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "term_grid" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1kq2sy3b8329jrsrpcvijvyz4gbqjyvyy6c3n0wmmvda9y03w393"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-unicode-width" ,rust-unicode-width-0.1))))
    (home-page "https://github.com/ogham/rust-term-grid")
    (synopsis "Library for formatting strings into a grid layout")
    (description "This package provides a library for formatting strings into a
grid layout.")
    (license license:expat)))

(define-public rust-term-size-1.0
  (package
    (name "rust-term-size")
    (version "1.0.0-beta1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "term_size" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "13w9cqjhzh3mmx6zami8lxyf42xx53yy866zxhxqcm71k637v8d8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-clippy" ,rust-clippy-0.0)
        ("rust-kernel32-sys" ,rust-kernel32-sys-0.2)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/clap-rs/term_size-rs")
    (synopsis "Determine terminal sizes and dimensions")
    (description
     "Functions for determining terminal sizes and dimensions")
    (license (list license:asl2.0 license:expat))))

(define-public rust-term-size-0.3
  (package
    (inherit rust-term-size-1.0)
    (name "rust-term-size")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "term_size" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "09wk3173ngmb710qs9rwgibq4w250q8lgnwjvb9cypc1vdk9lnwy"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-clippy" ,rust-clippy-0.0)
        ("rust-kernel32-sys" ,rust-kernel32-sys-0.2)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-winapi" ,rust-winapi-0.2))))))

(define-public rust-termcolor-1.0
  (package
    (name "rust-termcolor")
    (version "1.0.5")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "termcolor" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0vjfsn1a8zvqhnrbygrz1id6yckwv1dncw3w4zj65qdx0f00kmln"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-wincolor" ,rust-wincolor-1.0))))
    (home-page "https://github.com/BurntSushi/termcolor")
    (synopsis "Library for writing colored text to a terminal")
    (description "This package provides a simple cross platform library for
writing colored text to a terminal.")
    (license (list license:unlicense
                   license:expat))))

(define-public rust-terminfo-0.6
  (package
    (name "rust-terminfo")
    (version "0.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "terminfo" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "17k8vqvicd6yg0iqmkjnxjhz8h8pknv86r03nq3f3ayjmxdhclcf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-fnv" ,rust-fnv-1.0)
        ("rust-nom" ,rust-nom-4.2)
        ("rust-phf" ,rust-phf-0.7)
        ("rust-phf-codegen" ,rust-phf-codegen-0.7))))
    (home-page "https://github.com/meh/rust-terminfo")
    (synopsis "Terminal information")
    (description "Terminal capabilities with type-safe getters.")
    (license license:wtfpl2)))

(define-public rust-termion-1.5
  (package
    (name "rust-termion")
    (version "1.5.5")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "termion" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "01f9787d5nx445bqbj644v38bn0hl2swwjy9baz0dnbqi6fyqb62"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f      ; Tests want a terminal.
       #:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-numtoa" ,rust-numtoa-0.1)
        ("rust-redox-syscall" ,rust-redox-syscall-0.1)
        ("rust-redox-termios" ,rust-redox-termios-0.1))))
    (home-page "https://gitlab.redox-os.org/redox-os/termion")
    (synopsis "Library for manipulating terminals")
    (description
     "This package provides a bindless library for manipulating terminals.")
    (license license:expat)))

(define-public rust-termios-0.3
  (package
    (name "rust-termios")
    (version "0.3.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "termios" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "09any1p4jp4bphvb5ikagnvwjc3xn2djchy96nkpa782xb2j1dkj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2))))
    (home-page  "https://github.com/dcuddeback/termios-rs")
    (synopsis "Safe bindings for the termios library")
    (description
     "The termios crate provides safe bindings for the Rust programming language
to the terminal I/O interface implemented by Unix operating systems.  The safe
bindings are a small wrapper around the raw C functions, which converts integer
return values to @code{std::io::Result} to indicate success or failure.")
    (license license:expat)))

(define-public rust-test-assembler-0.1
  (package
    (name "rust-test-assembler")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "test-assembler" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1sdx9hk0dk3z9crm8834ysyxsi92chls8arpd0gs796kis6lik2w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1.3))))
    (home-page "https://github.com/luser/rust-test-assembler")
    (synopsis "Build complex binary streams")
    (description
     "This package provides a set of types for building complex binary
streams.")
    (license license:expat)))

(define-public rust-tester-0.5
  (package
    (name "rust-tester")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tester" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1xkgapz2i4j977f6kh1zp6sa5llbhy5vbnr6kfj8czsrdjr2r0ay"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-getopts" ,rust-getopts-0.2)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-term" ,rust-term-0.4))))
    (home-page
     "https://github.com/messense/rustc-test")
    (synopsis
     "Fork of Rust's test crate")
    (description
     "This package provides a fork of Rust's test crate that doesn't require
unstable language features.")
    (license (list license:expat license:asl2.0))))

(define-public rust-textwrap-0.11
  (package
    (name "rust-textwrap")
    (version "0.11.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "textwrap" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0q5hky03ik3y50s9sz25r438bc4nwhqc6dqwynv4wylc807n29nk"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/mgeisler/textwrap")
    (synopsis "Library for word wrapping, indenting, and dedenting strings")
    (description
     "Textwrap is a small library for word wrapping, indenting, and dedenting
strings.  You can use it to format strings (such as help and error messages)
for display in commandline applications.  It is designed to be efficient and
handle Unicode characters correctly.")
    (properties '((hidden? . #t)))
    (license license:expat)))

(define-public rust-thiserror-1.0
  (package
    (name "rust-thiserror")
    (version "1.0.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "thiserror" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0zlp3kzjssl1ndqmn7cipqnyggq4851ghhqj4bfc4fxk2hc7sdbg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-thiserror-impl" ,rust-thiserror-impl-1.0))
       #:cargo-development-inputs
       (("rust-anyhow" ,rust-anyhow-1.0)
        ("rust-ref-cast" ,rust-ref-cast-1.0)
        ("rust-rustversion" ,rust-rustversion-1.0)
        ("rust-trybuild" ,rust-trybuild-1.0))))
    (home-page "https://github.com/dtolnay/thiserror")
    (synopsis "derive(Error)")
    (description "This package provides @code{derive(Error)} in Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-thiserror-impl-1.0
  (package
    (name "rust-thiserror-impl")
    (version "1.0.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "thiserror-impl" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1vxzhb98pm5yrq9mmcz50bgpml35iyx7lwjgi4v89sq7ag92abpb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1.0)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-1.0))))
    (home-page "https://github.com/dtolnay/thiserror")
    (synopsis "Implementation detail of the thiserror crate")
    (description "This package provides an implementation detail of the
@code{thiserror} crate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-thread-id-3.3
  (package
    (name "rust-thread-id")
    (version "3.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "thread-id" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1h90v19fjz3x9b25ywh68z5yf2zsmm6h5zb4rl302ckbsp4z9yy7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-redox-syscall" ,rust-redox-syscall-0.1)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/ruuda/thread-id")
    (synopsis "Get a unique ID for the current thread in Rust")
    (description
     "For diagnostics and debugging it can often be useful to get an ID that is
different for every thread.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-thread-id-2.0
  (package
    (inherit rust-thread-id-3.3)
    (name "rust-thread-id")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "thread-id" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "00zzs2bx1xw8aqm5plqqgr7bc2zz6zkqrdxq8vpiqb8hc2srslx9"))))
    (arguments
     `(#:cargo-inputs
       (("rust-kernel32-sys" ,rust-kernel32-sys-0.2)
        ("rust-libc" ,rust-libc-0.2))))))

(define-public rust-thread-local-1.0
  (package
    (name "rust-thread-local")
    (version "1.0.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "thread_local" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "054vlrr1vsdy1h4b7n99mr24pnj8928ig9qwzg36wnkld4dns36l"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-lazy-static" ,rust-lazy-static-1))))
    (home-page "https://github.com/Amanieu/thread_local-rs")
    (synopsis "Per-object thread-local storage")
    (description "Per-object thread-local storage.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-thread-local-0.3
  (package
    (inherit rust-thread-local-1.0)
    (name "rust-thread-local")
    (version "0.3.6")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "thread_local" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "06rzik99p8c5js8238yhc8rk6np543ylb1dy9nrw5v80j0r3xdf6"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-lazy-static" ,rust-lazy-static-1))))))

(define-public rust-thread-local-0.2
  (package
    (inherit rust-thread-local-0.3)
    (name "rust-thread-local")
    (version "0.2.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "thread_local" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1mgxikqvhpsic6xk7pan95lvgsky1sdxzw2w5m2l35pgrazxnxl5"))))
    (arguments
     `(#:cargo-inputs
       (("rust-thread-id" ,rust-thread-id-2.0))))))

(define-public rust-threadpool-1.7
  (package
    (name "rust-threadpool")
    (version "1.7.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "threadpool" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0rd89n1q7vy47w4c32cnynibffv9kj3jy3dwr0536n9lbw5ckw72"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-num-cpus" ,rust-num-cpus-1.11))))
    (home-page "https://github.com/rust-threadpool/rust-threadpool")
    (synopsis "Thread pool for running jobs on a fixed set of worker threads")
    (description
     "This package provides a thread pool for running a number of jobs on a
fixed set of worker threads.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-tiff-0.3
  (package
    (name "rust-tiff")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tiff" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0zgmbny2f8rssqmjdfvnysy0vqwcvlwl6q9f5yixhavlqk7w5dyp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f      ; Tests images not included with release.
       #:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-lzw" ,rust-lzw-0.10)
        ("rust-num-derive" ,rust-num-derive-0.2)
        ("rust-num-traits" ,rust-num-traits-0.2))
       #:cargo-development-inputs
       (("rust-tempfile" ,rust-tempfile-3.0))))
    (home-page "https://github.com/image-rs/image-tiff")
    (synopsis
     "TIFF decoding and encoding library in pure Rust")
    (description
     "TIFF decoding and encoding library in pure Rust.")
    (license license:expat)))

(define-public rust-tiff-0.2
  (package
    (inherit rust-tiff-0.3)
    (name "rust-tiff")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tiff" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1kn7psgpacns337vvqh272rkqwnakmjd51rc7ygwnc03ibr38j0y"))))
    (arguments
     `(#:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-lzw" ,rust-lzw-0.10)
        ("rust-num-derive" ,rust-num-derive-0.2)
        ("rust-num-traits" ,rust-num-traits-0.2))))))

(define-public rust-time-0.1
  (package
    (name "rust-time")
    (version "0.1.42")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "time" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0vsbvsz0ryxb35dy9j4anxvy8zlaplmjmi0a4z4l64bc135cz3fv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-redox-syscall" ,rust-redox-syscall-0.1)
        ("rust-rustc-serialize" ,rust-rustc-serialize-0.3)
        ("rust-winapi" ,rust-winapi-0.3))
       #:cargo-development-inputs
       (("rust-log" ,rust-log-0.4)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/time-rs/time")
    (synopsis "Simple time handling in Rust")
    (description
     "This package provides utilities for working with time-related functions
in Rust.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-tinytemplate-1.0
  (package
    (name "rust-tinytemplate")
    (version "1.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tinytemplate" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "06ipxjwl1w6synvql8b50qxbqv0w04agvmmfqcdynr9ygmkcd8sp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-serde" ,rust-serde-1.0)
        ("rust-serde-json" ,rust-serde-json-1.0))
       #:cargo-development-inputs
       (("rust-criterion" ,rust-criterion-0.3)
        ("rust-serde-derive" ,rust-serde-derive-1.0))))
    (home-page "https://github.com/bheisler/TinyTemplate")
    (synopsis "Simple, lightweight template engine")
    (description
     "Simple, lightweight template engine.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-tokio-0.1
  (package
    (name "rust-tokio")
    (version "0.1.21")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "11ra8jp3fj70a2zrqmd6as7wgpwiiyzjf50gz89i8r7wpksgqbzc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-bytes" ,rust-bytes-0.4)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-mio" ,rust-mio-0.6)
        ("rust-miow" ,rust-miow-0.3)
        ("rust-num-cpus" ,rust-num-cpus-1.10)
        ("rust-tokio-codec" ,rust-tokio-codec-0.1)
        ("rust-tokio-current-thread" ,rust-tokio-current-thread-0.1)
        ("rust-tokio-executor" ,rust-tokio-executor-0.1)
        ("rust-tokio-fs" ,rust-tokio-fs-0.1)
        ("rust-tokio-io" ,rust-tokio-io-0.1)
        ("rust-tokio-reactor" ,rust-tokio-reactor-0.1)
        ("rust-tokio-sync" ,rust-tokio-sync-0.1)
        ("rust-tokio-tcp" ,rust-tokio-tcp-0.1)
        ("rust-tokio-threadpool" ,rust-tokio-threadpool-0.1)
        ("rust-tokio-timer" ,rust-tokio-timer-0.2)
        ("rust-tokio-trace-core" ,rust-tokio-trace-core-0.2)
        ("rust-tokio-udp" ,rust-tokio-udp-0.1)
        ("rust-tokio-uds" ,rust-tokio-uds-0.2))
       #:cargo-development-inputs
       (("rust-env-logger" ,rust-env-logger-0.6)
        ("rust-flate2" ,rust-flate2-1.0)
        ("rust-futures-cpupool" ,rust-futures-cpupool-0.1)
        ("rust-http" ,rust-http-0.1)
        ("rust-httparse" ,rust-httparse-1.3)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-num-cpus" ,rust-num-cpus-1.10)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-serde-json" ,rust-serde-json-1.0)
        ("rust-time" ,rust-time-0.1))))
    (home-page "https://tokio.rs")
    (synopsis "Event-driven, non-blocking I/O platform")
    (description
     "An event-driven, non-blocking I/O platform for writing asynchronous I/O
backed applications.")
    (license license:expat)))

;; Cyclic dependency with tokio-io
(define-public rust-tokio-codec-0.1
  (package
    (name "rust-tokio-codec")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-codec" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "17y3hi3dd0bdfkrzshx9qhwcf49xv9iynszj7iwy3w4nmz71wl2w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-bytes" ,rust-bytes-0.4)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-tokio-io" ,rust-tokio-io-0.1))))
    (home-page "https://tokio.rs")
    (synopsis
     "Utilities for encoding and decoding frames")
    (description
     "Utilities for encoding and decoding frames.")
    (license license:expat)))

(define-public rust-tokio-core-0.1
  (package
    (name "rust-tokio-core")
    (version "0.1.17")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-core" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0wbgg59mxfvrhzv97y56nh3gmnmw3jj9dhgkmvz27410jjxzpvxf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-bytes" ,rust-bytes-0.4)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-iovec" ,rust-iovec-0.1)
        ("rust-log" ,rust-log-0.4)
        ("rust-mio" ,rust-mio-0.6)
        ("rust-scoped-tls" ,rust-scoped-tls-0.1)
        ("rust-tokio" ,rust-tokio-0.1)
        ("rust-tokio-executor" ,rust-tokio-executor-0.1)
        ("rust-tokio-io" ,rust-tokio-io-0.1)
        ("rust-tokio-reactor" ,rust-tokio-reactor-0.1)
        ("rust-tokio-timer" ,rust-tokio-timer-0.2))
       #:cargo-development-inputs
       (("rust-env-logger" ,rust-env-logger-0.4)
        ("rust-flate2" ,rust-flate2-1.0)
        ("rust-futures-cpupool" ,rust-futures-cpupool-0.1)
        ("rust-http" ,rust-http-0.1)
        ("rust-httparse" ,rust-httparse-1.3)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-num-cpus" ,rust-num-cpus-1.10)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-serde-json" ,rust-serde-json-1.0)
        ("rust-time" ,rust-time-0.1))))
    (home-page "https://tokio.rs")
    (synopsis
     "Core I/O and event loop primitives for asynchronous I/O in Rust")
    (description
     "Core I/O and event loop primitives for asynchronous I/O in Rust.
Foundation for the rest of the tokio crates.")
    (license (list license:expat license:asl2.0))))

(define-public rust-tokio-current-thread-0.1
  (package
    (name "rust-tokio-current-thread")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-current-thread" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0hx4c8v88kk0ih8x5s564gsgwwf8n11kryvxm72l1f7isz51fqni"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-futures" ,rust-futures-0.1)
        ("rust-tokio-executor" ,rust-tokio-executor-0.1))))
    (home-page "https://github.com/tokio-rs/tokio")
    (synopsis
     "Manage many tasks concurrently on the current thread")
    (description
     "Single threaded executor which manage many tasks concurrently on
the current thread.")
    (license license:expat)))

;; Cyclic dependency with rust-tokio.
(define-public rust-tokio-executor-0.1
  (package
    (name "rust-tokio-executor")
    (version "0.1.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-executor" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0pjmgpg58k3hf5q9w6xjljsv8xy66lf734qnfwsc0g3pq3349sl3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-crossbeam-utils" ,rust-crossbeam-utils-0.6)
        ("rust-futures" ,rust-futures-0.1))
       #:cargo-development-inputs
       (("rust-tokio" ,rust-tokio-0.1))))
    (home-page "https://github.com/tokio-rs/tokio")
    (synopsis "Future execution primitives")
    (description "Future execution primitives.")
    (license license:expat)))

(define-public rust-tokio-fs-0.1
  (package
    (name "rust-tokio-fs")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-fs" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1bxp8585pi4j5g39ci2gkk99qnyilyhhila7cs8r6scdn0idrriz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-futures" ,rust-futures-0.1)
        ("rust-tokio-io" ,rust-tokio-io-0.1)
        ("rust-tokio-threadpool" ,rust-tokio-threadpool-0.1))
       #:cargo-development-inputs
       (("rust-rand" ,rust-rand-0.4)
        ("rust-tempdir" ,rust-tempdir-0.3)
        ("rust-tempfile" ,rust-tempfile-3.0)
        ("rust-tokio" ,rust-tokio-0.1)
        ("rust-tokio-codec" ,rust-tokio-codec-0.1)
        ("rust-tokio-io" ,rust-tokio-io-0.1))))
    (home-page "https://tokio.rs")
    (synopsis "Filesystem API for Tokio")
    (description "Filesystem API for Tokio.")
    (license license:expat)))

;; Cyclic dependencies with tokio and tokio-current-thread
(define-public rust-tokio-io-0.1
  (package
    (name "rust-tokio-io")
    (version "0.1.13")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-io" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0x06zyzinans1pn90g6i150lgixijdf1cg8y2gipjd09ms58dz2p"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-bytes" ,rust-bytes-0.4)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-log" ,rust-log-0.4))
       #:cargo-development-inputs
       (("rust-tokio-current-thread" ,rust-tokio-current-thread-0.1))))
    (home-page "https://tokio.rs")
    (synopsis
     "Core I/O primitives for asynchronous I/O in Rust")
    (description
     "Core I/O primitives for asynchronous I/O in Rust.")
    (license license:expat)))

(define-public rust-tokio-io-pool-0.1
  (package
    (name "rust-tokio-io-pool")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-io-pool" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "17lrjj7lcw13wchpbvr8cynmypd29h40clf9qxabh6fxva40kwm5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-futures" ,rust-futures-0.1)
        ("rust-num-cpus" ,rust-num-cpus-1.10)
        ("rust-tokio" ,rust-tokio-0.1)
        ("rust-tokio-executor" ,rust-tokio-executor-0.1))
       #:cargo-development-inputs
       (("rust-tokio-current-thread" ,rust-tokio-current-thread-0.1))))
    (home-page "https://github.com/jonhoo/tokio-io-pool")
    (synopsis "Execute short, I/O-heavy futures efficiently")
    (description
     "Alternative tokio thread pool for executing short, I/O-heavy
futures efficiently")
    (license (list license:asl2.0 license:expat))))

(define-public rust-tokio-mock-task-0.1
  (package
    (name "rust-tokio-mock-task")
    (version "0.1.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "tokio-mock-task" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1y7q83qfk9ljjfvs82b453pmz9x1v3d6kr4x55j8mal01s6790dw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-futures" ,rust-futures-0.1))))
    (home-page  "https://github.com/carllerche/tokio-mock-task")
    (synopsis "Mock a Tokio task")
    (description "Mock a Tokio task.")
    (license license:expat)))

(define-public rust-tokio-process-0.2
  (package
    (name "rust-tokio-process")
    (version "0.2.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-process" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1s6vi5n5iax4ksx3bzpfdhfbngj49mvq5n40np1d4aycp3qnxgdg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-crossbeam-queue" ,rust-crossbeam-queue-0.1)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-mio" ,rust-mio-0.6)
        ("rust-mio-named-pipes" ,rust-mio-named-pipes-0.1)
        ("rust-tokio-io" ,rust-tokio-io-0.1)
        ("rust-tokio-reactor" ,rust-tokio-reactor-0.1)
        ("rust-tokio-signal" ,rust-tokio-signal-0.2)
        ("rust-winapi" ,rust-winapi-0.3))
       #:cargo-development-inputs
       (("rust-failure" ,rust-failure-0.1)
        ("rust-log" ,rust-log-0.4)
        ("rust-tokio" ,rust-tokio-0.1))))
    (home-page "https://github.com/tokio-rs/tokio")
    (synopsis
     "Asynchronous process management backed futures")
    (description
     "An implementation of an asynchronous process management backed
futures.")
    (license license:expat)))

(define-public rust-tokio-reactor-0.1
  (package
    (name "rust-tokio-reactor")
    (version "0.1.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-reactor" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1khip64cn63xvayq1db68kxcnhgw3cb449a4n2lbw4p1qzx6pwba"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-crossbeam-utils" ,rust-crossbeam-utils-0.6)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-log" ,rust-log-0.4)
        ("rust-mio" ,rust-mio-0.6)
        ("rust-num-cpus" ,rust-num-cpus-1.10)
        ("rust-parking-lot" ,rust-parking-lot-0.7)
        ("rust-slab" ,rust-slab-0.4)
        ("rust-tokio-executor" ,rust-tokio-executor-0.1)
        ("rust-tokio-io" ,rust-tokio-io-0.1)
        ("rust-tokio-sync" ,rust-tokio-sync-0.1))
       #:cargo-development-inputs
       (("rust-num-cpus" ,rust-num-cpus-1.10)
        ("rust-tokio" ,rust-tokio-0.1)
        ("rust-tokio-io-pool" ,rust-tokio-io-pool-0.1))))
    (home-page "https://tokio.rs")
    (synopsis
     "Event loop that drives Tokio I/O resources")
    (description
     "Event loop that drives Tokio I/O resources.")
    (license license:expat)))

(define-public rust-tokio-signal-0.2
  (package
    (name "rust-tokio-signal")
    (version "0.2.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-signal" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "15l27cvhfcjsahwnm2pgsm0690w0xj1h1sbdl5wy6p50dqkwavfx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-futures" ,rust-futures-0.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-mio" ,rust-mio-0.6)
        ("rust-mio-uds" ,rust-mio-uds-0.6)
        ("rust-signal-hook" ,rust-signal-hook-0.1)
        ("rust-tokio-executor" ,rust-tokio-executor-0.1)
        ("rust-tokio-io" ,rust-tokio-io-0.1)
        ("rust-tokio-reactor" ,rust-tokio-reactor-0.1)
        ("rust-winapi" ,rust-winapi-0.3))
       #:cargo-development-inputs
       (("rust-tokio" ,rust-tokio-0.1))))
    (home-page "https://github.com/tokio-rs/tokio")
    (synopsis
     "Asynchronous Unix signal handling backed futures")
    (description
     "An implementation of an asynchronous Unix signal handling backed
futures.")
    (license license:expat)))

(define-public rust-tokio-sync-0.1
  (package
    (name "rust-tokio-sync")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-sync" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ryalh7dcmnz46xj1va8aaw3if6vd4mj87r67dqvrqhpyf7j8qi1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-fnv" ,rust-fnv-1.0)
        ("rust-futures" ,rust-futures-0.1))
       #:cargo-development-inputs
       (("rust-env-logger" ,rust-env-logger-0.6)
        ("rust-loom" ,rust-loom-0.1)
        ("rust-tokio" ,rust-tokio-0.1)
        ("rust-tokio-mock-task" ,rust-tokio-mock-task-0.1))))
    (home-page "https://tokio.rs")
    (synopsis "Synchronization utilities")
    (description "Synchronization utilities.")
    (license license:expat)))

(define-public rust-tokio-tcp-0.1
  (package
    (name "rust-tokio-tcp")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-tcp" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "06a15vg8bcd33ng3h9ldzlq7wl4jsw0p9qpy7v22ls5yah3b250x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-bytes" ,rust-bytes-0.4)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-iovec" ,rust-iovec-0.1)
        ("rust-mio" ,rust-mio-0.6)
        ("rust-tokio-io" ,rust-tokio-io-0.1)
        ("rust-tokio-reactor" ,rust-tokio-reactor-0.1))
       #:cargo-development-inputs
       (("rust-env-logger" ,rust-env-logger-0.6)
        ("rust-tokio" ,rust-tokio-0.1))))
    (home-page "https://tokio.rs")
    (synopsis "TCP bindings for tokio")
    (description "TCP bindings for tokio.")
    (license license:expat)))

(define-public rust-tokio-threadpool-0.1
  (package
    (name "rust-tokio-threadpool")
    (version "0.1.14")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-threadpool" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1wkj3wixicsqvllm8w74b24knw6mdn00zslm8l9fm1p81gr8lmbj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-crossbeam-deque" ,rust-crossbeam-deque-0.7)
        ("rust-crossbeam-queue" ,rust-crossbeam-queue-0.1)
        ("rust-crossbeam-utils" ,rust-crossbeam-utils-0.6)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-log" ,rust-log-0.4)
        ("rust-num-cpus" ,rust-num-cpus-1.10)
        ("rust-rand" ,rust-rand-0.4)
        ("rust-slab" ,rust-slab-0.4)
        ("rust-tokio-executor" ,rust-tokio-executor-0.1))
       #:cargo-development-inputs
       (("rust-env-logger" ,rust-env-logger-0.6)
        ("rust-futures-cpupool" ,rust-futures-cpupool-0.1)
        ("rust-threadpool" ,rust-threadpool-1.7))))
    (home-page "https://github.com/tokio-rs/tokio")
    (synopsis
     "Task scheduler backed by a work-stealing thread pool")
    (description
     "This package provides a task scheduler backed by a work-stealing thread
pool.")
    (license license:expat)))

(define-public rust-tokio-timer-0.2
  (package
    (name "rust-tokio-timer")
    (version "0.2.11")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-timer" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "03m68ainkdy3b5pf20rjyknhk2ppx35bjdc2yfj2bv80sl96h47j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-crossbeam-utils" ,rust-crossbeam-utils-0.6)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-slab" ,rust-slab-0.4)
        ("rust-tokio-executor" ,rust-tokio-executor-0.1))
       #:cargo-development-inputs
       (("rust-rand" ,rust-rand-0.4)
        ("rust-tokio" ,rust-tokio-0.1)
        ("rust-tokio-mock-task" ,rust-tokio-mock-task-0.1))))
    (home-page "https://github.com/tokio-rs/tokio")
    (synopsis "Timer facilities for Tokio")
    (description "Timer facilities for Tokio.")
    (license license:expat)))

(define-public rust-tokio-trace-core-0.2
  (package
    (name "rust-tokio-trace-core")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-trace-core" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "04y6c2r4ddzk02xb3hn60s9a1w92h0g8pzmxwaspqvwmsrba5j59"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static-1))))
    (home-page "https://tokio.rs")
    (synopsis "Core primitives for tokio-trace")
    (description "Core primitives for tokio-trace.")
    (license license:expat)))

(define-public rust-tokio-udp-0.1
  (package
    (name "rust-tokio-udp")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-udp" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "14kfj35s465czcspayacnzlxrazfvxzhhggq1rqlljhgp1sqa9k6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-bytes" ,rust-bytes-0.4)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-log" ,rust-log-0.4)
        ("rust-mio" ,rust-mio-0.6)
        ("rust-tokio-codec" ,rust-tokio-codec-0.1)
        ("rust-tokio-io" ,rust-tokio-io-0.1)
        ("rust-tokio-reactor" ,rust-tokio-reactor-0.1))
       #:cargo-development-inputs
       (("rust-env-logger" ,rust-env-logger-0.6))))
    (home-page "https://tokio.rs")
    (synopsis "UDP bindings for tokio")
    (description "UDP bindings for tokio.")
    (license license:expat)))

(define-public rust-tokio-uds-0.2
  (package
    (name "rust-tokio-uds")
    (version "0.2.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-uds" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0i94kxma6l7iy5hd5k7nvn7v9pnyw0s54bm9mjs0lap1l0xzqzq3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-bytes" ,rust-bytes-0.4)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-iovec" ,rust-iovec-0.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-mio" ,rust-mio-0.6)
        ("rust-mio-uds" ,rust-mio-uds-0.6)
        ("rust-tokio-codec" ,rust-tokio-codec-0.1)
        ("rust-tokio-io" ,rust-tokio-io-0.1)
        ("rust-tokio-reactor" ,rust-tokio-reactor-0.1))
       #:cargo-development-inputs
       (("rust-tempfile" ,rust-tempfile-3.0)
        ("rust-tokio" ,rust-tokio-0.1))))
    (home-page "https://github.com/tokio-rs/tokio")
    (synopsis "Unix Domain sockets for Tokio")
    (description "Unix Domain sockets for Tokio.")
    (license license:expat)))

(define-public rust-toml-0.5
  (package
    (name "rust-toml")
    (version "0.5.6")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "toml" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "06n7j8z63hj6g0kj2x6sqwxnm4q3s0q5d873bdk41vqy1cb2vjgz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
        (("rust-indexmap" ,rust-indexmap-1.0)
         ("rust-serde" ,rust-serde-1.0))
        #:cargo-development-inputs
        (("rust-serde-derive" ,rust-serde-derive-1.0)
         ("rust-serde-json" ,rust-serde-json-1.0))))
    (home-page "https://github.com/alexcrichton/toml-rs")
    (synopsis "Rust encoder and decoder of TOML-formatted files and streams")
    (description
     "This package provides a native Rust encoder and decoder of TOML-formatted
files and streams.  Provides implementations of the standard
Serialize/Deserialize traits for TOML data to facilitate deserializing and
serializing Rust structures.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-toml-0.2
  (package
    (name "rust-toml")
    (version "0.2.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "toml" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1d1cz43bxrx4fd6j2p6myckf81f72bp47akg36y3flxjkhj60svk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-rustc-serialize" ,rust-rustc-serialize-0.3)
        ("rust-serde" ,rust-serde-0.8))))
    (home-page "https://github.com/alexcrichton/toml-rs")
    (synopsis "Rust encoder and decoder of TOML-formatted files and streams")
    (description
     "This package provides a native Rust encoder and decoder of TOML-formatted
files and streams.  Provides implementations of the standard
Serialize/Deserialize traits for TOML data to facilitate deserializing and
serializing Rust str")
    (license (list license:expat license:asl2.0))))

(define-public rust-tracing-core-0.1
  (package
    (name "rust-tracing-core")
    (version "0.1.9")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "tracing-core" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0y0rcvvqq89yaiz0qdx88byxgz8j6hsm9slq8d5vvf3jwc8nz90k"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static-1))))
    (home-page "https://tokio.rs")
    (synopsis "Core primitives for application-level tracing")
    (description
     "Core primitives for application-level tracing.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-traitobject-0.1
  (package
    (name "rust-traitobject")
    (version "0.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "traitobject" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0yb0n8822mr59j200fyr2fxgzzgqljyxflx9y8bdy3rlaqngilgg"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/reem/rust-traitobject")
    (synopsis "Unsafe helpers for dealing with raw trait objects")
    (description "Unsafe helpers for dealing with raw trait objects.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-try-from-0.3
  (package
    (name "rust-try-from")
    (version "0.3.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "try_from" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "12wdd4ja7047sd3rx70hv2056hyc8gcdllcx3a41g1rnw64kng98"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1))))
    (home-page "https://github.com/derekjw/try_from")
    (synopsis "TryFrom and TryInto traits for failable conversions")
    (description
     "TryFrom and TryInto traits for failable conversions that return a Result.")
    (license license:expat)))

(define-public rust-try-lock-0.2
  (package
    (name "rust-try-lock")
    (version "0.2.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "try-lock" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "10p36rx6pqi9d0zr876xa8vksx2m66ha45myakl50rn08dxyn176"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/seanmonstar/try-lock")
    (synopsis "Lightweight atomic lock")
    (description
     "This package provides a lightweight atomic lock.")
    (license license:expat)))

(define-public rust-trybuild-1.0
  (package
    (name "rust-trybuild")
    (version "1.0.23")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "trybuild" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "080j808nv6nyr1mmw23vwdp4rkk7r38nmms850rih8lsclc1pzr6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-dissimilar" ,rust-dissimilar-1.0)
        ("rust-glob" ,rust-glob-0.3)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-json" ,rust-serde-json-1.0)
        ("rust-termcolor" ,rust-termcolor-1.0)
        ("rust-toml" ,rust-toml-0.5))))
    (home-page "https://github.com/dtolnay/trybuild")
    (synopsis "Test harness for ui tests of compiler diagnostics")
    (description
     "Test harness for ui tests of compiler diagnostics.")
    (license (list license:expat license:asl2.0))))

(define-public rust-typeable-0.1
  (package
    (name "rust-typeable")
    (version "0.1.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "typeable" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "11w8dywgnm32hb291izjvh4zjd037ccnkk77ahk63l913zwzc40l"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/reem/rust-typeable")
    (synopsis "Exposes Typeable, for getting TypeIds at runtime")
    (description "Exposes Typeable, for getting TypeIds at runtime.")
    (license license:expat)))

(define-public rust-typed-arena-1.4
  (package
    (name "rust-typed-arena")
    (version "1.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "typed-arena" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1i8yczhwcy0nnrxqck1lql3i7hvg95l0vw0dbgfb92zkms96mh66"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/SimonSapin/rust-typed-arena")
    (synopsis "The arena allocator")
    (description
     "The arena, a fast but limited type of allocator.")
    (license license:expat)))

(define-public rust-typemap-0.3
  (package
    (name "rust-typemap")
    (version "0.3.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "typemap" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1xm1gbvz9qisj1l6d36hrl9pw8imr8ngs6qyanjnsad3h0yfcfv5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-unsafe-any" ,rust-unsafe-any-0.4))))
    (home-page "https://github.com/reem/rust-typemap")
    (synopsis "Typesafe store for many value types")
    (description
     "A typesafe store for many value types.")
    (license license:expat)))

(define-public rust-typenum-1.10
  (package
    (name "rust-typenum")
    (version "1.10.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "typenum" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0sc1jirllfhdi52z1xv9yqzxzpk6v7vadd13n7wvs1wnjipn6bb1"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/paholg/typenum")
    (synopsis "Rust library for type-level numbers evaluated at compile time")
    (description "Typenum is a Rust library for type-level numbers evaluated at
compile time.  It currently supports bits, unsigned integers, and signed
integers.  It also provides a type-level array of type-level numbers, but its
implementation is incomplete.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-ucd-parse-0.1
  (package
    (name "rust-ucd-parse")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ucd-parse" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "13mq6c85r6ak10gjlq74mzdhsi0g0vps2y73by420513gfnipm97"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-regex" ,rust-regex-1.1))))
    (home-page "https://github.com/BurntSushi/ucd-generate")
    (synopsis "Parse data files in the Unicode character database")
    (description
     "This package provides a library for parsing data files in the
Unicode character database.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-ucd-trie-0.1
  (package
    (name "rust-ucd-trie")
    (version "0.1.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "ucd-trie" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1hh6kyzh5xygwy96wfmsf8v8czlzhps2lgbcyhj1xzy1w1xys04g"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-lazy-static" ,rust-lazy-static-1))))
    (home-page "https://github.com/BurntSushi/ucd-generate")
    (synopsis "Trie for storing Unicode codepoint sets and maps")
    (description
     "This package provides a trie for storing Unicode codepoint sets and maps.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-ucd-util-0.1
  (package
    (name "rust-ucd-util")
    (version "0.1.7")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "ucd-util" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "13ng291mkc9b132jjf4laj76f5nqm5qd2447rm8bry3wxbdc5kaw"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/BurntSushi/ucd-generate")
    (synopsis "library for working with the Unicode character database")
    (description "This package provides a small utility library for working
with the Unicode character database.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-unchecked-index-0.2
  (package
    (name "rust-unchecked-index")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unchecked-index" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0p6qcai1mjayx59cpgk27d0zgw9hz9r1ira5jiqil66f4ba8dfpf"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/bluss/unchecked-index")
    (synopsis "Unchecked indexing wrapper using regular index syntax")
    (description
     "Unchecked indexing wrapper using regular index syntax.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-unicase-2.6
  (package
    (name "rust-unicase")
    (version "2.6.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "unicase" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1xmlbink4ycgxrkjspp0mf7pghcx4m7vxq7fpfm04ikr2zk7pwsh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-version-check" ,rust-version-check-0.9))))
    (home-page "https://github.com/seanmonstar/unicase")
    (synopsis "Case-insensitive wrapper around strings")
    (description
     "This package provides a case-insensitive wrapper around strings.")
    (license (list license:expat license:asl2.0))))

(define-public rust-unicase-2.4
  (package
    (name "rust-unicase")
    (version "2.4.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "unicase" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1xmpmkakhhblq7dzab1kwyv925kv7fqjkjsxjspg6ix9n88makm8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-version-check" ,rust-version-check-0.1))))
    (home-page "https://github.com/seanmonstar/unicase")
    (synopsis "Case-insensitive wrapper around strings")
    (description
     "A case-insensitive wrapper around strings.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-unicase-1
  (package
    (inherit rust-unicase-2.4)
    (name "rust-unicase")
    (version "1.4.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "unicase" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0cwazh4qsmm9msckjk86zc1z35xg7hjxjykrgjalzdv367w6aivz"))))
    (arguments
     `(#:cargo-inputs
       (("rust-heapsize" ,rust-heapsize-0.3)
        ("rust-heapsize-plugin" ,rust-heapsize-plugin-0.1)
        ("rust-version-check" ,rust-version-check-0.1))))))

(define-public rust-unicode-bidi-0.3
  (package
    (name "rust-unicode-bidi")
    (version "0.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unicode-bidi" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1malx8ljgm7v1gbaazkn7iicy5wj0bwcyadj3l727a38ch6bvwj9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-flame" ,rust-flame-0.2)
        ("rust-flamer" ,rust-flamer-0.3)
        ("rust-matches" ,rust-matches-0.1)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-serde-test" ,rust-serde-test-1.0))))
    (home-page "https://github.com/servo/unicode-bidi")
    (synopsis "Implementation of the Unicode Bidirectional Algorithm")
    (description
     "Implementation of the Unicode Bidirectional Algorithm.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-unicode-normalization-0.1
  (package
    (name "rust-unicode-normalization")
    (version "0.1.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unicode-normalization" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "09i49va90rvia1agvgni4gicnqv50y5zy1naw8mr8bcqifh3j4ql"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-smallvec" ,rust-smallvec-0.6))))
    (home-page "https://github.com/unicode-rs/unicode-normalization")
    (synopsis
     "This crate provides functions for normalization of Unicode strings")
    (description
     "This crate provides functions for normalization of Unicode strings,
including Canonical and Compatible Decomposition and Recomposition, as
described in Unicode Standard Annex #15.")
    (license (list license:expat license:asl2.0))))

(define-public rust-unicode-segmentation-1.6
  (package
    (name "rust-unicode-segmentation")
    (version "1.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unicode-segmentation" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1h7d48mzpi8hwf5cvnq07warkv86pvapzzzf32hvbjsk20yiagp8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-quickcheck" ,rust-quickcheck-0.7))))
    (home-page "https://github.com/unicode-rs/unicode-segmentation")
    (synopsis "Grapheme Cluster, Word and Sentence boundaries")
    (description
     "This crate provides Grapheme Cluster, Word and Sentence
boundaries according to Unicode Standard Annex #29 rules.")
    (license (list license:expat license:asl2.0))))

(define-public rust-unicode-segmentation-1.3
  (package
    (inherit rust-unicode-segmentation-1.6)
    (name "rust-unicode-segmentation")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unicode-segmentation" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1a9jqg7rb1yq6w2xc9jgxcs111yk5vxm9afjfvykfnrmzk6z8rqr"))))))

(define-public rust-unicode-width-0.1
  (package
    (name "rust-unicode-width")
    (version "0.1.7")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "unicode-width" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0yflmxkxmm89ckrb3sz58whn491aycrj8cxra0hzzlb72x9rvana"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
        ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1.0)
        ("rust-rustc-std-workspace-std" ,rust-rustc-std-workspace-std-1.0))))
    (home-page "https://github.com/unicode-rs/unicode-width")
    (synopsis "Determine displayed width according to Unicode rules")
    (description "This crate allows you to determine displayed width of
@code{char} and @code{str} types according to Unicode Standard Annex #11 rules.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-unicode-xid-0.2
  (package
    (name "rust-unicode-xid")
    (version "0.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "unicode-xid" version))
        (file-name
          (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0z09fn515xm7zyr0mmdyxa9mx2f7azcpv74pqmg611iralwpcvl2"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/unicode-rs/unicode-xid")
    (synopsis "Determine Unicode XID related properties")
    (description "Determine whether characters have the XID_Start
or XID_Continue properties according to Unicode Standard Annex #31.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-unicode-xid-0.1
  (package
    (inherit rust-unicode-xid-0.2)
    (name "rust-unicode-xid")
    (version "0.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "unicode-xid" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1z57lqh4s18rr4x0j4fw4fmp9hf9346h0kmdgqsqx0fhjr3k0wpw"))))))

(define-public rust-unicode-xid-0.0
  (package
    (inherit rust-unicode-xid-0.2)
    (name "rust-unicode-xid")
    (version "0.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unicode-xid" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1p5l9h3n3i53cp95fb65p8q3vbwib79ryd9z5z5h5kr9gl6qc7wc"))))))

(define-public rust-unindent-0.1
  (package
    (name "rust-unindent")
    (version "0.1.5")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "unindent" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32 "14s97blyqgf9hzxk22iazrghj60midajkw2801dfspz3n2iqmwb3"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/dtolnay/indoc")
    (synopsis "Remove a column of leading whitespace from a string")
    (description "This crate allows you to remove a column of leading
whitespace from a string.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-unix-socket-0.5
  (package
    (name "rust-unix-socket")
    (version "0.5.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "unix_socket" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0r0mxf3mmqvimnx4mpks1f6c4haj6jcxc0k9bs7w61f42w2718ka"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/rust-lang-nursery/unix-socket")
    (synopsis "Unix domain socket bindings")
    (description "This package provides unix domain socket bindings.")
    (license (list license:expat license:asl2.0))))

(define-public rust-unreachable-1.0
  (package
    (name "rust-unreachable")
    (version "1.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "unreachable" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0mps2il4xy2mjqc3appas27hhn2xmvixc3bzzhfrjj74gy3i0a1q"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-void" ,rust-void-1.0))))
    (home-page "https://github.com/reem/rust-unreachable")
    (synopsis "Unreachable code optimization hint in rust")
    (description
     "This package provides an unreachable code optimization hint in rust.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-unsafe-any-0.4
  (package
    (name "rust-unsafe-any")
    (version "0.4.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "unsafe-any" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0zwwphsqkw5qaiqmjwngnfpv9ym85qcsyj7adip9qplzjzbn00zk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-traitobject" ,rust-traitobject-0.1))))
    (home-page "https://tokio.rs")
    (synopsis "Traits and implementations for unchecked downcasting")
    (description
     "Traits and implementations for unchecked downcasting.")
    (license license:expat)))

(define-public rust-untrusted-0.7
  (package
    (name "rust-untrusted")
    (version "0.7.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "untrusted" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1kmfykcwif6ashkwg54gcnhxj03kpba2i9vc7z5rpr0xlgvrwdk0"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/briansmith/untrusted")
    (synopsis "Zero-allocation parsing of untrusted inputs in Rust")
    (description
     "Safe, fast, zero-panic, zero-crashing, zero-allocation parsing of
untrusted inputs in Rust.")
    (license license:isc)))

(define-public rust-url-2.1
  (package
    (name "rust-url")
    (version "2.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "url" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1jw7cw8br4xvjb92ddrrh1r7jvqhyhiknnnfpgq9np63fs24m7c2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-idna" ,rust-idna-0.2)
        ("rust-matches" ,rust-matches-0.1)
        ("rust-percent-encoding" ,rust-percent-encoding-2.1)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-bencher" ,rust-bencher-0.1)
        ("rust-rustc-test" ,rust-rustc-test-0.3)
        ("rust-serde-json" ,rust-serde-json-1.0))))
    (home-page "https://github.com/servo/rust-url")
    (synopsis "URL library for Rust, based on the WHATWG URL Standard")
    (description
     "URL library for Rust, based on the WHATWG URL Standard.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-url-1.7
  (package
    (inherit rust-url-2.1)
    (name "rust-url")
    (version "1.7.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "url" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0nim1c90mxpi9wgdw2xh8dqd72vlklwlzam436akcrhjac6pqknx"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-encoding" ,rust-encoding-0.2)
        ("rust-heapsize" ,rust-heapsize-0.4)
        ("rust-idna" ,rust-idna-0.1)
        ("rust-matches" ,rust-matches-0.1)
        ("rust-percent-encoding" ,rust-percent-encoding-1.0)
        ("rust-rustc-serialize" ,rust-rustc-serialize-0.3)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-bencher" ,rust-bencher-0.1)
        ("rust-rustc-serialize" ,rust-rustc-serialize-0.3)
        ("rust-rustc-test" ,rust-rustc-test-0.3)
        ("rust-serde-json" ,rust-serde-json-1.0))))))

(define-public rust-urlocator-0.1
 (package
   (name "rust-urlocator")
   (version "0.1.2")
   (source
    (origin
      (method url-fetch)
      (uri (crate-uri "urlocator" version))
      (file-name
       (string-append name "-" version ".tar.gz"))
      (sha256
       (base32
        "1xzhwmqrqyk8p3s5npqpidrn0gjapqx5fshrx633fk56j7cm8qm1"))))
   (build-system cargo-build-system)
   (home-page "https://github.com/chrisduerr/urlocator.git")
   (synopsis "Locate URLs in character streams")
   (description "Locate URLs in character streams.")
   (license (list license:expat license:asl2.0))))

(define-public rust-user32-sys-0.2
  (package
    (name "rust-user32-sys")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "user32-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ivxc7hmsxax9crdhxdd1nqwik4s9lhb2x59lc8b88bv20fp3x2f"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-winapi" ,rust-winapi-0.2))
       #:cargo-development-inputs
       (("rust-winapi-build" ,rust-winapi-build-0.1))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-cargo-toml
           (lambda _
             (substitute* "Cargo.toml"
               ((", path =.*}") "}"))
             #t)))))
    (home-page "https://github.com/retep998/winapi-rs")
    (synopsis "Function definitions for the Windows API library user32")
    (description
     "Contains function definitions for the Windows API library user32.
See winapi for types and constants.")
    (license license:expat)))

(define-public rust-users-0.9
  (package
    (name "rust-users")
    (version "0.9.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "users" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1kxl3y2hcrqqip7jpqn5mz7xlpbwmmpfmaza0xnyrhx0mrkl4by7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/ogham/rust-users")
    (synopsis "Library for getting information on Unix users and groups")
    (description "This package provides a library for getting information on
Unix users and groups.")
    (license license:expat)))

(define-public rust-utf-8-0.7
  (package
    (name "rust-utf-8")
    (version "0.7.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "utf-8" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1iw5rp4i3mfi9k51picbr5bgjqhjcmnxx7001clh5ydq31y2zr05"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/SimonSapin/rust-utf8")
    (synopsis
     "Incremental, zero-copy UTF-8 decoding with error handling")
    (description
     "Incremental, zero-copy UTF-8 decoding with error handling.")
    (license (list license:expat license:asl2.0))))

(define-public rust-utf8-ranges-1.0
  (package
    (name "rust-utf8-ranges")
    (version "1.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "utf8-ranges" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1fpc32znar5v02nwsw7icl41jzzzzhy0si6ngqjylzrbxxpi3bml"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-development-inputs
       (("rust-doc-comment" ,rust-doc-comment-0.3)
        ("rust-quickcheck" ,rust-quickcheck-0.8))))
    (home-page "https://github.com/BurntSushi/utf8-ranges")
    (synopsis
     "Convert ranges of Unicode codepoints to UTF-8 byte ranges")
    (description
     "Convert ranges of Unicode codepoints to UTF-8 byte ranges.")
    (license (list license:expat license:unlicense))))

(define-public rust-utf8-ranges-0.1
  (package
    (inherit rust-utf8-ranges-1.0)
    (name "rust-utf8-ranges")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "utf8-ranges" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "03xf604b2v51ag3jgzw92l97xnb10kw9zv948bhc7ja1ik017jm1"))))
    (arguments
     `(#:cargo-development-inputs
       (("rust-quickcheck" ,rust-quickcheck-0.2))))))

(define-public rust-utf8parse-0.1
  (package
    (name "rust-utf8parse")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "utf8parse" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0zamsj2986shm4x9zncjf2m5qy9scaw7qnxw4f89b2afpg6a8wl7"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/jwilm/vte")
    (synopsis "Table-driven UTF-8 parser")
    (description "This package provides a table-driven UTF-8 parser.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-uuid-0.8
  (package
    (name "rust-uuid")
    (version "0.8.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "uuid" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "049w16qwk3d3b9cmpgvd7fvcnwgs75l8rlsagh06w7ga9dm2zplz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-winapi" ,rust-winapi-0.3)
        ("rust-sha1" ,rust-sha1-0.6)
        ("rust-md5" ,rust-md5-0.6)
        ("rust-rand" ,rust-rand-0.7)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-slog" ,rust-slog-2.5))))
    (home-page "https://github.com/uuid-rs/uuid")
    (synopsis "Library to generate and parse UUIDs")
    (description
     "This package provides a library to generate and parse UUIDs.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-uuid-0.7
  (package
    (name "rust-uuid")
    (version "0.7.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "uuid" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ank4xk20x3nrz926w8j9mz53bi3v8bykxmhlq2pffa8xc8wdnwh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-md5" ,rust-md5-0.6)
        ("rust-rand" ,rust-rand-0.6)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-sha1" ,rust-sha1-0.6)
        ("rust-slog" ,rust-slog-2.4)
        ("rust-winapi" ,rust-winapi-0.3))
       #:cargo-development-inputs
       (("rust-bincode" ,rust-bincode-1.1)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-serde-json" ,rust-serde-json-1.0)
        ("rust-serde-test" ,rust-serde-test-1.0))))
    (home-page "https://github.com/uuid-rs/uuid")
    (synopsis "Generate and parse UUIDs")
    (description
     "This package provides a library to generate and parse UUIDs.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-uuid-0.5
  (package
    (inherit rust-uuid-0.7)
    (name "rust-uuid")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "uuid" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "08nw3famk1w1zf9ck32pmklk24wd4n4nqnr9wl46qvxak2wf7ixw"))))
    (arguments
     `(#:cargo-inputs
       (("rust-md5" ,rust-md5-0.3)
        ("rust-rand" ,rust-rand-0.3)
        ("rust-rustc-serialize" ,rust-rustc-serialize-0.3)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-sha1" ,rust-sha1-0.2))))))

(define-public rust-vcpkg-0.2
  (package
    (name "rust-vcpkg")
    (version "0.2.8")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "vcpkg" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0s1ijdrsg6917imja2hb07l0z4vbx7ydm8m2i1n9g62fg7r3ki1z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f      ; Tests want mysql, harfbuzz, graphite2.
       #:cargo-development-inputs
       (("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-tempdir" ,rust-tempdir-0.3))))
    (home-page "https://github.com/mcgoo/vcpkg-rs")
    (synopsis "Find native dependencies in a vcpkg tree at build time")
    (description
     "This package provides a library to find native dependencies in a
@code{vcpkg} tree at build time in order to be used in Cargo build scripts.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-vec-map-0.8
  (package
    (name "rust-vec-map")
    (version "0.8.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "vec_map" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "06n8hw4hlbcz328a3gbpvmy0ma46vg1lc0r5wf55900szf3qdiq5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-serde" ,rust-serde-1.0))))
    (home-page "https://github.com/contain-rs/vec-map")
    (synopsis "Simple map based on a vector for small integer keys")
    (description
     "This package provides a simple map based on a vector for small integer keys.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-vecmath-1.0
  (package
    (name "rust-vecmath")
    (version "1.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "vecmath" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0shmj76rj7rqv377vy365xwr5rx23kxqgkqxxrymdjjvv3hf2slm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-piston-float" ,rust-piston-float-1.0))))
    (home-page "https://github.com/pistondevelopers/vecmath")
    (synopsis "Library for vector math designed for reexporting")
    (description
     "This package provides a simple and type agnostic library for vector math
designed for reexporting.")
    (license license:expat)))

(define-public rust-vergen-3.1
  (package
    (name "rust-vergen")
    (version "3.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "vergen" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1jrr0wihm9si98qz8ghjfnalfvmfv8rqvkgj2npqa7yzjs4hvrac"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-chrono" ,rust-chrono-0.4)
        ("rust-chrono" ,rust-chrono-0.4)
        ("rust-bitflags" ,rust-bitflags-1))))
    (home-page "http://github.com/rustyhorde/vergen")
    (synopsis "Generate version related functions")
    (description
     "Generate version related functions.")
    (license (list license:expat license:asl2.0))))

(define-public rust-version-check-0.9
  (package
    (name "rust-version-check")
    (version "0.9.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "version_check" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1kikqlnggii1rvnxrbls55sc46lxvinz5k3giscgncjj4p87b1q7"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/SergioBenitez/version_check")
    (synopsis "Check that the installed rustc meets some version requirements")
    (description
     "This tiny crate checks that the running or installed rustc meets some
version requirements.  The version is queried by calling the Rust compiler with
@code{--version}.  The path to the compiler is determined first via the
@code{RUSTC} environment variable.  If it is not set, then @code{rustc} is used.
If that fails, no determination is made, and calls return None.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-version-check-0.1
  (package
    (inherit rust-version-check-0.9)
    (name "rust-version-check")
    (version "0.1.5")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "version_check" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1pf91pvj8n6akh7w6j5ypka6aqz08b3qpzgs0ak2kjf4frkiljwi"))))))

(define-public rust-version-sync-0.8
  (package
    (name "rust-version-sync")
    (version "0.8.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "version-sync" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "01pq0ia7ak7d69c3chjgdmaaq271yrspgbzmk6wmrwb74hx3skw4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-itertools" ,rust-itertools-0.8)
        ("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-pulldown-cmark" ,rust-pulldown-cmark-0.4)
        ("rust-regex" ,rust-regex-1.1)
        ("rust-semver-parser" ,rust-semver-parser-0.9)
        ("rust-syn" ,rust-syn-0.15)
        ("rust-toml" ,rust-toml-0.5)
        ("rust-url" ,rust-url-1.7))))
    (home-page "https://github.com/mgeisler/version-sync")
    (synopsis
     "Ensure that version numbers are updated when the crate version changes")
    (description
     "Simple crate for ensuring that version numbers in README files are
updated when the crate version changes.")
    (license license:expat)))

(define-public rust-void-1.0
  (package
    (name "rust-void")
    (version "1.0.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "void" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0zc8f0ksxvmhvgx4fdg0zyn6vdnbxd2xv9hfx4nhzg6kbs4f80ka"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/reem/rust-void")
    (synopsis "Void type for use in statically impossible cases")
    (description
     "The uninhabited void type for use in statically impossible cases.")
    (license license:expat)))

(define-public rust-vswhom-0.1
  (package
    (name "rust-vswhom")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "vswhom" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "12v0fjjzxdc3y5c0lcwycfhphz7zf2s06hl5krwhawah0xzrp5xy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-vswhom-sys" ,rust-vswhom-sys-0.1))))
    (home-page "https://github.com/nabijaczleweli/vswhom.rs")
    (synopsis "FFI to Jon Blow's VS discovery script")
    (description
     "This package provides a pure FFI to Jon Blow's VS discovery script.")
    (license license:expat)))

(define-public rust-vswhom-sys-0.1
  (package
    (name "rust-vswhom-sys")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "vswhom-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0clm4dx4amwlhg5lkh52fmvvwq6c7s7b9xqljw39mryhsc158bzw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-cc" ,rust-cc-1.0))))
    (home-page "https://github.com/nabijaczleweli/vswhom-sys.rs")
    (synopsis "Pure FFI to Jon Blow's VS discovery script")
    (description
     "This package provides a pure FFI to Jon Blow's VS discovery script.")
    (license license:expat)))

(define-public rust-vte-0.3
  (package
    (name "rust-vte")
    (version "0.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "vte" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1kz8svnqnxclllsgh0ck20rplw3qzp46b5v30yscnzrgw8vgahjg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f      ; tests not included in release
       #:cargo-inputs
       (("rust-utf8parse" ,rust-utf8parse-0.1))))
    (home-page "https://github.com/jwilm/vte")
    (synopsis "Parser for implementing terminal emulators")
    (description
     "This package provides a parser for implementing terminal emulators.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-wait-timeout-0.2
  (package
    (name "rust-wait-timeout")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wait-timeout" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1xpkk0j5l9pfmjfh1pi0i89invlavfrd9av5xp0zhxgb29dhy84z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/alexcrichton/wait-timeout")
    (synopsis "Wait on a child process with a timeout")
    (description
     "This package provides a crate to wait on a child process with a timeout
specified across Unix and Windows platforms.")
    (license (list license:expat license:asl2.0))))

(define-public rust-walkdir-2.3
  (package
    (name "rust-walkdir")
    (version "2.3.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "walkdir" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0z9g39f49cycdm9vzjf8hnfh3f1csxgd65kmlphj8r2vffy84wbp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-winapi-util" ,rust-winapi-util-0.1)
        ("rust-winapi" ,rust-winapi-0.3)
        ("rust-same-file" ,rust-same-file-1.0))))
    (home-page "https://github.com/BurntSushi/walkdir")
    (synopsis "Recursively walk a directory")
    (description "Recursively walk a directory.")
    (license (list license:unlicense license:expat))))

(define-public rust-walkdir-2.2
  (package
    (name "rust-walkdir")
    (version "2.2.9")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "walkdir" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "07ppalpvxkf8cnqr64np422792y4z5bs9m8b4nrflh5rm17wjn4n"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-same-file" ,rust-same-file-1.0)
        ("rust-winapi" ,rust-winapi-0.3)
        ("rust-winapi-util" ,rust-winapi-util-0.1))
       #:cargo-development-inputs
       (("rust-doc-comment" ,rust-doc-comment-0.3))))
    (home-page  "https://github.com/BurntSushi/walkdir")
    (synopsis "Recursively walk a directory")
    (description "Recursively walk a directory.")
    (license (list license:unlicense
                   license:expat))))

(define-public rust-walkdir-1.0
  (package
    (inherit rust-walkdir-2.2)
    (name "rust-walkdir")
    (version "1.0.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "walkdir" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1zw8safzqpsrvfn0256cngq2fr9d4lmwv5qb8ycn1f7sf3kgj25v"))))
    (arguments
     `(#:cargo-inputs
       (("rust-kernel32-sys" ,rust-kernel32-sys-0.2)
        ("rust-same-file" ,rust-same-file-0.1)
        ("rust-winapi" ,rust-winapi-0.2))
       #:cargo-development-inputs
       (("rust-docopt" ,rust-docopt-0.7)
        ("rust-quickcheck" ,rust-quickcheck-0.4)
        ("rust-rand" ,rust-rand-0.3)
        ("rust-rustc-serialize" ,rust-rustc-serialize-0.3))))))

(define-public rust-wasi-0.9
  (package
    (name "rust-wasi")
    (version "0.9.0+wasi-snapshot-preview1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "wasi" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "06g5v3vrdapfzvfq662cij7v8a1flwr2my45nnncdv2galrdzkfc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
        ("rust-rustc-std-workspace-alloc" ,rust-rustc-std-workspace-alloc-1.0)
        ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1.0))))
    (home-page "https://github.com/bytecodealliance/wasi")
    (synopsis "Experimental WASI API bindings for Rust")
    (description
     "This package provides an experimental WASI API bindings for Rust.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-wasi-0.5
  (package
    (name "rust-wasi")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasi" version))
       (file-name
        (string-append name "-" version ".crate"))
       (sha256
        (base32
         "1ir3pd4phdfml0cbziw9bqp7mnk0vfp9biy8bh25lln6raml4m7x"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/CraneStation/rust-wasi")
    (synopsis "Experimental WASI API bindings for Rust")
    (description "This package contains experimental WASI API bindings
in Rust.")
    (license license:asl2.0)))

(define-public rust-wasm-bindgen-0.2
  (package
    (name "rust-wasm-bindgen")
    (version "0.2.60")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0zx42zryw03w3maz8p65gr5bhhybr2sdzgcck5p3gy47abh7ri9c"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
      (("rust-cfg-if" ,rust-cfg-if-0.1)
       ("rust-serde" ,rust-serde-1.0)
       ("rust-serde-json" ,rust-serde-json-1.0)
       ("rust-wasm-bindgen-macro" ,rust-wasm-bindgen-macro-0.2))
      #:cargo-development-inputs
      (("rust-js-sys" ,rust-js-sys-0.3)
       ("rust-serde-derive" ,rust-serde-derive-1.0)
       ("rust-wasm-bindgen-futures" ,rust-wasm-bindgen-futures-0.4)
       ("rust-wasm-bindgen-test" ,rust-wasm-bindgen-test-0.3)
       ("rust-wasm-bindgen-test-crate-a"
        ,rust-wasm-bindgen-test-crate-a-0.1)
       ("rust-wasm-bindgen-test-crate-b"
        ,rust-wasm-bindgen-test-crate-b-0.1))))
    (home-page "https://rustwasm.github.io/")
    (synopsis "Easy support for interacting between JS and Rust")
    (description
     "Easy support for interacting between JS and Rust.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-wasm-bindgen-backend-0.2
  (package
    (name "rust-wasm-bindgen-backend")
    (version "0.2.60")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-backend" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1k9p8a7ng6nqan0m9555wj936lm2s1qz0fnafclwlv61yrxx6ryr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bumpalo" ,rust-bumpalo-3)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-log" ,rust-log-0.4)
        ("rust-proc-macro2" ,rust-proc-macro2-1.0)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-1.0)
        ("rust-wasm-bindgen-shared" ,rust-wasm-bindgen-shared-0.2))))
    (home-page "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis "Backend code generation of the wasm-bindgen tool")
    (description
     "Backend code generation of the wasm-bindgen tool.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasm-bindgen-futures-0.4
  (package
    (name "rust-wasm-bindgen-futures")
    (version "0.4.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-futures" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1n9ma4kinr4w6r2sh4wm04my6p14k1vx3a4vdbn0vd187sgd9gcb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-js-sys" ,rust-js-sys-0.3)
        ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
        ("rust-web-sys" ,rust-web-sys-0.3))
       #:cargo-development-inputs
       (("rust-futures-channel-preview" ,rust-futures-channel-preview-0.3)
        ("rust-wasm-bindgen-test" ,rust-wasm-bindgen-test-0.3))))
    (home-page "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis
     "Bridging the gap between Rust Futures and JavaScript Promises")
    (description
     "Bridging the gap between Rust Futures and JavaScript Promises.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasm-bindgen-futures-0.3
  (package
    (inherit rust-wasm-bindgen-futures-0.4)
    (name "rust-wasm-bindgen-futures")
    (version "0.3.24")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-futures" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0bf9x6qfjczspc4zs605z1n4j15cdd8kk2z7rah0yggw8b6zl5nc"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-futures" ,rust-futures-0.1)
        ("rust-futures-channel-preview"
         ,rust-futures-channel-preview-0.3)
        ("rust-futures-util-preview" ,rust-futures-util-preview-0.3)
        ("rust-js-sys" ,rust-js-sys-0.3)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2))
       #:cargo-development-inputs
       (("rust-wasm-bindgen-test" ,rust-wasm-bindgen-test-0.2))))))

(define-public rust-wasm-bindgen-macro-0.2
  (package
    (name "rust-wasm-bindgen-macro")
    (version "0.2.60")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-macro" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1973xr0vr2aj85fkp3smk61z5ki7c4fhxlicfjxq3a0y7sv53lcb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f      ; 'Async blocks are unstable'
       #:cargo-inputs
       (("rust-quote" ,rust-quote-1.0)
        ("rust-wasm-bindgen-macro-support"
         ,rust-wasm-bindgen-macro-support-0.2))
       #:cargo-development-inputs
       (("rust-trybuild" ,rust-trybuild-1.0)
        ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
        ("rust-wasm-bindgen-futures" ,rust-wasm-bindgen-futures-0.4))))
    (home-page "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis "Definition of the @code{#[wasm_bindgen]} attribute")
    (description
     "Definition of the @code{#[wasm_bindgen]} attribute, an internal
dependency.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasm-bindgen-macro-support-0.2
  (package
    (name "rust-wasm-bindgen-macro-support")
    (version "0.2.60")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-macro-support" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ca9bb9hnyzcmjww83x8asb76drf55ijhqv8yrl7igpixqv5p2nn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1.0)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-1.0)
        ("rust-wasm-bindgen-backend" ,rust-wasm-bindgen-backend-0.2)
        ("rust-wasm-bindgen-shared" ,rust-wasm-bindgen-shared-0.2))))
    (home-page "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis "The @code{#[wasm_bindgen]} macro")
    (description
     "The part of the implementation of the @code{#[wasm_bindgen]}
attribute that is not in the shared backend crate.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-wasm-bindgen-shared-0.2
  (package
    (name "rust-wasm-bindgen-shared")
    (version "0.2.60")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "wasm-bindgen-shared" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0ffn4152w8n629f29lwjgj3adiyixvdbff3mld49gisssbknzxys"))))
    (build-system cargo-build-system)
    (home-page "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis "Shared support between wasm-bindgen and wasm-bindgen cli")
    (description "This package provides shared support between
@code{wasm-bindgen} and @code{wasm-bindgen} cli, an internal dependency.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-wasm-bindgen-test-0.3
  (package
    (name "rust-wasm-bindgen-test")
    (version "0.3.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-test" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0bn833hghwbcg9cqz1bx9biq271bc4jcbgn2nqk1fkf4ab1hxzcq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-console-error-panic-hook" ,rust-console-error-panic-hook-0.1)
        ("rust-js-sys" ,rust-js-sys-0.3)
        ("rust-scoped-tls" ,rust-scoped-tls-1.0)
        ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
        ("rust-wasm-bindgen-futures" ,rust-wasm-bindgen-futures-0.4)
        ("rust-wasm-bindgen-test-macro" ,rust-wasm-bindgen-test-macro-0.3))))
    (home-page "https://github.com/rustwasm/wasm-bindgen")
    (synopsis
     "Internal testing crate for wasm-bindgen")
    (description
     "Internal testing crate for wasm-bindgen.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasm-bindgen-test-0.2
  (package
    (inherit rust-wasm-bindgen-test-0.3)
    (name "rust-wasm-bindgen-test")
    (version "0.2.48")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-test" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0gwslc2sfkghzzb3r0gvd8i5rig2nlqgpl1rn43y2w4mr1ci494k"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-console-error-panic-hook" ,rust-console-error-panic-hook-0.1)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-js-sys" ,rust-js-sys-0.3)
        ("rust-scoped-tls" ,rust-scoped-tls-1.0)
        ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
        ("rust-wasm-bindgen-futures" ,rust-wasm-bindgen-futures-0.3)
        ("rust-wasm-bindgen-test-macro" ,rust-wasm-bindgen-test-macro-0.2))))))

(define-public rust-wasm-bindgen-test-crate-a-0.1
  (package
    (name "rust-wasm-bindgen-test-crate-a")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-test-crate-a" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "06l9rcxykg2vnp706a6axchjp6lh9ym1awwyyxzmbkv410kqwvsp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2))))
    (home-page "https://github.com/rustwasm/wasm-bindgen")
    (synopsis "Internal test crate for wasm-bindgen")
    (description
     "Internal test crate for wasm-bindgen.")
    (license license:expat)))

(define-public rust-wasm-bindgen-test-crate-b-0.1
  (package
    (name "rust-wasm-bindgen-test-crate-b")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-test-crate-b" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "16p3gx9vhngdf236zxx2qijqx5sq0lid25j8wy6j522ybxs4vbh8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2))))
    (home-page "https://github.com/rustwasm/wasm-bindgen")
    (synopsis "Internal test crate for wasm-bindgen")
    (description
     "Internal test crate for wasm-bindgen.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasm-bindgen-test-macro-0.3
  (package
    (name "rust-wasm-bindgen-test-macro")
    (version "0.3.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-test-macro" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0kybf3shpp8ysz4v4j259d7vad9kw5bs4i4dlfrs895bhdp7m0wp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1.0)
        ("rust-quote" ,rust-quote-1.0))))
    (home-page "https://github.com/rustwasm/wasm-bindgen")
    (synopsis "Internal testing macro for wasm-bindgen")
    (description
     "This library contains the internal testing macro for wasm-bindgen.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasm-bindgen-test-macro-0.2
  (package
    (inherit rust-wasm-bindgen-test-macro-0.3)
    (name "rust-wasm-bindgen-test-macro")
    (version "0.2.50")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "wasm-bindgen-test-macro" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "19bvmw8mqlwh6wkbzgs3cnlkywrv8q2kkqggz6y0p158930xm287"))))
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-0.6))))))

(define-public rust-wasm-bindgen-webidl-0.2
  (package
    (name "rust-wasm-bindgen-webidl")
    (version "0.2.58")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-webidl" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0pcpaw8w3xgfrg9y24ljrsl2bkidgdaaz3ka2bgk417wjc6jl0gg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-anyhow" ,rust-anyhow-1.0)
        ("rust-heck" ,rust-heck-0.3)
        ("rust-log" ,rust-log-0.4)
        ("rust-proc-macro2" ,rust-proc-macro2-1.0)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-1.0)
        ("rust-wasm-bindgen-backend" ,rust-wasm-bindgen-backend-0.2)
        ("rust-weedle" ,rust-weedle-0.10))))
    (home-page "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis "Support for parsing WebIDL specific to wasm-bindgen")
    (description
     "Support for parsing WebIDL specific to wasm-bindgen.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wayland-client-0.23
  (package
    (name "rust-wayland-client")
    (version "0.23.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-client" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1nmw2kz70llc5mxwzg6bglnqy0qnyr9224zjmq9czazgw3mq045g"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-calloop" ,rust-calloop-0.4)
        ("rust-downcast-rs" ,rust-downcast-rs-1.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-mio" ,rust-mio-0.6)
        ("rust-nix" ,rust-nix-0.14)
        ("rust-wayland-commons" ,rust-wayland-commons-0.23)
        ("rust-wayland-sys" ,rust-wayland-sys-0.23)
        ("rust-wayland-scanner" ,rust-wayland-scanner-0.23))
       #:cargo-development-inputs
       (("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-tempfile" ,rust-tempfile-3.1))))
    (home-page "https://github.com/smithay/wayland-rs")
    (synopsis
     "Rust bindings to the standard C implementation of the wayland protocol")
    (description
     "This package provides Rust bindings to the standard C implementation of
the wayland protocol, client side.")
    (license license:expat)))

(define-public rust-wayland-client-0.21
  (package
    (inherit rust-wayland-client-0.23)
    (name "rust-wayland-client")
    (version "0.21.13")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-client" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "04r7dy074hhdalsi1day482wvmczr40hg7qvrnzkgxpakrgkx5j9"))))
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-calloop" ,rust-calloop-0.4)
        ("rust-downcast-rs" ,rust-downcast-rs-1.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-mio" ,rust-mio-0.6)
        ("rust-nix" ,rust-nix-0.14)
        ("rust-wayland-commons" ,rust-wayland-commons-0.21)
        ("rust-wayland-sys" ,rust-wayland-sys-0.21)
        ("rust-wayland-scanner" ,rust-wayland-scanner-0.21))
       #:cargo-development-inputs
       (("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-tempfile" ,rust-tempfile-3.1))))))

(define-public rust-wayland-commons-0.23
  (package
    (name "rust-wayland-commons")
    (version "0.23.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-commons" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1nyvcs6xxxzqgh0wvc7z0fgi89bf3h9p4qrbf77bnfbwlb8v0rmv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-nix" ,rust-nix-0.14)
        ("rust-wayland-sys" ,rust-wayland-sys-0.23))))
    (home-page "https://github.com/smithay/wayland-rs")
    (synopsis
     "Common types and structures used by wayland-client and wayland-server")
    (description
     "Common types and structures used by wayland-client and wayland-server.")
    (license license:expat)))

(define-public rust-wayland-commons-0.21
  (package
    (inherit rust-wayland-commons-0.23)
    (name "rust-wayland-commons")
    (version "0.21.13")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-commons" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1v1jpcsnn6cwwy5ii5pdl58i6b9slmi8mn4my4fpwrlbfsb8ih20"))))
    (arguments
     `(#:cargo-inputs
       (("rust-nix" ,rust-nix-0.14)
        ("rust-wayland-sys" ,rust-wayland-sys-0.21))))))

(define-public rust-wayland-protocols-0.23
  (package
    (name "rust-wayland-protocols")
    (version "0.23.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-protocols" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ygwbzqlnks5xzafka3c8ag6k92g2h6ygj2xsmvjfx2n6rj8dhkc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-wayland-client" ,rust-wayland-client-0.23)
        ("rust-wayland-commons" ,rust-wayland-commons-0.23)
        ("rust-wayland-server" ,rust-wayland-server-0.23)
        ("rust-wayland-scanner" ,rust-wayland-scanner-0.23))))
    (home-page "https://github.com/smithay/wayland-rs")
    (synopsis
     "Generated API for the officials wayland protocol extensions")
    (description
     "Generated API for the officials wayland protocol extensions.")
    (license license:expat)))

(define-public rust-wayland-protocols-0.21
  (package
    (inherit rust-wayland-protocols-0.23)
    (name "rust-wayland-protocols")
    (version "0.21.13")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-protocols" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0i91yh3nxk9llhly2ly3nvlfx0lbpvyq919cgmnyx3j25bmf5zaa"))))
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-wayland-client" ,rust-wayland-client-0.21)
        ("rust-wayland-commons" ,rust-wayland-commons-0.21)
        ("rust-wayland-server" ,rust-wayland-server-0.21)
        ("rust-wayland-sys" ,rust-wayland-sys-0.21)
        ("rust-wayland-scanner" ,rust-wayland-scanner-0.21))))))

(define-public rust-wayland-scanner-0.23
  (package
    (name "rust-wayland-scanner")
    (version "0.23.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-scanner" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0g8wcphykjrcpslznyi3qccx1pckw97rckq5b295nfbg6r3j5c4k"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-0.6)
        ("rust-xml-rs" ,rust-xml-rs-0.8))))
    (home-page "https://github.com/smithay/wayland-rs")
    (synopsis
     "Wayland Scanner for generating rust APIs from XML wayland protocol files")
    (description
     "Wayland Scanner for generating rust APIs from XML wayland protocol files.
Intented for use with wayland-sys.  You should only need this crate if
you are working on custom wayland protocol extensions.
Look at the crate wayland-client for usable bindings.")
    (license license:expat)))

(define-public rust-wayland-scanner-0.21
  (package
    (inherit rust-wayland-scanner-0.23)
    (name "rust-wayland-scanner")
    (version "0.21.13")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-scanner" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "17mp49v7w0p0x5ry628lj2llljnwkr9aj9g4bqqhfibid32jhf5z"))))))

(define-public rust-wayland-server-0.23
  (package
    (name "rust-wayland-server")
    (version "0.23.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-server" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ccsalq6gnf07klnbjx2dxcbibhw03rqsgi578p913s3zsjlcg8a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-calloop" ,rust-calloop-0.4)
        ("rust-downcast-rs" ,rust-downcast-rs-1.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-mio" ,rust-mio-0.6)
        ("rust-nix" ,rust-nix-0.14)
        ("rust-wayland-commons" ,rust-wayland-commons-0.23)
        ("rust-wayland-sys" ,rust-wayland-sys-0.23)
        ("rust-wayland-scanner" ,rust-wayland-scanner-0.23))))
    (home-page "https://github.com/smithay/wayland-rs")
    (synopsis
     "Bindings to the standard C implementation of the wayland protocol")
    (description
     "This package provides Rust bindings to the standard C implementation of
the wayland protocol, server side.")
    (license license:expat)))

(define-public rust-wayland-server-0.21
  (package
    (inherit rust-wayland-server-0.23)
    (name "rust-wayland-server")
    (version "0.21.13")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-server" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ayn4wlrpg0fw04prri9awpkjvbzjil0d3l3a8zs9pdbnspvw6ah"))))
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-calloop" ,rust-calloop-0.4)
        ("rust-downcast-rs" ,rust-downcast-rs-1.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-mio" ,rust-mio-0.6)
        ("rust-nix" ,rust-nix-0.14)
        ("rust-wayland-commons" ,rust-wayland-commons-0.21)
        ("rust-wayland-sys" ,rust-wayland-sys-0.21)
        ("rust-wayland-scanner" ,rust-wayland-scanner-0.21))))))

(define-public rust-wayland-sys-0.23
  (package
    (name "rust-wayland-sys")
    (version "0.23.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1x2qafvj8hd2x5qfaan2dfpw9amg0f5g9sqrkdy7qvbddsl8jknr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-dlib" ,rust-dlib-0.4)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/smithay/wayland-rs")
    (synopsis "FFI bindings to the various libwayland-*.so libraries")
    (description
     "FFI bindings to the various libwayland-*.so libraries.
You should only need this crate if you are working on custom wayland
protocol extensions.  Look at the crate wayland-client for usable bindings.")
    (license license:expat)))

(define-public rust-wayland-sys-0.21
  (package
    (inherit rust-wayland-sys-0.23)
    (name "rust-wayland-sys")
    (version "0.21.13")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0a0ndgkg98pvmkv44yya4f7mxzjaxylknqh64bpa05w0azyv02jj"))))))

(define-public rust-web-sys-0.3
  (package
    (name "rust-web-sys")
    (version "0.3.37")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "web-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1jy4q5jawzg3dxzhfwa0g3fsz7h4j0ra6y232ikc6mlcimj52vrd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-js-sys" ,rust-js-sys-0.3)
        ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2))
       #:cargo-development-inputs
       (("rust-wasm-bindgen-futures" ,rust-wasm-bindgen-futures-0.4)
        ("rust-wasm-bindgen-test" ,rust-wasm-bindgen-test-0.3))))
    (home-page "https://rustwasm.github.io/wasm-bindgen/web-sys/index.html")
    (synopsis
     "Bindings for all Web APIs, a procedurally generated crate from WebIDL")
    (description
     "Bindings for all Web APIs, a procedurally generated crate from WebIDL.")
    (license (list license:expat license:asl2.0))))

(define-public rust-weedle-0.10
  (package
    (name "rust-weedle")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "weedle" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0r0i2kllvkn9jil6cjzxdi1zsc6p1gjyk751w8lyclaii1q3zd1v"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-nom" ,rust-nom-4.2))))
    (home-page "https://github.com/rustwasm/weedle")
    (synopsis "WebIDL Parser")
    (description
     "This package provides a WebIDL Parser.")
    (license license:expat)))

(define-public rust-which-3.1
  (package
    (name "rust-which")
    (version "3.1.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "which" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "094pw9pi48szshn9ln69z2kg7syq1jp80h5ps1qncbsaw4d0f4fh"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build? #t
        #:cargo-inputs
        (("rust-failure" ,rust-failure-0.1)
         ("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/harryfei/which-rs.git")
    (synopsis "Rust equivalent of Unix command \"which\"")
    (description
     "This package provides a Rust equivalent of Unix command \"which\".  Locate
installed executable in cross platforms.")
    (license license:expat)))

(define-public rust-which-2.0
  (package
    (name "rust-which")
    (version "2.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "which" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0r7i793sc0xqnd2fxnqbksj7j1kx65bwn81b8z49750v4c8cnymm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-failure" ,rust-failure-0.1)
        ("rust-libc" ,rust-libc-0.2))
       #:cargo-development-inputs
       (("rust-tempdir" ,rust-tempdir-0.3))))
    (home-page "https://github.com/harryfei/which-rs")
    (synopsis "Rust equivalent of Unix command \"which\"")
    (description
     "This package provides a Rust equivalent of Unix command \"which\".
Locate installed executable in cross platforms.")
    (license license:expat)))

(define-public rust-which-1.0
  (package
    (inherit rust-which-2.0)
    (name "rust-which")
    (version "1.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "which" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1cjwa57kzfgzs681a27m5pjmq580pv3hkcg23smf270bgqz60jp8"))))
    (arguments
     `(#:tests? #f
       #:cargo-inputs
       (("rust-libc" ,rust-libc-0.2))
       #:cargo-development-inputs
       (("rust-tempdir" ,rust-tempdir-0.3))))))

(define-public rust-widestring-0.4
  (package
    (name "rust-widestring")
    (version "0.4.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "widestring" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1dhx6dndjsz1y7c9w06922412kdxyrrkqblvggm76mh8z17hxz7g"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-development-inputs
       (("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/starkat99/widestring-rs")
    (synopsis "Wide string Rust FFI library")
    (description
     "A wide string Rust FFI library for converting to and from wide strings,
such as those often used in Windows API or other FFI libraries.  Both UTF-16 and
UTF-32 types are provided, including support for malformed encoding.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-winapi-0.3
  (package
    (name "rust-winapi")
    (version "0.3.8")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "winapi" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1ii9j9lzrhwri0902652awifzx9fpayimbp6hfhhc296xcg0k4w0"))))
    (build-system cargo-build-system)
    ;; This package depends unconditionally on these two crates.
    (arguments
     `(#:cargo-inputs
       (("winapi-i686-pc-windows-gnu" ,rust-winapi-i686-pc-windows-gnu-0.4)
        ("winapi-x86-64-pc-windows-gnu" ,rust-winapi-x86-64-pc-windows-gnu-0.4))))
    (home-page "https://github.com/retep998/winapi-rs")
    (synopsis "Raw FFI bindings for all of Windows API")
    (description
     "Raw FFI bindings for all of Windows API.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-winapi-0.2
  (package
    (inherit rust-winapi-0.3)
    (name "rust-winapi")
    (version "0.2.8")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "winapi" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0yh816lh6lf56dpsgxy189c2ai1z3j8mw9si6izqb6wsjkbcjz8n"))))
    (arguments '(#:skip-build? #t))))

(define-public rust-winapi-build-0.1
  (package
    (name "rust-winapi-build")
    (version "0.1.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "winapi-build" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1g4rqsgjky0a7530qajn2bbfcrl2v0zb39idgdws9b1l7gp5wc9d"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/retep998/winapi-rs")
    (synopsis "Common code for build.rs in WinAPI -sys crates")
    (description
     "Common code for build.rs in WinAPI -sys crates.")
    (license license:expat)))

(define-public rust-winapi-i686-pc-windows-gnu-0.4
  (package
    (name "rust-winapi-i686-pc-windows-gnu")
    (version "0.4.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "winapi-i686-pc-windows-gnu" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1dmpa6mvcvzz16zg6d5vrfy4bxgg541wxrcip7cnshi06v38ffxc"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/retep998/winapi-rs")
    (synopsis "Import libraries for the i686-pc-windows-gnu target")
    (description "This crate provides import libraries for the
i686-pc-windows-gnu target.  Please don't use this crate directly, depend on
@code{winapi} instead.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-winapi-util-0.1
  (package
    (name "rust-winapi-util")
    (version "0.1.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "winapi-util" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0vj3984cxwnf1ys3fdz6bpl7p0kdsgykpzbhmcmwi759cd8mqlgs"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/BurntSushi/winapi-util")
    (synopsis "Dumping ground for high level safe wrappers over winapi")
    (description
     "This package provides a dumping ground for high level safe wrappers over
winapi.")
    (license (list license:unlicense
                   license:expat))))

(define-public rust-winapi-x86-64-pc-windows-gnu-0.4
  (package
    (name "rust-winapi-x86-64-pc-windows-gnu")
    (version "0.4.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "winapi-x86_64-pc-windows-gnu" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0gqq64czqb64kskjryj8isp62m2sgvx25yyj3kpc2myh85w24bki"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/retep998/winapi-rs")
    (synopsis "Import libraries for the x86_64-pc-windows-gnu target")
    (description "This package provides import libraries for the
x86_64-pc-windows-gnu target.  Please don't use this crate directly, depend on
@code{winapi} instead.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-wincolor-1.0
  (package
    (name "rust-wincolor")
    (version "1.0.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "wincolor" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "1agaf3hcav113i86912ajnw6jxcy4rvkrgyf8gdj8kc031mh3xcn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-winapi" ,rust-winapi-0.3)
        ("rust-winapi-util" ,rust-winapi-util-0.1))))
    (home-page "https://github.com/BurntSushi/termcolor/tree/master/wincolor")
    (synopsis "Windows API for controlling text color in a Windows console")
    (description
     "This package provides a simple Windows specific API for controlling text
color in a Windows console.")
    (license (list license:unlicense
                   license:expat))))

(define-public rust-winit-0.20
  (package
    (name "rust-winit")
    (version "0.20.0-alpha6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "winit" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1g5cchl97zcg525j6jdr77yby8cmhwv1qqwcd3sf4l4zl263195z"))
       (patches
         (list
           (origin
             (method url-fetch)
             (uri "https://github.com/rust-windowing/winit/commit/d1c6506865c7bddbb5fb4d80a613e43ddc1370b5.patch")
             (file-name (string-append name "-fix-bindings.patch"))
             (sha256
              (base32
               "03q4bvdq86kii53d0vsywv08g8vqirf9h1lz2cl6rcc7gjfynpds")))))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-android-glue" ,rust-android-glue-0.2)
        ("rust-bitflags" ,rust-bitflags-1)
        ("rust-calloop" ,rust-calloop-0.4)
        ("rust-cocoa" ,rust-cocoa-0.19)
        ("rust-core-foundation" ,rust-core-foundation-0.6)
        ("rust-core-graphics" ,rust-core-graphics-0.17)
        ("rust-core-video-sys" ,rust-core-video-sys-0.1)
        ("rust-dispatch" ,rust-dispatch-0.1)
        ("rust-instant" ,rust-instant-0.1)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-objc" ,rust-objc-0.2)
        ("rust-parking-lot" ,rust-parking-lot-0.10)
        ("rust-percent-encoding" ,rust-percent-encoding-2.1)
        ("rust-raw-window-handle" ,rust-raw-window-handle-0.3)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-smithay-client-toolkit" ,rust-smithay-client-toolkit-0.6)
        ("rust-stdweb" ,rust-stdweb-0.4)
        ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
        ("rust-wayland-client" ,rust-wayland-client-0.23)
        ("rust-web-sys" ,rust-web-sys-0.3)
        ("rust-winapi" ,rust-winapi-0.3)
        ("rust-x11-dl" ,rust-x11-dl-2))
       #:cargo-development-inputs
       (("rust-console-log" ,rust-console-log-0.1)
        ("rust-env-logger" ,rust-env-logger-0.5)
        ("rust-image" ,rust-image-0.21))))
    (home-page "https://github.com/rust-windowing/winit")
    (synopsis
     "Cross-platform window creation library")
    (description
     "Cross-platform window creation library.")
    (license license:asl2.0)))

(define-public rust-winit-0.19
  (package
    (inherit rust-winit-0.20)
    (name "rust-winit")
    (version "0.19.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "winit" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1a4lnfyvlc4jabhs30wlmkgdjv7qhbplmyp833kl7ykjni5yp5hy"))))
    (arguments
     `(#:cargo-inputs
       (("rust-android-glue" ,rust-android-glue-0.2)
        ("rust-backtrace" ,rust-backtrace-0.3)
        ("rust-bitflags" ,rust-bitflags-1)
        ("rust-cocoa" ,rust-cocoa-0.18)
        ("rust-core-foundation" ,rust-core-foundation-0.6)
        ("rust-core-graphics" ,rust-core-graphics-0.17)
        ("rust-image" ,rust-image-0.21)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-objc" ,rust-objc-0.2)
        ("rust-parking-lot" ,rust-parking-lot-0.9)
        ("rust-percent-encoding" ,rust-percent-encoding-2.1)
        ("rust-raw-window-handle" ,rust-raw-window-handle-0.3)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-smithay-client-toolkit" ,rust-smithay-client-toolkit-0.4)
        ("rust-wayland-client" ,rust-wayland-client-0.21)
        ("rust-winapi" ,rust-winapi-0.3)
        ("rust-x11-dl" ,rust-x11-dl-2))))))

(define-public rust-winpty-sys-0.4
  (package
    (name "rust-winpty-sys")
    (version "0.4.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "winpty-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0s5m2vvlw7wphc466s47zfmp08zk00wzj999l1w3ajqlxbnfgb9x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-bindgen" ,rust-bindgen-0.33)
        ("rust-cc" ,rust-cc-1.0))))
    (home-page "https://github.com/rprichard/winpty")
    (synopsis "Rust winpty bindings")
    (description "Rust winpty bindings.")
    (license license:expat)))

(define-public rust-winreg-0.6
  (package
    (name "rust-winreg")
    (version "0.6.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "winreg" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1jdcqr6zmvwyrp87h48miasfdvv16gjsb60rc8dy2kqwb3mnv65j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-chrono" ,rust-chrono-0.4)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-winapi" ,rust-winapi-0.3))
       #:cargo-development-inputs
       (("rust-rand" ,rust-rand-0.3)
        ("rust-serde-derive" ,rust-serde-derive-1.0))))
    (home-page "https://github.com/gentoo90/winreg-rs")
    (synopsis "Rust bindings to MS Windows Registry API")
    (description
     "This package provides Rust bindings to MS Windows Registry API.")
    (license license:expat)))

(define-public rust-winutil-0.1
  (package
    (name "rust-winutil")
    (version "0.1.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "winutil" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0vkyl3fbbf05n5ph5yz8sfaccrk9x3qsr25560w6w68ldf5i7bvx"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-winapi" ,rust-winapi-0.3))))
    (build-system cargo-build-system)
    (home-page "https://bitbucket.org/DaveLancaster/winutil")
    (synopsis "Library wrapping a handful of useful winapi functions")
    (description
     "A simple library wrapping a handful of useful winapi functions.")
    (license license:expat)))

(define-public rust-ws2-32-sys-0.2
  (package
    (name "rust-ws2-32-sys")
    (version "0.2.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "ws2_32-sys" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0ppscg5qfqaw0gzwv2a4nhn5bn01ff9iwn6ysqnzm4n8s3myz76m"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-winapi" ,rust-winapi-0.2))
       #:cargo-development-inputs
       (("rust-winapi-build" ,rust-winapi-build-0.1))))
    (home-page "https://github.com/retep998/winapi-rs")
    (synopsis "Function definitions for the Windows API library ws2_32")
    (description
     "Contains function definitions for the Windows API library ws2_32.")
    (license license:expat)))

(define-public rust-x11-2
  (package
    (name "rust-x11")
    (version "2.18.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "x11" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0dg2d0yrqmwg6prpxkw3vpmwzwxnaki2cn0v64ylh5gp4cqpws9r"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page "https://github.com/erlepereira/x11-rs.git")
    (synopsis "X11 library bindings for Rust")
    (description "X11 library bindings for Rust.")
    (license license:cc0)))

(define-public rust-x11-clipboard-0.4
  (package
    (name "rust-x11-clipboard")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "x11-clipboard" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0nqdnswiyj28b1izjp5rzbc67cxpb5c8p4vh1xyndkirzs84vqqk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f  ; Tests require display server.
       #:cargo-inputs (("rust-xcb" ,rust-xcb-0.9))))
    (native-inputs
     `(("python" ,python)))
    (home-page "https://github.com/quininer/x11-clipboard")
    (synopsis "x11 clipboard support for Rust")
    (description "This package provides x11 clipboard support for Rust.")
    (license license:expat)))

(define-public rust-x11-dl-2
  (package
    (name "rust-x11-dl")
    (version "2.18.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "x11-dl" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0n1w837xagxqgwx2880d7c9ks6l3g1kk00yd75afdaiv58sf2rdy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-maybe-uninit" ,rust-maybe-uninit-2.0)
        ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page "https://github.com/erlepereira/x11-rs.git")
    (synopsis "X11 library bindings for Rust")
    (description "This package provides X11 library bindings for Rust.")
    (license license:cc0)))

(define-public rust-xattr-0.2
  (package
    (name "rust-xattr")
    (version "0.2.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "xattr" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0k556fb6f5jc907975j9c8iynl2fqz3rf0w6fiig83i4yi0kfk14"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-libc" ,rust-libc-0.2))
       #:cargo-development-inputs
       (("rust-tempfile" ,rust-tempfile-3.0))))
    (home-page "https://github.com/Stebalien/xattr")
    (synopsis "Unix extended filesystem attributes")
    (description
     "This package provide a small library for setting, getting, and listing
extended attributes.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-xcb-0.9
  (package
    (name "rust-xcb")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "xcb" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "19i2pm8alpn2f0m4jg8bsw6ckw8irj1wjh55h9pi2fcb2diny1b2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f  ; Building all the features tests the code.
       #:cargo-build-flags '("--features" "debug_all")
       #:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-x11" ,rust-x11-2))))
    (inputs
     `(("libx11" ,libx11)
       ("libxcb" ,libxcb)
       ("xcb-proto" ,xcb-proto)))
    (native-inputs
     `(("pkg-config" ,pkg-config)
       ("python" ,python)))
    (home-page "https://github.com/rtbo/rust-xcb")
    (synopsis "Rust bindings and wrappers for XCB")
    (description
     "This package provides Rust bindings and wrappers for XCB.")
    (license license:expat)))

(define-public rust-xdg-2.2
  (package
    (name "rust-xdg")
    (version "2.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "xdg" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0mws8a0fr3cqk5nh7aq9lmkmhzghvasqy4mhw6nnza06l4d6i2fh"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/whitequark/rust-xdg")
    (synopsis "Store and retrieve files according to XDG specification")
    (description
     "This package provides a library for storing and retrieving files according
to XDG Base Directory specification")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-xml-rs-0.8
  (package
    (name "rust-xml-rs")
    (version "0.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "xml-rs" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0c905wsmk995xypxljpxzq6vv660r1pzgyrpsfiz13kw3hf0dzcs"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-doc-comment" ,rust-doc-comment-0.3)
        ("rust-lazy-static" ,rust-lazy-static-1))))
    (home-page "https://github.com/netvl/xml-rs")
    (synopsis "XML library in pure Rust")
    (description "An XML library in pure Rust.")
    (license license:expat)))

(define-public rust-y4m-0.5
  (package
    (name "rust-y4m")
    (version "0.5.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "y4m" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "06g8c53qk4cla3xczywx5qlklvzsw54x77vm727mhizlsp5n93ar"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/image-rs/y4m")
    (synopsis "YUV4MPEG2 (.y4m) Encoder/Decoder.")
    (description "YUV4MPEG2 (.y4m) Encoder/Decoder.")
    (license license:expat)))

(define-public rust-yaml-rust-0.4
  (package
    (name "rust-yaml-rust")
    (version "0.4.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "yaml-rust" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ka3qhqc5lvk3hz14wmsj32jhmh44blcbfrx5hfxli2gg38kv4k5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-linked-hash-map" ,rust-linked-hash-map-0.5))
       #:cargo-development-inputs
       (("rust-quickcheck" ,rust-quickcheck-0.7))))
    (home-page "https://chyh1990.github.io/yaml-rust/")
    (synopsis "The missing YAML 1.2 parser for rust")
    (description
     "The missing YAML 1.2 parser for rust.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-yaml-rust-0.3
  (package
    (inherit rust-yaml-rust-0.4)
    (name "rust-yaml-rust")
    (version "0.3.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "yaml-rust" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "14m9dzwb8fb05f4jjb4nqp49rxd9c5vcmwpv3a04d2y5iphncqz6"))))
    (arguments
     `(#:cargo-inputs
       (("rust-clippy" ,rust-clippy-0.0)
        ("rust-linked-hash-map" ,rust-linked-hash-map-0.3))))))

(define-public rust-zip-0.5
  (package
    (name "rust-zip")
    (version "0.5.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zip" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1biv5kh4fl7wpjlsxfczvgrdjlybf0xjaw7s36didql8lxxz67z4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bzip2" ,rust-bzip2-0.3)
        ("rust-crc32fast" ,rust-crc32fast-1.2)
        ("rust-flate2" ,rust-flate2-1.0)
        ("rust-podio" ,rust-podio-0.1)
        ("rust-time" ,rust-time-0.1))
       #:cargo-development-inputs
       (("rust-bencher" ,rust-bencher-0.1)
        ("rust-rand" ,rust-rand-0.4)
        ("rust-walkdir" ,rust-walkdir-1.0))))
    (home-page "https://github.com/mvdnes/zip-rs.git")
    (synopsis
     "Library to support the reading and writing of zip files")
    (description
     "Library to support the reading and writing of zip files.")
    (license license:expat)))

(define-public rust-zoneinfo-compiled-0.4
  (package
    (name "rust-zoneinfo-compiled")
    (version "0.4.8")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "zoneinfo_compiled" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0bnm19w791q6kp79s0zl1cj9w51bw5xrifrxfy3g1p05i676y4vf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-datetime" ,rust-datetime-0.4))))
    (home-page "https://github.com/rust-datetime/zoneinfo-compiled/")
    (synopsis "Library for parsing compiled zoneinfo files")
    (description
     "This package provides a library for parsing compiled zoneinfo files.")
    (license license:expat)))
