
;Header and description

(define (domain dominiViatges1)

    ;remove requirements that are not needed
    (:requirements :strips :adl :typing :equality :fluents)

    (:types ciutat hotel vol)


    (:predicates (assignat ?c - ciutat ?h - hotel)
                (connecta ?v - vol ?c1 - ciutat ?c2 - ciutat)
                (visitada ?c - ciutat)
                (se-aloja-en ?h - hotel)
                (ara-a ?c - ciutat)             
    )


    (:functions (num_ciutats_visitades)
                (dies ?c - ciutat)
                (num_dies_totals)
                (min_numero_dies)
                (min_dies_ciutat)           
                (max_dies_ciutat)          
                (interes_total)
                (interes ?c - ciutat)
    )

    (:action ves-a
        :parameters (?c - ciutat ?c2 - ciutat ?h - hotel)
        :precondition (and  (imply (exists (?c1 - ciutat) (ara-a ?c1)) (ara-a ?c))
                            (not (visitada ?c2))
                            (assignat ?c2 ?h)
                            (exists (?v - vol) (connecta ?v ?c ?c2)))
        :effect (and (visitada ?c2) (visitada ?c) (ara-a ?c2) (not (ara-a ?c)) (se-aloja-en ?h) (assign (dies ?c2) (min_dies_ciutat)) 
                     (increase (num_dies_totals) (min_dies_ciutat)) (increase (interes_total) (interes ?c2)) (increase (num_ciutats_visitades) 1))
    )
                            
    (:action incrementa_num_ciutat
        :parameters(?c - ciutat)
        :precondition (and (exists(?c1 - ciutat) (visitada ?c1)) (visitada ?c)
                        (< (dies ?c) (max_dies_ciutat)))
        :effect (and (increase (dies ?c) 1) (increase (num_dies_totals) 1))
            
    )

    (:action decrementa_num_ciutat
        :parameters(?c - ciutat)
        :precondition (and (exists(?c1 - ciutat) (visitada ?c1)) (visitada ?c)
                        (> (dies ?c) (min_dies_ciutat)))
        :effect (and (decrease (dies ?c) 1) (decrease (num_dies_totals) 1))
            
    )
)
