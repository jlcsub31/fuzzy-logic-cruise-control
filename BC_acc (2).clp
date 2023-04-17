(deftemplate DISTANCIA
    0 150
    (
        (muy_cerca (0 1)(30 1)(90 0))
        (cerca (20 0)(60 1)(120 0))
        (adecuada (60 0)(90 1)(120 0))
        (lejos (90 0)(120 1)(150 0))
        (muy_lejos (120 0)(150 1))
    )
)

(deftemplate VELOCIDAD
    -100 100
    (
        (muy_negativa (-100 1)(-60 1)(0 0))
        (negativa (-60 0)(-35 1)(-15 1)(0 0))
        (nula (-25 0)(0 1)(25 0))
        (positiva (0 0)(15 1)(25 1)(50 0))
        (muy_positiva (0 0)(50 1)(100 1))
    )
)

(deftemplate ACELERACION
    -3 3
    (
        (frenar_fuerte (-3 1)(-2 1)(-1.25 0))
        (frenar (-2 0)(-1.25 1)(0 0))
        (ok (-1.25 0)(0 1)(1.25 0))
        (acelerar (0 0)(1.25 1)(2 0))
        (acelerar_fuerte (1.25 0)(2 1)(3 1))
    )
)

(defrule R1 
    (DISTANCIA muy_cerca)(VELOCIDAD muy_negativa) => (assert (ACELERACION frenar_fuerte)))

(defrule R2
    (DISTANCIA muy_cerca)(VELOCIDAD negativa) => (assert (ACELERACION frenar_fuerte)))

(defrule R3
    (DISTANCIA muy_cerca)(VELOCIDAD nula) => (assert (ACELERACION frenar_fuerte)))

(defrule R4
    (DISTANCIA muy_cerca)(VELOCIDAD positiva) => (assert (ACELERACION ok)))

(defrule R5
    (DISTANCIA muy_cerca)(VELOCIDAD muy_positiva) => (assert (ACELERACION acelerar)))

(defrule R6
    (DISTANCIA cerca)(VELOCIDAD muy_negativa) => (assert (ACELERACION frenar_fuerte)))

(defrule R7
    (DISTANCIA cerca)(VELOCIDAD negativa) => (assert (ACELERACION frenar_fuerte)))

(defrule R8
    (DISTANCIA cerca)(VELOCIDAD nula) => (assert (ACELERACION ok)))

(defrule R9
    (DISTANCIA cerca)(VELOCIDAD positiva) => (assert (ACELERACION acelerar)))

(defrule R10
    (DISTANCIA cerca)(VELOCIDAD muy_positiva) => (assert (ACELERACION acelerar)))

(defrule R11
    (DISTANCIA adecuada)(VELOCIDAD muy_negativa) => (assert (ACELERACION frenar)))

(defrule R12
    (DISTANCIA adecuada)(VELOCIDAD negativa) => (assert (ACELERACION frenar)))

(defrule R13
    (DISTANCIA adecuada)(VELOCIDAD nula) => (assert (ACELERACION ok)))

(defrule R14
    (DISTANCIA adecuada)(VELOCIDAD positiva) => (assert (ACELERACION acelerar)))

(defrule R15
    (DISTANCIA adecuada)(VELOCIDAD muy_positiva) => (assert (ACELERACION acelerar_fuerte)))

(defrule R16
    (DISTANCIA lejos)(VELOCIDAD muy_negativa) => (assert (ACELERACION frenar)))

(defrule R17
    (DISTANCIA lejos)(VELOCIDAD negativa) => (assert (ACELERACION frenar)))

(defrule R18
    (DISTANCIA lejos)(VELOCIDAD nula) => (assert (ACELERACION acelerar)))

(defrule R19
    (DISTANCIA lejos)(VELOCIDAD positiva) => (assert (ACELERACION acelerar)))

(defrule R20
    (DISTANCIA lejos)(VELOCIDAD muy_positiva) => (assert (ACELERACION acelerar_fuerte)))

(defrule R21
    (DISTANCIA muy_lejos)(VELOCIDAD muy_negativa) => (assert (ACELERACION ok)))

(defrule R22
    (DISTANCIA muy_lejos)(VELOCIDAD negativa) => (assert (ACELERACION ok)))

(defrule R23
    (DISTANCIA muy_lejos)(VELOCIDAD nula) => (assert (ACELERACION acelerar)))

(defrule R24
    (DISTANCIA muy_lejos)(VELOCIDAD positiva) => (assert (ACELERACION acelerar)))

(defrule R25
    (DISTANCIA muy_lejos)(VELOCIDAD muy_positiva) => (assert (ACELERACION acelerar_fuerte)))