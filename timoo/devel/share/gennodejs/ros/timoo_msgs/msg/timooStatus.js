// Auto-generated. Do not edit!

// (in-package timoo_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class timooStatus {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.gps_status = null;
      this.gps_timestamp = null;
      this.vertical_angle_list = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('gps_status')) {
        this.gps_status = initObj.gps_status
      }
      else {
        this.gps_status = false;
      }
      if (initObj.hasOwnProperty('gps_timestamp')) {
        this.gps_timestamp = initObj.gps_timestamp
      }
      else {
        this.gps_timestamp = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('vertical_angle_list')) {
        this.vertical_angle_list = initObj.vertical_angle_list
      }
      else {
        this.vertical_angle_list = new Array(16).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type timooStatus
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [gps_status]
    bufferOffset = _serializer.bool(obj.gps_status, buffer, bufferOffset);
    // Serialize message field [gps_timestamp]
    bufferOffset = std_msgs.msg.Header.serialize(obj.gps_timestamp, buffer, bufferOffset);
    // Check that the constant length array field [vertical_angle_list] has the right length
    if (obj.vertical_angle_list.length !== 16) {
      throw new Error('Unable to serialize array field vertical_angle_list - length must be 16')
    }
    // Serialize message field [vertical_angle_list]
    bufferOffset = _arraySerializer.float32(obj.vertical_angle_list, buffer, bufferOffset, 16);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type timooStatus
    let len;
    let data = new timooStatus(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [gps_status]
    data.gps_status = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [gps_timestamp]
    data.gps_timestamp = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [vertical_angle_list]
    data.vertical_angle_list = _arrayDeserializer.float32(buffer, bufferOffset, 16)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += std_msgs.msg.Header.getMessageSize(object.gps_timestamp);
    return length + 65;
  }

  static datatype() {
    // Returns string type for a message object
    return 'timoo_msgs/timooStatus';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'db5f4c34cfa1b0d643f4949d2223d340';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # timoo LIDAR scan packets.
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new timooStatus(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.gps_status !== undefined) {
      resolved.gps_status = msg.gps_status;
    }
    else {
      resolved.gps_status = false
    }

    if (msg.gps_timestamp !== undefined) {
      resolved.gps_timestamp = std_msgs.msg.Header.Resolve(msg.gps_timestamp)
    }
    else {
      resolved.gps_timestamp = new std_msgs.msg.Header()
    }

    if (msg.vertical_angle_list !== undefined) {
      resolved.vertical_angle_list = msg.vertical_angle_list;
    }
    else {
      resolved.vertical_angle_list = new Array(16).fill(0)
    }

    return resolved;
    }
};

module.exports = timooStatus;
