;; Auto-generated. Do not edit!


(when (boundp 'timoo_msgs::timooStatus)
  (if (not (find-package "TIMOO_MSGS"))
    (make-package "TIMOO_MSGS"))
  (shadow 'timooStatus (find-package "TIMOO_MSGS")))
(unless (find-package "TIMOO_MSGS::TIMOOSTATUS")
  (make-package "TIMOO_MSGS::TIMOOSTATUS"))

(in-package "ROS")
;;//! \htmlinclude timooStatus.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass timoo_msgs::timooStatus
  :super ros::object
  :slots (_header _gps_status _gps_timestamp _vertical_angle_list ))

(defmethod timoo_msgs::timooStatus
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:gps_status __gps_status) nil)
    ((:gps_timestamp __gps_timestamp) (instance std_msgs::Header :init))
    ((:vertical_angle_list __vertical_angle_list) (make-array 16 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _header __header)
   (setq _gps_status __gps_status)
   (setq _gps_timestamp __gps_timestamp)
   (setq _vertical_angle_list __vertical_angle_list)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:gps_status
   (&optional (__gps_status :null))
   (if (not (eq __gps_status :null)) (setq _gps_status __gps_status)) _gps_status)
  (:gps_timestamp
   (&rest __gps_timestamp)
   (if (keywordp (car __gps_timestamp))
       (send* _gps_timestamp __gps_timestamp)
     (progn
       (if __gps_timestamp (setq _gps_timestamp (car __gps_timestamp)))
       _gps_timestamp)))
  (:vertical_angle_list
   (&optional __vertical_angle_list)
   (if __vertical_angle_list (setq _vertical_angle_list __vertical_angle_list)) _vertical_angle_list)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; bool _gps_status
    1
    ;; std_msgs/Header _gps_timestamp
    (send _gps_timestamp :serialization-length)
    ;; float32[16] _vertical_angle_list
    (* 4    16)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; bool _gps_status
       (if _gps_status (write-byte -1 s) (write-byte 0 s))
     ;; std_msgs/Header _gps_timestamp
       (send _gps_timestamp :serialize s)
     ;; float32[16] _vertical_angle_list
     (dotimes (i 16)
       (sys::poke (elt _vertical_angle_list i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; bool _gps_status
     (setq _gps_status (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; std_msgs/Header _gps_timestamp
     (send _gps_timestamp :deserialize buf ptr-) (incf ptr- (send _gps_timestamp :serialization-length))
   ;; float32[16] _vertical_angle_list
   (dotimes (i (length _vertical_angle_list))
     (setf (elt _vertical_angle_list i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;;
   self)
  )

(setf (get timoo_msgs::timooStatus :md5sum-) "db5f4c34cfa1b0d643f4949d2223d340")
(setf (get timoo_msgs::timooStatus :datatype-) "timoo_msgs/timooStatus")
(setf (get timoo_msgs::timooStatus :definition-)
      "# timoo LIDAR scan packets.

Header           header         # standard ROS message header
bool gps_status
Header gps_timestamp
float32[16] vertical_angle_list

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :timoo_msgs/timooStatus "db5f4c34cfa1b0d643f4949d2223d340")


