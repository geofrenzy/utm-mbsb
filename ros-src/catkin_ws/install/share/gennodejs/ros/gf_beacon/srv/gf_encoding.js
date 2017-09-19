// Auto-generated. Do not edit!

// (in-package gf_beacon.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class gf_encodingRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.lng_deg = null;
      this.lat_deg = null;
      this.alt_agl_m = null;
      this.speed_mph = null;
      this.heading_deg = null;
      this.battery_level = null;
      this.flying_state_on = null;
      this.return_to_home_state_on = null;
      this.forced_landing_state_on = null;
    }
    else {
      if (initObj.hasOwnProperty('lng_deg')) {
        this.lng_deg = initObj.lng_deg
      }
      else {
        this.lng_deg = 0.0;
      }
      if (initObj.hasOwnProperty('lat_deg')) {
        this.lat_deg = initObj.lat_deg
      }
      else {
        this.lat_deg = 0.0;
      }
      if (initObj.hasOwnProperty('alt_agl_m')) {
        this.alt_agl_m = initObj.alt_agl_m
      }
      else {
        this.alt_agl_m = 0.0;
      }
      if (initObj.hasOwnProperty('speed_mph')) {
        this.speed_mph = initObj.speed_mph
      }
      else {
        this.speed_mph = 0.0;
      }
      if (initObj.hasOwnProperty('heading_deg')) {
        this.heading_deg = initObj.heading_deg
      }
      else {
        this.heading_deg = 0.0;
      }
      if (initObj.hasOwnProperty('battery_level')) {
        this.battery_level = initObj.battery_level
      }
      else {
        this.battery_level = 0.0;
      }
      if (initObj.hasOwnProperty('flying_state_on')) {
        this.flying_state_on = initObj.flying_state_on
      }
      else {
        this.flying_state_on = 0;
      }
      if (initObj.hasOwnProperty('return_to_home_state_on')) {
        this.return_to_home_state_on = initObj.return_to_home_state_on
      }
      else {
        this.return_to_home_state_on = 0;
      }
      if (initObj.hasOwnProperty('forced_landing_state_on')) {
        this.forced_landing_state_on = initObj.forced_landing_state_on
      }
      else {
        this.forced_landing_state_on = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type gf_encodingRequest
    // Serialize message field [lng_deg]
    bufferOffset = _serializer.float64(obj.lng_deg, buffer, bufferOffset);
    // Serialize message field [lat_deg]
    bufferOffset = _serializer.float64(obj.lat_deg, buffer, bufferOffset);
    // Serialize message field [alt_agl_m]
    bufferOffset = _serializer.float64(obj.alt_agl_m, buffer, bufferOffset);
    // Serialize message field [speed_mph]
    bufferOffset = _serializer.float64(obj.speed_mph, buffer, bufferOffset);
    // Serialize message field [heading_deg]
    bufferOffset = _serializer.float64(obj.heading_deg, buffer, bufferOffset);
    // Serialize message field [battery_level]
    bufferOffset = _serializer.float64(obj.battery_level, buffer, bufferOffset);
    // Serialize message field [flying_state_on]
    bufferOffset = _serializer.uint16(obj.flying_state_on, buffer, bufferOffset);
    // Serialize message field [return_to_home_state_on]
    bufferOffset = _serializer.uint16(obj.return_to_home_state_on, buffer, bufferOffset);
    // Serialize message field [forced_landing_state_on]
    bufferOffset = _serializer.uint16(obj.forced_landing_state_on, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type gf_encodingRequest
    let len;
    let data = new gf_encodingRequest(null);
    // Deserialize message field [lng_deg]
    data.lng_deg = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [lat_deg]
    data.lat_deg = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [alt_agl_m]
    data.alt_agl_m = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [speed_mph]
    data.speed_mph = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [heading_deg]
    data.heading_deg = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [battery_level]
    data.battery_level = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [flying_state_on]
    data.flying_state_on = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [return_to_home_state_on]
    data.return_to_home_state_on = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [forced_landing_state_on]
    data.forced_landing_state_on = _deserializer.uint16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 54;
  }

  static datatype() {
    // Returns string type for a service object
    return 'gf_beacon/gf_encodingRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b4f5ff271c45bb829d5e504e08e16e34';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 lng_deg
    float64 lat_deg
    float64 alt_agl_m
    float64 speed_mph
    float64 heading_deg
    float64 battery_level
    uint16 flying_state_on
    uint16 return_to_home_state_on
    uint16 forced_landing_state_on
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new gf_encodingRequest(null);
    if (msg.lng_deg !== undefined) {
      resolved.lng_deg = msg.lng_deg;
    }
    else {
      resolved.lng_deg = 0.0
    }

    if (msg.lat_deg !== undefined) {
      resolved.lat_deg = msg.lat_deg;
    }
    else {
      resolved.lat_deg = 0.0
    }

    if (msg.alt_agl_m !== undefined) {
      resolved.alt_agl_m = msg.alt_agl_m;
    }
    else {
      resolved.alt_agl_m = 0.0
    }

    if (msg.speed_mph !== undefined) {
      resolved.speed_mph = msg.speed_mph;
    }
    else {
      resolved.speed_mph = 0.0
    }

    if (msg.heading_deg !== undefined) {
      resolved.heading_deg = msg.heading_deg;
    }
    else {
      resolved.heading_deg = 0.0
    }

    if (msg.battery_level !== undefined) {
      resolved.battery_level = msg.battery_level;
    }
    else {
      resolved.battery_level = 0.0
    }

    if (msg.flying_state_on !== undefined) {
      resolved.flying_state_on = msg.flying_state_on;
    }
    else {
      resolved.flying_state_on = 0
    }

    if (msg.return_to_home_state_on !== undefined) {
      resolved.return_to_home_state_on = msg.return_to_home_state_on;
    }
    else {
      resolved.return_to_home_state_on = 0
    }

    if (msg.forced_landing_state_on !== undefined) {
      resolved.forced_landing_state_on = msg.forced_landing_state_on;
    }
    else {
      resolved.forced_landing_state_on = 0
    }

    return resolved;
    }
};

class gf_encodingResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.encoded = null;
    }
    else {
      if (initObj.hasOwnProperty('encoded')) {
        this.encoded = initObj.encoded
      }
      else {
        this.encoded = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type gf_encodingResponse
    // Serialize message field [encoded]
    bufferOffset = _serializer.string(obj.encoded, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type gf_encodingResponse
    let len;
    let data = new gf_encodingResponse(null);
    // Deserialize message field [encoded]
    data.encoded = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.encoded.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'gf_beacon/gf_encodingResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd37e4f1e46761defdf5b003341acd010';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string encoded
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new gf_encodingResponse(null);
    if (msg.encoded !== undefined) {
      resolved.encoded = msg.encoded;
    }
    else {
      resolved.encoded = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: gf_encodingRequest,
  Response: gf_encodingResponse,
  md5sum() { return '916bededc1f7b96442f9b7ace1020840'; },
  datatype() { return 'gf_beacon/gf_encoding'; }
};
