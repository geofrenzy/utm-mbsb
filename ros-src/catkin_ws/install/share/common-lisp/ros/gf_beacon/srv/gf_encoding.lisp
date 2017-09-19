; Auto-generated. Do not edit!


(cl:in-package gf_beacon-srv)


;//! \htmlinclude gf_encoding-request.msg.html

(cl:defclass <gf_encoding-request> (roslisp-msg-protocol:ros-message)
  ((lng_deg
    :reader lng_deg
    :initarg :lng_deg
    :type cl:float
    :initform 0.0)
   (lat_deg
    :reader lat_deg
    :initarg :lat_deg
    :type cl:float
    :initform 0.0)
   (alt_agl_m
    :reader alt_agl_m
    :initarg :alt_agl_m
    :type cl:float
    :initform 0.0)
   (speed_mph
    :reader speed_mph
    :initarg :speed_mph
    :type cl:float
    :initform 0.0)
   (heading_deg
    :reader heading_deg
    :initarg :heading_deg
    :type cl:float
    :initform 0.0)
   (battery_level
    :reader battery_level
    :initarg :battery_level
    :type cl:float
    :initform 0.0)
   (flying_state_on
    :reader flying_state_on
    :initarg :flying_state_on
    :type cl:fixnum
    :initform 0)
   (return_to_home_state_on
    :reader return_to_home_state_on
    :initarg :return_to_home_state_on
    :type cl:fixnum
    :initform 0)
   (forced_landing_state_on
    :reader forced_landing_state_on
    :initarg :forced_landing_state_on
    :type cl:fixnum
    :initform 0))
)

