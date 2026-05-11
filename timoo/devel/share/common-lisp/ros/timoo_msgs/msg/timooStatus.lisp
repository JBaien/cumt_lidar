; Auto-generated. Do not edit!


(cl:in-package timoo_msgs-msg)


;//! \htmlinclude timooStatus.msg.html

(cl:defclass <timooStatus> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (gps_status
    :reader gps_status
    :initarg :gps_status
    :type cl:boolean
    :initform cl:nil)
   (gps_timestamp
    :reader gps_timestamp
    :initarg :gps_timestamp
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (vertical_angle_list
    :reader vertical_angle_list
    :initarg :vertical_angle_list
    :type (cl:vector cl:float)
   :initform (cl:make-array 16 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass timooStatus (<timooStatus>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <timooStatus>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'timooStatus)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name timoo_msgs-msg:<timooStatus> is deprecated: use timoo_msgs-msg:timooStatus instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <timooStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader timoo_msgs-msg:header-val is deprecated.  Use timoo_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'gps_status-val :lambda-list '(m))
(cl:defmethod gps_status-val ((m <timooStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader timoo_msgs-msg:gps_status-val is deprecated.  Use timoo_msgs-msg:gps_status instead.")
  (gps_status m))

(cl:ensure-generic-function 'gps_timestamp-val :lambda-list '(m))
(cl:defmethod gps_timestamp-val ((m <timooStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader timoo_msgs-msg:gps_timestamp-val is deprecated.  Use timoo_msgs-msg:gps_timestamp instead.")
  (gps_timestamp m))

(cl:ensure-generic-function 'vertical_angle_list-val :lambda-list '(m))
(cl:defmethod vertical_angle_list-val ((m <timooStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader timoo_msgs-msg:vertical_angle_list-val is deprecated.  Use timoo_msgs-msg:vertical_angle_list instead.")
  (vertical_angle_list m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <timooStatus>) ostream)
  "Serializes a message object of type '<timooStatus>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'gps_status) 1 0)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'gps_timestamp) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'vertical_angle_list))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <timooStatus>) istream)
  "Deserializes a message object of type '<timooStatus>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:slot-value msg 'gps_status) (cl:not (cl:zerop (cl:read-byte istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'gps_timestamp) istream)
  (cl:setf (cl:slot-value msg 'vertical_angle_list) (cl:make-array 16))
  (cl:let ((vals (cl:slot-value msg 'vertical_angle_list)))
    (cl:dotimes (i 16)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<timooStatus>)))
  "Returns string type for a message object of type '<timooStatus>"
  "timoo_msgs/timooStatus")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'timooStatus)))
  "Returns string type for a message object of type 'timooStatus"
  "timoo_msgs/timooStatus")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<timooStatus>)))
  "Returns md5sum for a message object of type '<timooStatus>"
  "db5f4c34cfa1b0d643f4949d2223d340")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'timooStatus)))
  "Returns md5sum for a message object of type 'timooStatus"
  "db5f4c34cfa1b0d643f4949d2223d340")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<timooStatus>)))
  "Returns full string definition for message of type '<timooStatus>"
  (cl:format cl:nil "# timoo LIDAR scan packets.~%~%Header           header         # standard ROS message header~%bool gps_status~%Header gps_timestamp~%float32[16] vertical_angle_list~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'timooStatus)))
  "Returns full string definition for message of type 'timooStatus"
  (cl:format cl:nil "# timoo LIDAR scan packets.~%~%Header           header         # standard ROS message header~%bool gps_status~%Header gps_timestamp~%float32[16] vertical_angle_list~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <timooStatus>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'gps_timestamp))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'vertical_angle_list) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <timooStatus>))
  "Converts a ROS message object to a list"
  (cl:list 'timooStatus
    (cl:cons ':header (header msg))
    (cl:cons ':gps_status (gps_status msg))
    (cl:cons ':gps_timestamp (gps_timestamp msg))
    (cl:cons ':vertical_angle_list (vertical_angle_list msg))
))
