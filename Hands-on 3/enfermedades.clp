(deftemplate enfermedad
   (slot nombre)
   (slot tipo)
   (slot signos_y_sintomas)
)

(deffacts enfermedades
   (enfermedad (nombre "Gripe") (tipo "Viral") (signos_y_sintomas "Fiebre, tos, dolor de cabeza"))
   (enfermedad (nombre "COVID-19") (tipo "Viral") (signos_y_sintomas "Fiebre, tos seca, fatiga"))
   (enfermedad (nombre "Tétanos") (tipo "Bacteriana") (signos_y_sintomas "Rigidez muscular, espasmos"))
   (enfermedad (nombre "Fiebre tifoidea") (tipo "Bacteriana") (signos_y_sintomas "Fiebre, debilidad, dolor abdominal"))
   (enfermedad (nombre "Sarampión") (tipo "Viral") (signos_y_sintomas "Fiebre, erupción cutánea, tos"))
   (enfermedad (nombre "Rubeola") (tipo "Viral") (signos_y_sintomas "Fiebre, erupción, inflamación de ganglios"))
   (enfermedad (nombre "Salmonelosis") (tipo "Bacteriana") (signos_y_sintomas "Diarrea, fiebre, calambres abdominales"))
   (enfermedad (nombre "Neumonía") (tipo "Bacteriana") (signos_y_sintomas "Fiebre, tos, dificultad para respirar"))
   (enfermedad (nombre "Hepatitis B") (tipo "Viral") (signos_y_sintomas "Fiebre, fatiga, dolor abdominal"))
   (enfermedad (nombre "Fiebre amarilla") (tipo "Viral") (signos_y_sintomas "Fiebre, escalofríos, dolor muscular"))
)

; Mostrar todas las enfermedades
(defrule mostrar-enfermedades
   ?e <- (enfermedad (nombre ?nombre) (tipo ?tipo) (signos_y_sintomas ?sintomas))
   =>
   (printout t "Enfermedad: " ?nombre ", Tipo: " ?tipo ", Signos y Síntomas: " ?sintomas crlf)
)

(defrule agregar-enfermedad
   =>
   (assert (enfermedad (nombre "Neumonía") (tipo "Bacteriana") (signos_y_sintomas "Fiebre, tos, dificultad para respirar")))
   (printout t "Enfermedad agregada: Neumonía" crlf)
)

(defrule actualizar-enfermedad
   ?e <- (enfermedad (nombre "COVID-19"))
   =>
   (retract ?e)
   (assert (enfermedad (nombre "COVID-19") (tipo "Viral") (signos_y_sintomas "Fiebre, tos seca, fatiga, dificultad para respirar")))
   (printout t "Enfermedad actualizada: COVID-19" crlf)
)

(defrule borrar-enfermedad
   ?e <- (enfermedad (nombre "Gripe"))
   =>
   (retract ?e)
   (printout t "Enfermedad eliminada: Gripe" crlf)
)
