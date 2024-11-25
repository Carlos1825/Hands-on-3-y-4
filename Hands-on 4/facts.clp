(deffacts productos 
  (smartphone (marca apple) (modelo iPhone16) (color rojo) (precio 27000))
  (smartphone (marca samsung) (modelo Note21) (color negro) (precio 23000))
  (smartphone (marca xiaomi) (modelo Mi13) (color azul) (precio 18000))
  (computer (marca apple) (modelo macbookpro) (color gris) (precio 47000))
  (computer (marca apple) (modelo MacBookAir) (color gris) (precio 30000))
  (computer (marca dell) (modelo Inspiron) (color negro) (precio 15000))
  (accesorio (tipo funda) (precio 500))
  (accesorio (tipo mica) (precio 200))
  (accesorio (tipo cargador) (precio 800))
  (accesorio (tipo teclado) (precio 1000))
)

(deffacts clientes
  (cliente (id 101) (nombre "Joe") (tipo menudista) (telefono 3313073905))
  (cliente (id 102) (nombre "Mary") (tipo mayorista) (telefono 333222345))
  (cliente (id 103) (nombre "Ana") (tipo menudista) (telefono 3124567890))
  (cliente (id 104) (nombre "Carlos") (tipo mayorista) (telefono 3334445566))
)

(deffacts tarjetas
  (tarjetacred (banco banamex) (grupo oro) (exp-date 01-12-25))
  (tarjetacred (banco liverpool) (grupo visa) (exp-date 01-11-24))
  (tarjetacred (banco bbva) (grupo platinum) (exp-date 01-01-26))
  (tarjetacred (banco santander) (grupo mastercard) (exp-date 01-10-25))
)

(deffacts ordenes-de-compra
  (linea-compra (orden-numero 001) (producto-tipo smartphone) (marca apple) (modelo iPhone16) (cantidad 1) (tipo funda) (precio 27000))
  (linea-compra (orden-numero 002) (producto-tipo smartphone) (marca samsung) (modelo Note21) (cantidad 2) (tipo mica) (precio 23000))
  (linea-compra (orden-numero 003) (producto-tipo accesorio) (tipo funda) (cantidad 4) (precio 500))
  (linea-compra (orden-numero 004) (producto-tipo computer) (marca apple) (modelo macbookpro) (cantidad 1) (precio 47000))
  (linea-compra (orden-numero 005) (producto-tipo computer) (marca dell) (modelo Inspiron) (cantidad 1) (precio 30000))
)