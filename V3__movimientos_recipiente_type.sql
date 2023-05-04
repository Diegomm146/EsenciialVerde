CREATE TYPE movimientos_recipiente_type 
   AS TABLE -- se tiene que crear los TYPE's de las tablas que se quieran pasar como parametros
      ( idresponsable INT NOT NULL,
       cantidad INT NOT NULL,
       fecha DATE NOT NULL,
       idtipo_movimiento INT NOT NULL,
       idpunto_recoleccion INT NOT NULL,
       idproductor INT NULL,
       idrecolector INT NULL,
       idcamion INT NULL,
       idadress INT NULL,
       idcontrato INT NOT NULL );
GO
use EsencialVerde
CREATE TYPE movimientos_recipiente_recipiente_type 
   AS TABLE -- se tiene que crear los TYPE's de las tablas que se quieran pasar como parametros
      (idrecipiente INT NOT NULL );
GO
