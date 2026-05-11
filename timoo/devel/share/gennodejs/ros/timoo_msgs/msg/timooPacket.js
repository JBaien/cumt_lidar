// Auto-generated. Do not edit!

// (in-package timoo_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class timooPacket {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.stamp = null;
      this.data = null;
      this.data_stamp = null;
      this.gps_status = null;
    }
    else {
      if (initObj.hasOwnProperty('stamp')) {
        this.stamp = initObj.stamp
      }
      else {
        this.stamp = {secs: 0, nsecs: 0};
      }
      if (initObj.hasOwnProperty('data')) {
        this.data = initObj.data
      }
      else {
        this.data = new Array(1206).fill(0);
      }
      if (initObj.hasOwnProperty('data_stamp')) {
        this.data_stamp = initObj.data_stamp
      }
      else {
        this.data_stamp = {secs: 0, nsecs: 0};
      }
      if (initObj.hasOwnProperty('gps_status')) {
        this.gps_status = initObj.gps_status
      }
      else {
        this.gps_status = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type timooPacket
    // Serialize message field [stamp]
    bufferOffset = _serializer.time(obj.stamp, buffer, bufferOffset);
    // Check that the constant length array field [data] has the right length
    if (obj.data.length !== 1206) {
      throw new Error('Unable to serialize array field data - length must be 1206')
    }
    // Serialize message field [data]
    bufferOffset = _arraySerializer.uint8(obj.data, buffer, bufferOffset, 1206);
    // Serialize message field [data_stamp]
    bufferOffset = _serializer.time(obj.data_stamp, buffer, bufferOffset);
    // Serialize message field [gps_status]
    bufferOffset = _serializer.bool(obj.gps_status, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type timooPacket
    let len;
    let data = new timooPacket(null);
    // Deserialize message field [stamp]
    data.stamp = _deserializer.time(buffer, bufferOffset);
    // Deserialize message field [data]
    data.data = _arrayDeserializer.uint8(buffer, bufferOffset, 1206)
    // Deserialize message field [data_stamp]
    data.data_stamp = _deserializer.time(buffer, bufferOffset);
    // Deserialize message field [gps_status]
    data.gps_status = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1223;
  }

  static datatype() {
    // Returns string type for a message object
    return 'timoo_msgs/timooPacket';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0ff7fd67e5891b718bf3c74aa9e2559a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Raw timoo LIDAR packet.
    
    time stamp              # packet timestamp
    uint8[1206] data        # packet contents
    time data_stamp       # packet timestamp[year-month-day-hour form DISOP]
    bool gps_status         # gps status from DISOP
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new timooPacket(null);
    if (msg.stamp !== undefined) {
      resolved.stamp = msg.stamp;
    }
    else {
      resolved.stamp = {secs: 0, nsecs: 0}
    }

    if (msg.data !== undefined) {
      resolved.data = msg.data;
    }
    else {
      resolved.data = new Array(1206).fill(0)
    }

    if (msg.data_stamp !== undefined) {
      resolved.data_stamp = msg.data_stamp;
    }
    else {
      resolved.data_stamp = {secs: 0, nsecs: 0}
    }

    if (msg.gps_status !== undefined) {
      resolved.gps_status = msg.gps_status;
    }
    else {
      resolved.gps_status = false
    }

    return resolved;
    }
};

module.exports = timooPacket;
