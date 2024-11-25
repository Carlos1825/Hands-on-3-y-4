;; Regla para ofrecer 24 meses sin intereses con tarjeta Banamex Oro 
(defrule oferta-iphone16-banamex
  (linea-compra (producto-tipo smartphone) (marca apple) (modelo iPhone16) (cantidad ?qty))
  (tarjetacred (banco banamex) (grupo oro))
  =>
  (printout t "¡Ofrecemos 24 meses sin intereses con tarjeta Banamex Oro para la compra de iPhone 16!" crlf))

;; Regla para ofrecer 12 meses sin intereses con tarjeta Liverpool VISA
(defrule oferta-samsung-note21-liverpool
  (linea-compra (producto-tipo smartphone) (marca samsung) (modelo Note21) (cantidad ?qty))
  (tarjetacred (banco liverpool) (grupo visa))
  =>
  (printout t "¡Ofrecemos 12 meses sin intereses con tarjeta Liverpool VISA para la compra de Samsung Note21!" crlf))

;; Regla para ofrecer descuento en accesorios cuando se compra un Smartphone
(defrule descuento-accesorios
  (linea-compra (producto-tipo smartphone) (marca ?marca) (modelo ?modelo) (cantidad ?qty))
  (accesorio (tipo ?tipo) (precio ?precio))
  =>
  (bind ?descuento (* ?precio 0.15))
  (printout t "¡Compra un smartphone " ?marca " " ?modelo " y recibe un descuento del 15% en accesorios! " ?tipo " con precio original " ?precio ", nuevo precio con descuento: " (- ?precio ?descuento) crlf))

;; Regla para ofrecer vales al contado en ciertas compras
(defrule vales-al-contado
  (linea-compra (producto-tipo smartphone) (marca apple) (modelo iPhone16) (cantidad ?qty1))
  (linea-compra (producto-tipo computer) (marca apple) (modelo MacBookAir) (cantidad ?qty2))
  =>
  (printout t "Ofrece 100 pesos en vales por cada 1000 pesos de compra." crlf))

(defrule clasificar-cliente
  (linea-compra (orden-numero ?orden) (producto-tipo ?tipo) (cantidad ?qty))
  =>
  (if (< ?qty 10)
      then (printout t "Cliente clasificado como Menudista para la orden " ?orden "." crlf)
      else (printout t "Cliente clasificado como Mayorista para la orden " ?orden "." crlf)))

;; Regla para actualizar stock después de realizar una compra
(defrule actualizar-stock
  (linea-compra (producto-tipo smartphone) (marca ?marca) (modelo ?modelo) (cantidad ?qty))
  (smartphone (marca ?marca) (modelo ?modelo) (precio ?precio))
  =>
  (printout t "Actualizando stock para el producto " ?modelo " (" ?marca "). Cantidad comprada: " ?qty ", stock actualizado." crlf))

;; Regla para verificar stock disponible antes de realizar una compra
(defrule verificar-stock
  (linea-compra (producto-tipo smartphone) (marca ?marca) (modelo ?modelo) (cantidad ?qty))
  (smartphone (marca ?marca) (modelo ?modelo) (precio ?precio) (stock ?stock))
  (test (>= ?stock ?qty))  ;; Verifica si hay suficiente stock
  =>
  (printout t "Stock disponible suficiente para la compra de " ?modelo " (" ?marca "). Cantidad solicitada: " ?qty ", Stock disponible: " ?stock crlf))

;; Regla para notificar cuando no hay suficiente stock
(defrule no-hay-stock
  (linea-compra (producto-tipo smartphone) (marca ?marca) (modelo ?modelo) (cantidad ?qty))
  (smartphone (marca ?marca) (modelo ?modelo) (precio ?precio) (stock ?stock))
  (test (< ?stock ?qty))  ;; Verifica si no hay suficiente stock
  =>
  (printout t "Lo sentimos, no hay suficiente stock para " ?modelo " (" ?marca "). Cantidad solicitada: " ?qty ", Stock disponible: " ?stock crlf))

;; Regla 7: Descuento del 10% en accesorios si el cliente compra más de 3 accesorios.
(defrule descuento-por-cantidad-accesorios
   (linea-compra (producto-tipo accesorio) (cantidad ?cantidad&:(> ?cantidad 3)) (precio ?precio))
=>
   (bind ?descuento (* ?precio 0.10))  ; Descuento del 10%
   (printout t "Descuento del 10% en accesorios por comprar más de 3 unidades." crlf)
   (bind ?nuevo-precio (- ?precio ?descuento))
   (printout t "Nuevo precio con descuento: $" ?nuevo-precio crlf)
)

;; Regla 8: Paquete promocional con Samsung Galaxy S23.
(defrule paquete-promocional-samsung
   (linea-compra (producto-tipo smartphone) (marca samsung) (modelo GalaxyS23) (cantidad ?qty))
   =>
   (printout t "Promoción: Paquete especial con accesorios incluidos para Samsung Galaxy S23." crlf))

