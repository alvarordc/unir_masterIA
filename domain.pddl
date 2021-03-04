;Header and description

(define (domain RPA3)

;remove requirements that are not needed
(:requirements :strips :typing :negative-preconditions )

(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
    enfermo ambulancia posicion - object
)

(:predicates ;todo: define predicates here
    (posicionAmbulancia ?a - ambulancia ?pos - posicion)
    (posicionEnfermo ?e - enfermo ?pos - posicion)
    (puente ?pos1 - posicion ?pos2 - posicion); se debe definir en ambas direcciones
    (ambulanciaLibre ?a - ambulancia)
    (ambulanciaLlevaEnfermo ?a - ambulancia ?e - enfermo) 
)

;define actions here
(:action subirPaciente
    :parameters (?a - ambulancia ?e - enfermo ?p - posicion)

    :precondition (and
        (posicionEnfermo ?e ?p)
        (posicionAmbulancia ?a ?p)
        (ambulanciaLibre ?a)
     )
    :effect (and 
        (not(ambulanciaLibre ?a))   
        (ambulanciaLlevaEnfermo ?a ?e)   
    )
)
(:action bajarPaciente
    :parameters (?a - ambulancia ?e - enfermo ?p - posicion)
    :precondition (and 
        (posicionAmbulancia ?a ?p)
        (not(ambulanciaLibre ?a)) ; no hace falta explicitar que el enfermo está en la posición pq la ambulancia no está libre
        (ambulanciaLlevaEnfermo ?a ?e)
    )
    :effect (and 
        (ambulanciaLibre ?a)
        (not(ambulanciaLlevaEnfermo ?a ?e))
        (posicionEnfermo ?e ?p) ; se actualiza la posición del enfermo cuando se baja de la ambulancia    
    )
)

(:action conducir
    :parameters (?a - ambulancia ?pOriginal - posicion ?pFinal - posicion)
    :precondition (and
        (posicionAmbulancia ?a ?pOriginal)
        (puente ?pOriginal ?pFinal)
     )
    :effect (and 
        (not(posicionAmbulancia ?a ?pOriginal))
        (posicionAmbulancia ?a ?pFinal)
    )
)




)