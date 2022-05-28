(define (problem viatges) 
    (:domain dominiViatges)
    (:objects Barcelona Londres Amsterdam Paris Madrid Dubrovnik - ciutat
            B1 B2 B3 L1 L2 A1 P1 P2 P3 P4 M1 M2 M3 D1 D2 D3 - hotel
            v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 - vol
    )

    (:init
        (assignat Barcelona B1)
        (assignat Barcelona B2)
        (assignat Barcelona B3)
        (assignat Londres L1)
        (assignat Londres L2)
        (assignat Amsterdam A1)
        (assignat Paris P1)
        (assignat Paris P2)
        (assignat Paris P3)
        (assignat Paris P4)
        (assignat Madrid M1)
        (assignat Madrid M2)
        (assignat Madrid M3)
        (assignat Dubrovnik D1)
        (assignat Dubrovnik D2)
        (assignat Dubrovnik D3)

        (connecta v1 Barcelona Londres)
        (connecta v2 Barcelona Madrid)
        (connecta v3 Barcelona Paris)
        (connecta v4 Londres Amsterdam)
        (connecta v5 Londres Dubrovnik)
        (connecta v6 Amsterdam Madrid)
        (connecta v7 Amsterdam Dubrovnik)
        (connecta v8 Paris Barcelona)
        (connecta v9 Paris Londres)
        (connecta v10 Paris Dubrovnik)
        (connecta v11 Madrid Barcelona)
        (connecta v12 Madrid Amsterdam)
        (connecta v13 Madrid Londres)
        (connecta v14 Dubrovnik Paris)
        (connecta v15 Dubrovnik Barcelona)

        (ara-a Madrid)

        (= (num_ciutats_visitades) 0)
    )

    (:goal (>= (num_ciutats_visitades) 3)
    )

    (:metric minimize (num_ciutats_visitades))
    )