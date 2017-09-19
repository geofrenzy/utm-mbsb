;; Auto-generated. Do not edit!


(when (boundp 'gf_beacon::gf_encoding)
  (if (not (find-package "GF_BEACON"))
    (make-package "GF_BEACON"))
  (shadow 'gf_encoding (find-package "GF_BEACON")))
(unless (find-package "GF_BEACON::GF_ENCODING")
  (make-package "GF_BEACON::GF_ENCODING"))
(unless (find-package "GF_BEACON::GF_ENCODINGREQUEST")
  (make-package "GF_BEACON::GF_ENCODINGREQUEST"))
(unless (find-package "GF_BEACON::GF_ENCODINGRESPONSE")
  (make-package "GF_BEACON::GF_ENCODINGRESPONSE"))

(in-package "ROS")





(defclass gf_beacon::gf_encodingRequest
  :super ros::object
  :slots (_lng_deg _lat_deg _alt_agl_m _speed_mph _heading_deg _battery_level _flying_state_on _return_to_home_state_on _forced_landing_state_on ))

(defmethod gf_beacon::gf_encodingRequest
  (:init
   (&key
    ((:lng_deg __lng_deg) 0.0)
    ((:lat_deg __lat_deg) 0.0)
    ((:alt_agl_m __alt_agl_m) 0.0)
    ((:speed_mph __speed_mph) 0.0)
    ((:heading_deg __heading_deg) 0.0)
    ((:battery_level __battery_level) 0.0)
    ((:flying_state_on __flying_state_on) 0)
    ((:return_to_home_state_on __return_to_home_state_on) 0)
    ((:forced_landing_state_on __forced_landing_state_on) 0)
    )
   (send-super :init)
   (setq _lng_deg (float __lng_deg))
   (setq _lat_deg (float __lat_deg))
   (setq _alt_agl_m (float __alt_agl_m))
   (setq _speed_mph (float __speed_mph))
   (setq _heading_deg (float __heading_deg))
   (setq _battery_level (float __battery_level))
   (setq _flying_state_on (round __flying_state_on))
   (setq _return_to_home_state_on (round __return_to_home_state_on))
   (setq _forced_landing_state_on (round __forced_landing_state_on))
   self)
  (:lng_deg
   (&optional __lng_deg)
   (if __lng_deg (setq _lng_deg __lng_deg)) _lng_deg)
  (:lat_deg
   (&optional __lat_deg)
   (if __lat_deg (setq _lat_deg __lat_deg)) _lat_deg)
  (:alt_agl_m
   (&optional __alt_agl_m)
   (if __alt_agl_m (setq _alt_agl_m __alt_agl_m)) _alt_agl_m)
  (:speed_mph
   (&optional __speed_mph)
   (if __speed_mph (setq _speed_mph __speed_mph)) _speed_mph)
  (:heading_deg
   (&optional __heading_deg)
   (if __heading_deg (setq _heading_deg __heading_deg)) _heading_deg)
  (:battery_level
   (&optional __battery_level)
   (if __battery_level (setq _battery_level __battery_level)) _battery_level)
  (:flying_state_on
   (&optional __flying_state_on)
   (if __flying_state_on (setq _flying_state_on __flying_state_on)) _flying_state_on)
  (:return_to_home_state_on
   (&optional __return_to_home_state_on)
   (if __return_to_home_state_on (setq _return_to_home_state_on __return_to_home_state_on)) _return_to_home_state_on)
  (:forced_landing_state_on
   (&optional __forced_landing_state_on)
   (if __forced_landing_state_on (setq _forced_landing_state_on __forced_landing_state_on)) _forced_landing_state_on)
  (:serialization-length
   ()
   (+
    ;; float64 _lng_deg
    8
    ;; float64 _lat_deg
    8
    ;; float64 _alt_agl_m
    8
    ;; float64 _speed_mph
    8
    ;; float64 _heading_deg
    8
    ;; float64 _battery_level
    8
    ;; uint16 _flying_state_on
    2
    ;; uint16 _return_to_home_state_on
    2
    ;; uint16 _forced_landing_state_on
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _lng_deg
       (sys::poke _lng_deg (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _lat_deg
       (sys::poke _lat_deg (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _alt_agl_m
       (sys::poke _alt_agl_m (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _speed_mph
       (sys::poke _speed_mph (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _heading_deg
       (sys::poke _heading_deg (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _battery_level
       (sys::poke _battery_level (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; uint16 _flying_state_on
       (write-word _flying_state_on s)
     ;; uint16 _return_to_home_state_on
       (write-word _return_to_home_state_on s)
     ;; uint16 _forced_landing_state_on
       (write-word _forced_landing_state_on s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _lng_deg
     (setq _lng_deg (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _lat_deg
     (setq _lat_deg (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _alt_agl_m
     (setq _alt_agl_m (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _speed_mph
     (setq _speed_mph (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _heading_deg
     (setq _heading_deg (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _battery_level
     (setq _battery_level (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; uint16 _flying_state_on
     (setq _flying_state_on (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _return_to_home_state_on
     (setq _return_to_home_state_on (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _forced_landing_state_on
     (setq _forced_landing_state_on (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(defclass gf_beacon::gf_encodingResponse
  :super ros::object
  :slots (_encoded ))

(defmethod gf_beacon::gf_encodingResponse
  (:init
   (&key
    ((:encoded __encoded) "")
    )
   (send-super :init)
   (setq _encoded (string __encoded))
   self)
  (:encoded
   (&optional __encoded)
   (if __encoded (setq _encoded __encoded)) _encoded)
  (:serialization-length
   ()
   (+
    ;; string _encoded
    4 (length _encoded)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _encoded
       (write-long (length _encoded) s) (princ _encoded s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _encoded
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _encoded (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass gf_beacon::gf_encoding
  :super ros::object
  :slots ())

(setf (get gf_beacon::gf_encoding :md5sum-) "916bededc1f7b96442f9b7ace1020840")
(setf (get gf_beacon::gf_encoding :datatype-) "gf_beacon/gf_encoding")
(setf (get gf_beacon::gf_encoding :request) gf_beacon::gf_encodingRequest)
(setf (get gf_beacon::gf_encoding :response) gf_beacon::gf_encodingResponse)

(defmethod gf_beacon::gf_encodingRequest
  (:response () (instance gf_beacon::gf_encodingResponse :init)))

(setf (get gf_beacon::gf_encodingRequest :md5sum-) "916bededc1f7b96442f9b7ace1020840")
(setf (get gf_beacon::gf_encodingRequest :datatype-) "gf_beacon/gf_encodingRequest")
(setf (get gf_beacon::gf_encodingRequest :definition-)
      "float64 lng_deg
float64 lat_deg
float64 alt_agl_m
float64 speed_mph
float64 heading_deg
float64 battery_level
uint16 flying_state_on
uint16 return_to_home_state_on
uint16 forced_landing_state_on
---
string encoded

")

(setf (get gf_beacon::gf_encodingResponse :md5sum-) "916bededc1f7b96442f9b7ace1020840")
(setf (get gf_beacon::gf_encodingResponse :datatype-) "gf_beacon/gf_encodingResponse")
(setf (get gf_beacon::gf_encodingResponse :definition-)
      "float64 lng_deg
float64 lat_deg
float64 alt_agl_m
float64 speed_mph
float64 heading_deg
float64 battery_level
uint16 flying_state_on
uint16 return_to_home_state_on
uint16 forced_landing_state_on
---
string encoded

")



(provide :gf_beacon/gf_encoding "916bededc1f7b96442f9b7ace1020840")


