;; Auto-generated. Do not edit!


(when (boundp 'custom_messages::Play)
  (if (not (find-package "CUSTOM_MESSAGES"))
    (make-package "CUSTOM_MESSAGES"))
  (shadow 'Play (find-package "CUSTOM_MESSAGES")))
(unless (find-package "CUSTOM_MESSAGES::PLAY")
  (make-package "CUSTOM_MESSAGES::PLAY"))
(unless (find-package "CUSTOM_MESSAGES::PLAYREQUEST")
  (make-package "CUSTOM_MESSAGES::PLAYREQUEST"))
(unless (find-package "CUSTOM_MESSAGES::PLAYRESPONSE")
  (make-package "CUSTOM_MESSAGES::PLAYRESPONSE"))

(in-package "ROS")





(defclass custom_messages::PlayRequest
  :super ros::object
  :slots (_play_pose_x _play_pose_y ))

(defmethod custom_messages::PlayRequest
  (:init
   (&key
    ((:play_pose_x __play_pose_x) 0.0)
    ((:play_pose_y __play_pose_y) 0.0)
    )
   (send-super :init)
   (setq _play_pose_x (float __play_pose_x))
   (setq _play_pose_y (float __play_pose_y))
   self)
  (:play_pose_x
   (&optional __play_pose_x)
   (if __play_pose_x (setq _play_pose_x __play_pose_x)) _play_pose_x)
  (:play_pose_y
   (&optional __play_pose_y)
   (if __play_pose_y (setq _play_pose_y __play_pose_y)) _play_pose_y)
  (:serialization-length
   ()
   (+
    ;; float32 _play_pose_x
    4
    ;; float32 _play_pose_y
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _play_pose_x
       (sys::poke _play_pose_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _play_pose_y
       (sys::poke _play_pose_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _play_pose_x
     (setq _play_pose_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _play_pose_y
     (setq _play_pose_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass custom_messages::PlayResponse
  :super ros::object
  :slots (_play_res ))

(defmethod custom_messages::PlayResponse
  (:init
   (&key
    ((:play_res __play_res) 0.0)
    )
   (send-super :init)
   (setq _play_res (float __play_res))
   self)
  (:play_res
   (&optional __play_res)
   (if __play_res (setq _play_res __play_res)) _play_res)
  (:serialization-length
   ()
   (+
    ;; float32 _play_res
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _play_res
       (sys::poke _play_res (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _play_res
     (setq _play_res (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass custom_messages::Play
  :super ros::object
  :slots ())

(setf (get custom_messages::Play :md5sum-) "926c357e5c9b841314d3b8b1f58e3abe")
(setf (get custom_messages::Play :datatype-) "custom_messages/Play")
(setf (get custom_messages::Play :request) custom_messages::PlayRequest)
(setf (get custom_messages::Play :response) custom_messages::PlayResponse)

(defmethod custom_messages::PlayRequest
  (:response () (instance custom_messages::PlayResponse :init)))

(setf (get custom_messages::PlayRequest :md5sum-) "926c357e5c9b841314d3b8b1f58e3abe")
(setf (get custom_messages::PlayRequest :datatype-) "custom_messages/PlayRequest")
(setf (get custom_messages::PlayRequest :definition-)
      "float32 play_pose_x
float32 play_pose_y
---
float32 play_res

")

(setf (get custom_messages::PlayResponse :md5sum-) "926c357e5c9b841314d3b8b1f58e3abe")
(setf (get custom_messages::PlayResponse :datatype-) "custom_messages/PlayResponse")
(setf (get custom_messages::PlayResponse :definition-)
      "float32 play_pose_x
float32 play_pose_y
---
float32 play_res

")



(provide :custom_messages/Play "926c357e5c9b841314d3b8b1f58e3abe")


