; Auto-generated. Do not edit!


(cl:in-package timoo_msgs-msg)


;//! \htmlinclude timooPacket.msg.html

(cl:defclass <timooPacket> (roslisp-msg-protocol:ros-message)
  ((stamp
    :reader stamp
    :initarg :stamp
    :type cl:real
    :initform 0)
   (data
    :reader data
    :initarg :data
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 1206 :element-type 'cl:fixnum :initial-element 0))
   (data_stamp
    :reader data_stamp
    :initarg :data_stamp
    :type cl:real
    :initform 0)
   (gps_status
    :reader gps_status
    :initarg :gps_status
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass timooPacket (<timooPacket>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <timooPacket>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'timooPacket)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name timoo_msgs-msg:<timooPacket> is deprecated: use timoo_msgs-msg:timooPacket instead.")))

(cl:ensure-generic-function 'stamp-val :lambda-list '(m))
(cl:defmethod stamp-val ((m <timooPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader timoo_msgs-msg:stamp-val is deprecated.  Use timoo_msgs-msg:stamp instead.")
  (stamp m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <timooPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader timoo_msgs-msg:data-val is deprecated.  Use timoo_msgs-msg:data instead.")
  (data m))

(cl:ensure-generic-function 'data_stamp-val :lambda-list '(m))
(cl:defmethod data_stamp-val ((m <timooPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader timoo_msgs-msg:data_stamp-val is deprecated.  Use timoo_msgs-msg:data_stamp instead.")
  (data_stamp m))

(cl:ensure-generic-function 'gps_status-val :lambda-list '(m))
(cl:defmethod gps_status-val ((m <timooPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader timoo_msgs-msg:gps_status-val is deprecated.  Use timoo_msgs-msg:gps_status instead.")
  (gps_status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <timooPacket>) ostream)
  "Serializes a message object of type '<timooPacket>"
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'stamp)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'stamp) (cl:floor (cl:slot-value msg 'stamp)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream))
   (cl:slot-value msg 'data))
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'data_stamp)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'data_stamp) (cl:floor (cl:slot-value msg 'data_stamp)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'gps_status) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <timooPacket>) istream)
  "Deserializes a message object of type '<timooPacket>"
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'stamp) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
  (cl:setf (cl:slot-value msg 'data) (cl:make-array 1206))
  (cl:let ((vals (cl:slot-value msg 'data)))
    (cl:dotimes (i 1206)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))))
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'data_stamp) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
    (cl:setf (cl:slot-value msg 'gps_status) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<timooPacket>)))
  "Returns string type for a message object of type '<timooPacket>"
  "timoo_msgs/timooPacket")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'timooPacket)))
  "Returns string type for a message object of type 'timooPacket"
  "timoo_msgs/timooPacket")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<timooPacket>)))
  "Returns md5sum for a message object of type '<timooPacket>"
  "0ff7fd67e5891b718bf3c74aa9e2559a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'timooPacket)))
  "Returns md5sum for a message object of type 'timooPacket"
  "0ff7fd67e5891b718bf3c74aa9e2559a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<timooPacket>)))
  "Returns full string definition for message of type '<timooPacket>"
  (cl:format cl:nil "# Raw timoo LIDAR packet.~%~%time stamp              # packet timestamp~%uint8[1206] data        # packet contents~%time data_stamp       # packet timestamp[year-month-day-hour form DISOP]~%bool gps_status         # gps status from DISOP~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'timooPacket)))
  "Returns full string definition for message of type 'timooPacket"
  (cl:format cl:nil "# Raw timoo LIDAR packet.~%~%time stamp              # packet timestamp~%uint8[1206] data        # packet contents~%time data_stamp       # packet timestamp[year-month-day-hour form DISOP]~%bool gps_status         # gps status from DISOP~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <timooPacket>))
  (cl:+ 0
     8
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     8
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <timooPacket>))
  "Converts a ROS message object to a list"
  (cl:list 'timooPacket
    (cl:cons ':stamp (stamp msg))
    (cl:cons ':data (data msg))
    (cl:cons ':data_stamp (data_stamp msg))
    (cl:cons ':gps_status (gps_status msg))
))