;; Regla 9: Envío gratuito en compras mayores a $50,000.
(defrule envio-gratuito
   (linea-compra (producto-tipo ?tipo) (marca ?marca) (modelo ?modelo) (precio ?precio) (cantidad ?qty))
   (test (and (numberp ?precio) (numberp ?qty)))  ;; Asegura que precio y cantidad son numéricos
   (test (> (* ?precio ?qty) 50000))  ;; Verifica si la compra es mayor a $50,000
   =>
   (printout t "Envío gratuito por compra mayor a $50,000." crlf))

;; Regla 10: 5% de descuento en computadoras con Bancomer Platinum.
(defrule descuento-bancomer-platinum
   (linea-compra (producto-tipo computer) (marca ?marca) (modelo ?modelo) (precio ?precio) (cantidad ?qty))
   (tarjetacred (banco bancomer) (grupo platinum))
   =>
   (bind ?descuento (* ?precio ?qty 0.05))
   (printout t "Descuento del 5% con Bancomer Platinum. Ahorro: $" ?descuento crlf))

;; Regla 11: Descuento del 20% en accesorios para clientes frecuentes.
(defrule descuento-clientes-frecuentes
   (cliente (id ?id) (frecuente ?frecuente))
   (test (eq ?frecuente true))
   =>
   (printout t "Descuento para cliente frecuente con ID: " ?id crlf))

;; Regla 12: Clasificar cliente como VIP si tiene más de 10 compras.
(defrule clasificar-cliente-vip
   (cliente (id ?id) (compras ?n))
   (test (> ?n 10))
   =>
   (printout t "El cliente con ID " ?id " es clasificado como Cliente VIP." crlf))

;; Regla 13: Clasificar cliente por tipo de dispositivo comprado.
(defrule clasificar-por-tipo
   (linea-compra (producto-tipo ?tipo))
   =>
   (if (eq ?tipo smartphone)
       then (printout t "Cliente clasificado como Smartphone User." crlf)
       else (printout t "Cliente clasificado como Computer User." crlf)))

;; Regla 14: Clasificar cliente como "Diversificado" por comprar más de 5 productos diferentes.
(defrule clasificar-diversificado
   ?fact <- (linea-compra (orden-numero ?orden) (producto-tipo ?tipo))
   (test (eq ?tipo smartphone)) ; Verifica si el tipo de producto es un smartphone
   =>
   (printout t "Cliente con orden número " ?orden " compró un smartphone." crlf))

;; Regla 15: Advertir bajo stock si queda menos de 3 unidades.
(defrule advertencia-bajo-stock
   (smartphone (marca ?marca) (modelo ?modelo) (stock ?stock))
   (test (< ?stock 3))
   =>
   (printout t "Advertencia: Bajo stock para " ?modelo " (" ?marca "). Stock actual: " ?stock crlf))

;; Regla 16: Rechazar compra si no hay suficiente stock.
(defrule rechazar-orden-sin-stock
   (linea-compra (producto-tipo smartphone) (marca ?marca) (modelo ?modelo) (cantidad ?qty))
   (smartphone (marca ?marca) (modelo ?modelo) (stock ?stock))
   (test (< ?stock ?qty))
   =>
   (printout t "No hay suficiente stock para completar la orden de " ?modelo " (" ?marca ")." crlf))

;; Regla 17: Recomendación de accesorios al comprar computadora.
(defrule recomendar-accesorios-computadora
   (linea-compra (producto-tipo computer) (marca ?marca) (modelo ?modelo))
   =>
   (printout t "Recomendación: Agrega un ratón y teclado como complementos para " ?modelo " (" ?marca ")." crlf))

;; Regla 18: Limpieza gratuita por compra de accesorio de lujo.
(defrule limpieza-gratuita
   (linea-compra (producto-tipo accesorio) (precio ?precio))
   (test (> ?precio 1000))  ;; Asegúrate de que se trata como número
   =>
   (printout t "Promoción: Limpieza gratuita por accesorio de lujo. Precio del accesorio: $" ?precio crlf))

;; Regla 19: Extensión de garantía para dispositivos Apple.
(defrule extension-garantia-apple
   (linea-compra (producto-tipo ?tipo) (marca apple) (modelo ?modelo))
   =>
   (printout t "Extensión de garantía incluida para el dispositivo Apple: " ?modelo crlf))

;; Regla 20: Descuento del 15% para Samsung en fechas específicas.
(defrule descuento-samsung
   (linea-compra (producto-tipo ?tipo) (marca samsung) (modelo ?modelo) (precio ?precio))
   (fecha-promocion si) ;; Hecho indicando que es una fecha promocional.
   =>
   (bind ?descuento (* ?precio 0.15))
   (printout t "Descuento del 15% aplicado a " ?modelo " (Samsung). Ahorro: $" ?descuento crlf))