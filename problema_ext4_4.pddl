(define (problem viatges4) 
    (:domain dominiViatges4)
    (:objects Barcelona Londres Amsterdam Paris Madrid - ciutat
            B1 L1 A1 P1 M1 - hotel
            v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16 v17 v18 v19 v20 - vol
    )

    (:init
        (assignat Barcelona B1)
        (assignat Londres L1)
        (assignat Amsterdam A1)
        (assignat Paris P1)
        (assignat Madrid M1)

        (connecta v1 Barcelona Londres)
        (connecta v2 Barcelona Amsterdam)
        (connecta v3 Barcelona Paris)
        (connecta v4 Barcelona Madrid)
        
        (connecta v5 Londres Barcelona)
        (connecta v6 Londres Amsterdam)
        (connecta v7 Londres Paris)
        (connecta v8 Londres Madrid)
        
        (connecta v9 Amsterdam Barcelona)
        (connecta v10 Amsterdam Londres)
        (connecta v11 Amsterdam Paris)
        (connecta v12 Amsterdam Madrid)
        
        (connecta v13 Paris Barcelona)
        (connecta v14 Paris Londres)
        (connecta v15 Paris Amsterdam)
        (connecta v16 Paris Madrid)
        
        (connecta v17 Madrid Barcelona)
        (connecta v18 Madrid Londres)
        (connecta v19 Madrid Amsterdam)
        (connecta v20 Madrid Paris)

        (= (preu_hotel B1) 70)
        
        (= (preu_hotel L1) 100)
        
        (= (preu_hotel A1) 110)
        
        (= (preu_hotel P1) 60)
        
        (= (preu_hotel M1) 90) 
        

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
        (= (preu_vol v16) 70)
        (= (preu_vol v17) 70)
        (= (preu_vol v18) 70)
        (= (preu_vol v19) 70)
        (= (preu_vol v20) 70)

        (= (interes Barcelona) 3)
        (= (interes Londres) 2)
        (= (interes Amsterdam) 1)
        (= (interes Paris) 3)
        (= (interes Madrid) 2)
        
        (= (num_ciutats_visitades) 0)
        (= (num_dies_totals) 0)
        (= (min_ciutats) 3)
        (= (min_numero_dies) 4)
        (= (min_dies_ciutat) 1)
        (= (max_dies_ciutat) 4)

        (= (preu_maxim) 500)
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
