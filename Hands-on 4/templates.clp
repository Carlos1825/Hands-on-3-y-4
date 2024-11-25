(deftemplate smartphone
  (slot marca)
  (slot modelo)
  (slot color)
  (slot precio)
  (slot stock)
)

(deftemplate computer
  (slot marca)
  (slot modelo)
  (slot color)
  (slot precio)
)

(deftemplate accesorio
  (slot tipo)
  (slot precio)
)

(deftemplate cliente
   (slot id)
   (multislot nombre)
   (slot tipo) ; menudista o mayorista
   (slot telefono)
   (slot frecuente)
   (slot compras)
)

(deftemplate orden
  (slot numero)
  (slot cliente-id)
)

(deftemplate linea-compra
   (slot orden-numero)
   (slot producto-tipo)
   (slot marca)
   (slot modelo)
   (slot cantidad)
   (slot tipo)
   (slot precio))


(deftemplate tarjetacred
  (slot banco)
  (slot grupo)
  (slot exp-date)
)

(deftemplate vale
  (slot cliente-id)
  (slot monto)
)
