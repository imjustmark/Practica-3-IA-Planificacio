(define (problem viatges4) 
    (:domain dominiViatges4)
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

        (= (preu_hotel B1) 25)
        (= (preu_hotel B2) 50)
        (= (preu_hotel B3) 150)
        (= (preu_hotel L1) 50)
        (= (preu_hotel L2) 90)
        (= (preu_hotel A1) 70)
        (= (preu_hotel P1) 25)
        (= (preu_hotel P2) 50)
        (= (preu_hotel P3) 75)
        (= (preu_hotel P4) 150)
        (= (preu_hotel M1) 50)
        (= (preu_hotel M2) 75)
        (= (preu_hotel M3) 150)
        (= (preu_hotel D1) 50)
        (= (preu_hotel D2) 75)
        (= (preu_hotel D3) 150)

        (= (preu_vol v1) 70)
        (= (preu_vol v2) 70)
        (= (preu_vol v3) 70)
        (= (preu_vol v4) 70)
        (= (preu_vol v5) 70)
        (= (preu_vol v6) 70)
        (= (preu_vol v7) 70)
        (= (preu_vol v8) 70)
        (= (preu_vol v9) 70)
        (= (preu_vol v10) 70)
        (= (preu_vol v11) 70)
        (= (preu_vol v12) 70)
        (= (preu_vol v13) 70)
        (= (preu_vol v14) 70)
        (= (preu_vol v15) 70)

        (= (interes Barcelona) 1)
        (= (interes Londres) 1)
        (= (interes Amsterdam) 3)
        (= (interes Paris) 2)
        (= (interes Madrid) 3)
        (= (interes Dubrovnik) 1)
        
        (= (num_ciutats_visitades) 0)
        (= (num_dies_totals) 0)
        (= (min_ciutats) 3)
        (= (min_numero_dies) 4)
        (= (min_dies_ciutat) 1)
        (= (max_dies_ciutat) 4)

        (= (preu_maxim) 4000)
        (= (preu_minim) 200)
        (= (preu_total) 0)
        (= (interes_total) 0)
    )

    (:goal (and(>= (num_ciutats_visitades) (min_ciutats))
               (>= (num_dies_totals) (min_numero_dies))
               (<= (preu_total) (preu_maxim))
               (>= (preu_total) (preu_minim))
    )
    )

    (:metric minimize (+ (* 100 (interes_total)) (preu_total)))

    )