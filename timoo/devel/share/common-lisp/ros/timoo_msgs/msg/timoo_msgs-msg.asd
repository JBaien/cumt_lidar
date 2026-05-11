
(cl:in-package :asdf)

(defsystem "timoo_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "timooPacket" :depends-on ("_package_timooPacket"))
    (:file "_package_timooPacket" :depends-on ("_package"))
    (:file "timooScan" :depends-on ("_package_timooScan"))
    (:file "_package_timooScan" :depends-on ("_package"))
    (:file "timooStatus" :depends-on ("_package_timooStatus"))
    (:file "_package_timooStatus" :depends-on ("_package"))
  ))