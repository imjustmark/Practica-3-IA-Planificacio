;Header and description

(define (domain dominiViatges)

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
)

(:action ves-a
    :parameters (?c - ciutat ?c2 - ciutat ?h - hotel)
    :precondition (and  (imply (exists (?c1 - ciutat) (ara-a ?c1)) (ara-a ?c))
                        (not (visitada ?c2))
                        (assignat ?c2 ?h)
                        (exists (?v - vol) (connecta ?v ?c ?c2)))
    :effect (and (visitada ?c2) (visitada ?c) (ara-a ?c2) (not (ara-a ?c)) (se-aloja-en ?h) (increase (num_ciutats_visitades) 1))
)
)