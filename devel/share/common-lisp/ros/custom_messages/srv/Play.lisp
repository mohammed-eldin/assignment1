; Auto-generated. Do not edit!


(cl:in-package custom_messages-srv)


;//! \htmlinclude Play-request.msg.html

(cl:defclass <Play-request> (roslisp-msg-protocol:ros-message)
  ((play_pose_x
    :reader play_pose_x
    :initarg :play_pose_x
    :type cl:float
    :initform 0.0)
   (play_pose_y
    :reader play_pose_y
    :initarg :play_pose_y
    :type cl:float
    :initform 0.0))
)

(cl:defclass Play-request (<Play-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Play-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Play-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name custom_messages-srv:<Play-request> is deprecated: use custom_messages-srv:Play-request instead.")))

(cl:ensure-generic-function 'play_pose_x-val :lambda-list '(m))
(cl:defmethod play_pose_x-val ((m <Play-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_messages-srv:play_pose_x-val is deprecated.  Use custom_messages-srv:play_pose_x instead.")
  (play_pose_x m))

(cl:ensure-generic-function 'play_pose_y-val :lambda-list '(m))
(cl:defmethod play_pose_y-val ((m <Play-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_messages-srv:play_pose_y-val is deprecated.  Use custom_messages-srv:play_pose_y instead.")
  (play_pose_y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Play-request>) ostream)
  "Serializes a message object of type '<Play-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'play_pose_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'play_pose_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Play-request>) istream)
  "Deserializes a message object of type '<Play-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'play_pose_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'play_pose_y) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Play-request>)))
  "Returns string type for a service object of type '<Play-request>"
  "custom_messages/PlayRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Play-request)))
  "Returns string type for a service object of type 'Play-request"
  "custom_messages/PlayRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Play-request>)))
  "Returns md5sum for a message object of type '<Play-request>"
  "926c357e5c9b841314d3b8b1f58e3abe")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Play-request)))
  "Returns md5sum for a message object of type 'Play-request"
  "926c357e5c9b841314d3b8b1f58e3abe")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Play-request>)))
  "Returns full string definition for message of type '<Play-request>"
  (cl:format cl:nil "float32 play_pose_x~%float32 play_pose_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Play-request)))
  "Returns full string definition for message of type 'Play-request"
  (cl:format cl:nil "float32 play_pose_x~%float32 play_pose_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Play-request>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Play-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Play-request
    (cl:cons ':play_pose_x (play_pose_x msg))
    (cl:cons ':play_pose_y (play_pose_y msg))
))
;//! \htmlinclude Play-response.msg.html

(cl:defclass <Play-response> (roslisp-msg-protocol:ros-message)
  ((play_res
    :reader play_res
    :initarg :play_res
    :type cl:float
    :initform 0.0))
)

(cl:defclass Play-response (<Play-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Play-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Play-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name custom_messages-srv:<Play-response> is deprecated: use custom_messages-srv:Play-response instead.")))

(cl:ensure-generic-function 'play_res-val :lambda-list '(m))
(cl:defmethod play_res-val ((m <Play-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_messages-srv:play_res-val is deprecated.  Use custom_messages-srv:play_res instead.")
  (play_res m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Play-response>) ostream)
  "Serializes a message object of type '<Play-response>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'play_res))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Play-response>) istream)
  "Deserializes a message object of type '<Play-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'play_res) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Play-response>)))
  "Returns string type for a service object of type '<Play-response>"
  "custom_messages/PlayResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Play-response)))
  "Returns string type for a service object of type 'Play-response"
  "custom_messages/PlayResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Play-response>)))
  "Returns md5sum for a message object of type '<Play-response>"
  "926c357e5c9b841314d3b8b1f58e3abe")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Play-response)))
  "Returns md5sum for a message object of type 'Play-response"
  "926c357e5c9b841314d3b8b1f58e3abe")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Play-response>)))
  "Returns full string definition for message of type '<Play-response>"
  (cl:format cl:nil "float32 play_res~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Play-response)))
  "Returns full string definition for message of type 'Play-response"
  (cl:format cl:nil "float32 play_res~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Play-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Play-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Play-response
    (cl:cons ':play_res (play_res msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Play)))
  'Play-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Play)))
  'Play-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Play)))
  "Returns string type for a service object of type '<Play>"
  "custom_messages/Play")