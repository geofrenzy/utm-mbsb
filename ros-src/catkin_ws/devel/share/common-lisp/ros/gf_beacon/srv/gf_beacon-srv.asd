
(cl:in-package :asdf)

(defsystem "gf_beacon-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "gf_encoding" :depends-on ("_package_gf_encoding"))
    (:file "_package_gf_encoding" :depends-on ("_package"))
  ))