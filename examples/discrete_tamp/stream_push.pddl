(define (stream pick-and-place)
  ;(:function (Distance ?q1 ?q2)
  ;  (and (Conf ?q1) (Conf ?q2))
  ;)
  (:wild-stream push-target
    :inputs (?p1 ?p2)
    :domain (and (Pose ?p1) (Pose ?p2))
    :outputs (?q1 ?q2)
    :certified (and (Push ?p1 ?q1 ?p2 ?q2)
                    (Conf ?q1) (Conf ?q2))
  )
  ;(:wild-stream push-direction
  ;  :inputs (?p1)
  ;  :domain (Pose ?p1)
  ;  :outputs (?q1 ?p2 ?q2)
  ;  :certified (and (Push ?p1 ?q1 ?p2 ?q2)
  ;                  (Conf ?q1) (Pose ?p2) (Conf ?q2))
  ;)
  (:stream test-cfree
    :inputs (?p1 ?p2)
    :domain (and (Pose ?p1) (Pose ?p2))
    :certified (CFree ?p1 ?p2)
  )
)