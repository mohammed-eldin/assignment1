
(cl:in-package :asdf)

(defsystem "custom_messages-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Play" :depends-on ("_package_Play"))
    (:file "_package_Play" :depends-on ("_package"))
  ))