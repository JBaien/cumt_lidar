;; Auto-generated. Do not edit!


(when (boundp 'timoo_msgs::timooPacket)
  (if (not (find-package "TIMOO_MSGS"))
    (make-package "TIMOO_MSGS"))
  (shadow 'timooPacket (find-package "TIMOO_MSGS")))
(unless (find-package "TIMOO_MSGS::TIMOOPACKET")
  (make-package "TIMOO_MSGS::TIMOOPACKET"))

(in-package "ROS")
;;//! \htmlinclude timooPacket.msg.html


(defclass timoo_msgs::timooPacket
  :super ros::object
  :slots (_stamp _data _data_stamp _gps_status ))

(defmethod timoo_msgs::timooPacket
  (:init
   (&key
    ((:stamp __stamp) (instance ros::time :init))
    ((:data __data) (make-array 1206 :initial-element 0 :element-type :char))
    ((:data_stamp __data_stamp) (instance ros::time :init))
    ((:gps_status __gps_status) nil)
    )
   (send-super :init)
   (setq _stamp __stamp)
   (setq _data __data)
   (setq _data_stamp __data_stamp)
   (setq _gps_status __gps_status)
   self)
  (:stamp
   (&optional __stamp)
   (if __stamp (setq _stamp __stamp)) _stamp)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:data_stamp
   (&optional __data_stamp)
   (if __data_stamp (setq _data_stamp __data_stamp)) _data_stamp)
  (:gps_status
   (&optional (__gps_status :null))
   (if (not (eq __gps_status :null)) (setq _gps_status __gps_status)) _gps_status)
  (:serialization-length
   ()
   (+
    ;; time _stamp
    8
    ;; uint8[1206] _data
    (* 1    1206)
    ;; time _data_stamp
    8
    ;; bool _gps_status
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; time _stamp
       (write-long (send _stamp :sec) s) (write-long (send _stamp :nsec) s)
     ;; uint8[1206] _data
     (princ _data s)
     ;; time _data_stamp
       (write-long (send _data_stamp :sec) s) (write-long (send _data_stamp :nsec) s)
     ;; bool _gps_status
       (if _gps_status (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; time _stamp
     (send _stamp :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _stamp :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint8[1206] _data
   (setq _data (make-array 1206 :element-type :char))
   (replace _data buf :start2 ptr-) (incf ptr- 1206)
   ;; time _data_stamp
     (send _data_stamp :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _data_stamp :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; bool _gps_status
     (setq _gps_status (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get timoo_msgs::timooPacket :md5sum-) "0ff7fd67e5891b718bf3c74aa9e2559a")
(setf (get timoo_msgs::timooPacket :datatype-) "timoo_msgs/timooPacket")
(setf (get timoo_msgs::timooPacket :definition-)
      "# Raw timoo LIDAR packet.

time stamp              # packet timestamp
uint8[1206] data        # packet contents
time data_stamp       # packet timestamp[year-month-day-hour form DISOP]
bool gps_status         # gps status from DISOP
")



(provide :timoo_msgs/timooPacket "0ff7fd67e5891b718bf3c74aa9e2559a")


