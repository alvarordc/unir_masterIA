(define (problem problema1) (:domain RPA3)
(:objects 
    a - ambulancia
    e1 e2 - enfermo
    p1 p2 p3 p4 - posicion
)

(:init
    ;todo: put the initial state's facts and numeric values here
    (ambulanciaLibre a)
    (posicionAmbulancia a p1)
    (posicionEnfermo e1 p3)
    (posicionEnfermo e2 p4)
    (puente p1 p2)
    (puente p2 p1)

    (puente p2 p4)
    (puente p4 p2)

    (puente p4 p3)
    (puente p3 p4)
)

(:goal (and
    ;todo: put the goal condition here
    (ambulanciaLibre a)
    (posicionEnfermo e1 p1)
    (posicionEnfermo e2 p1)
))

)