(cl:defclass gf_encoding-request (<gf_encoding-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <gf_encoding-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'gf_encoding-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gf_beacon-srv:<gf_encoding-request> is deprecated: use gf_beacon-srv:gf_encoding-request instead.")))

(cl:ensure-generic-function 'lng_deg-val :lambda-list '(m))
(cl:defmethod lng_deg-val ((m <gf_encoding-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gf_beacon-srv:lng_deg-val is deprecated.  Use gf_beacon-srv:lng_deg instead.")
  (lng_deg m))

(cl:ensure-generic-function 'lat_deg-val :lambda-list '(m))
(cl:defmethod lat_deg-val ((m <gf_encoding-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gf_beacon-srv:lat_deg-val is deprecated.  Use gf_beacon-srv:lat_deg instead.")
  (lat_deg m))

(cl:ensure-generic-function 'alt_agl_m-val :lambda-list '(m))
(cl:defmethod alt_agl_m-val ((m <gf_encoding-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gf_beacon-srv:alt_agl_m-val is deprecated.  Use gf_beacon-srv:alt_agl_m instead.")
  (alt_agl_m m))

(cl:ensure-generic-function 'speed_mph-val :lambda-list '(m))
(cl:defmethod speed_mph-val ((m <gf_encoding-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gf_beacon-srv:speed_mph-val is deprecated.  Use gf_beacon-srv:speed_mph instead.")
  (speed_mph m))

(cl:ensure-generic-function 'heading_deg-val :lambda-list '(m))
(cl:defmethod heading_deg-val ((m <gf_encoding-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gf_beacon-srv:heading_deg-val is deprecated.  Use gf_beacon-srv:heading_deg instead.")
  (heading_deg m))

(cl:ensure-generic-function 'battery_level-val :lambda-list '(m))
(cl:defmethod battery_level-val ((m <gf_encoding-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gf_beacon-srv:battery_level-val is deprecated.  Use gf_beacon-srv:battery_level instead.")
  (battery_level m))

(cl:ensure-generic-function 'flying_state_on-val :lambda-list '(m))
(cl:defmethod flying_state_on-val ((m <gf_encoding-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gf_beacon-srv:flying_state_on-val is deprecated.  Use gf_beacon-srv:flying_state_on instead.")
  (flying_state_on m))

(cl:ensure-generic-function 'return_to_home_state_on-val :lambda-list '(m))
(cl:defmethod return_to_home_state_on-val ((m <gf_encoding-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gf_beacon-srv:return_to_home_state_on-val is deprecated.  Use gf_beacon-srv:return_to_home_state_on instead.")
  (return_to_home_state_on m))

(cl:ensure-generic-function 'forced_landing_state_on-val :lambda-list '(m))
(cl:defmethod forced_landing_state_on-val ((m <gf_encoding-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gf_beacon-srv:forced_landing_state_on-val is deprecated.  Use gf_beacon-srv:forced_landing_state_on instead.")
  (forced_landing_state_on m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <gf_encoding-request>) ostream)
  "Serializes a message object of type '<gf_encoding-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'lng_deg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'lat_deg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'alt_agl_m))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'speed_mph))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'heading_deg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'battery_level))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'flying_state_on)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'flying_state_on)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'return_to_home_state_on)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'return_to_home_state_on)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'forced_landing_state_on)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'forced_landing_state_on)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <gf_encoding-request>) istream)
  "Deserializes a message object of type '<gf_encoding-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'lng_deg) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'lat_deg) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'alt_agl_m) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'speed_mph) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'heading_deg) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'battery_level) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'flying_state_on)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'flying_state_on)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'return_to_home_state_on)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'return_to_home_state_on)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'forced_landing_state_on)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'forced_landing_state_on)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<gf_encoding-request>)))
  "Returns string type for a service object of type '<gf_encoding-request>"
  "gf_beacon/gf_encodingRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'gf_encoding-request)))
  "Returns string type for a service object of type 'gf_encoding-request"
  "gf_beacon/gf_encodingRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<gf_encoding-request>)))
  "Returns md5sum for a message object of type '<gf_encoding-request>"
  "916bededc1f7b96442f9b7ace1020840")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'gf_encoding-request)))
  "Returns md5sum for a message object of type 'gf_encoding-request"
  "916bededc1f7b96442f9b7ace1020840")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<gf_encoding-request>)))
  "Returns full string definition for message of type '<gf_encoding-request>"
  (cl:format cl:nil "float64 lng_deg~%float64 lat_deg~%float64 alt_agl_m~%float64 speed_mph~%float64 heading_deg~%float64 battery_level~%uint16 flying_state_on~%uint16 return_to_home_state_on~%uint16 forced_landing_state_on~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'gf_encoding-request)))
  "Returns full string definition for message of type 'gf_encoding-request"
  (cl:format cl:nil "float64 lng_deg~%float64 lat_deg~%float64 alt_agl_m~%float64 speed_mph~%float64 heading_deg~%float64 battery_level~%uint16 flying_state_on~%uint16 return_to_home_state_on~%uint16 forced_landing_state_on~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <gf_encoding-request>))
  (cl:+ 0
     8
     8
     8
     8
     8
     8
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <gf_encoding-request>))
  "Converts a ROS message object to a list"
  (cl:list 'gf_encoding-request
    (cl:cons ':lng_deg (lng_deg msg))
    (cl:cons ':lat_deg (lat_deg msg))
    (cl:cons ':alt_agl_m (alt_agl_m msg))
    (cl:cons ':speed_mph (speed_mph msg))
    (cl:cons ':heading_deg (heading_deg msg))
    (cl:cons ':battery_level (battery_level msg))
    (cl:cons ':flying_state_on (flying_state_on msg))
    (cl:cons ':return_to_home_state_on (return_to_home_state_on msg))
    (cl:cons ':forced_landing_state_on (forced_landing_state_on msg))
))
;//! \htmlinclude gf_encoding-response.msg.html

(cl:defclass <gf_encoding-response> (roslisp-msg-protocol:ros-message)
  ((encoded
    :reader encoded
    :initarg :encoded
    :type cl:string
    :initform ""))
)

(cl:defclass gf_encoding-response (<gf_encoding-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <gf_encoding-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'gf_encoding-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gf_beacon-srv:<gf_encoding-response> is deprecated: use gf_beacon-srv:gf_encoding-response instead.")))

(cl:ensure-generic-function 'encoded-val :lambda-list '(m))
(cl:defmethod encoded-val ((m <gf_encoding-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gf_beacon-srv:encoded-val is deprecated.  Use gf_beacon-srv:encoded instead.")
  (encoded m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <gf_encoding-response>) ostream)
  "Serializes a message object of type '<gf_encoding-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'encoded))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'encoded))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <gf_encoding-response>) istream)
  "Deserializes a message object of type '<gf_encoding-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'encoded) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'encoded) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<gf_encoding-response>)))
  "Returns string type for a service object of type '<gf_encoding-response>"
  "gf_beacon/gf_encodingResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'gf_encoding-response)))
  "Returns string type for a service object of type 'gf_encoding-response"
  "gf_beacon/gf_encodingResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<gf_encoding-response>)))
  "Returns md5sum for a message object of type '<gf_encoding-response>"
  "916bededc1f7b96442f9b7ace1020840")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'gf_encoding-response)))
  "Returns md5sum for a message object of type 'gf_encoding-response"
  "916bededc1f7b96442f9b7ace1020840")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<gf_encoding-response>)))
  "Returns full string definition for message of type '<gf_encoding-response>"
  (cl:format cl:nil "string encoded~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'gf_encoding-response)))
  "Returns full string definition for message of type 'gf_encoding-response"
  (cl:format cl:nil "string encoded~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <gf_encoding-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'encoded))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <gf_encoding-response>))
  "Converts a ROS message object to a list"
  (cl:list 'gf_encoding-response
    (cl:cons ':encoded (encoded msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'gf_encoding)))
  'gf_encoding-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'gf_encoding)))
  'gf_encoding-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'gf_encoding)))
  "Returns string type for a service object of type '<gf_encoding>"
  "gf_beacon/gf_encoding")