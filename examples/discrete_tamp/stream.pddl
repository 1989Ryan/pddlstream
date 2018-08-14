(define (stream pick-and-place)
  (:rule
    :inputs (?q ?p)
    :domain (Kin ?q ?p)
    :certified (and (Conf ?q) (Pose ?p))
  )
  ;(:rule ; For debugging
  ;  :inputs (?p)
  ;  :domain (Pose ?p)
  ;  :certified (Pose ?p)
  ;)
  ;(:rule
  ;  :inputs (?b ?p)
  ;  :domain (AtPose ?b ?p) ; This is a fluent
  ;  :certified (and (Block ?b) (Pose ?p))
  ;)

  (:function (Distance ?q1 ?q2)
    (and (Conf ?q1) (Conf ?q2))
  )
  ;(:predicate (Collision ?p1 ?p2) ; TODO: automatically convert these
  ;  (and (Pose ?p1) (Pose ?p2))
  ;)

  (:stream sample-pose
    :outputs (?p)
    :certified (Pose ?p)
  )
  ;(:wild-stream inverse-kinematics ; TODO: push wild-stream?
  (:stream inverse-kinematics
    :inputs (?p)
    :domain (Pose ?p)
    :outputs (?q)
    :certified (Kin ?q ?p)
  )
  (:stream collision-free
    :inputs (?p1 ?p2)
    :domain (and (Pose ?p1) (Pose ?p2))
    :certified (CFree ?p1 ?p2)
  )
)