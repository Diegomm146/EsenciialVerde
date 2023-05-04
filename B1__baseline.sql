SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
PRINT N'Creating [dbo].[contrato]'
GO
CREATE TABLE [dbo].[contrato]
(
[idcontrato] [int] NOT NULL IDENTITY(1, 1),
[fechainicio] [date] NOT NULL,
[fechafinal] [date] NOT NULL,
[enabled] [bit] NOT NULL,
[frecuenciarecoleccion] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_contrato] on [dbo].[contrato]'
GO
ALTER TABLE [dbo].[contrato] ADD CONSTRAINT [PK_contrato] PRIMARY KEY CLUSTERED ([idcontrato])
GO
PRINT N'Creating [dbo].[actores_contrato]'
GO
CREATE TABLE [dbo].[actores_contrato]
(
[idactores_contrato] [int] NOT NULL IDENTITY(1, 1),
[idcontrato] [int] NOT NULL,
[idproductor] [int] NOT NULL,
[idrecolector] [int] NOT NULL,
[iduser] [int] NOT NULL,
[porcentaje] [decimal] (8, 3) NOT NULL
)
GO
PRINT N'Creating primary key [PK_actores_contrato] on [dbo].[actores_contrato]'
GO
ALTER TABLE [dbo].[actores_contrato] ADD CONSTRAINT [PK_actores_contrato] PRIMARY KEY CLUSTERED ([idactores_contrato])
GO
PRINT N'Creating [dbo].[productor]'
GO
CREATE TABLE [dbo].[productor]
(
[idproductor] [int] NOT NULL IDENTITY(1, 1),
[nombre] [varchar] (50) NOT NULL,
[numerodecarbo] [nchar] (10) NOT NULL
)
GO
PRINT N'Creating primary key [PK_productor_1] on [dbo].[productor]'
GO
ALTER TABLE [dbo].[productor] ADD CONSTRAINT [PK_productor_1] PRIMARY KEY CLUSTERED ([idproductor])
GO
PRINT N'Creating [dbo].[recolector]'
GO
CREATE TABLE [dbo].[recolector]
(
[idrecolector] [int] NOT NULL IDENTITY(1, 1),
[nombre] [varchar] (50) NOT NULL,
[idadress] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_recolector] on [dbo].[recolector]'
GO
ALTER TABLE [dbo].[recolector] ADD CONSTRAINT [PK_recolector] PRIMARY KEY CLUSTERED ([idrecolector])
GO
PRINT N'Creating [dbo].[user]'
GO
CREATE TABLE [dbo].[user]
(
[iduser] [int] NOT NULL IDENTITY(1, 1),
[nombre] [varchar] (50) NOT NULL,
[apellido1] [varchar] (50) NOT NULL,
[apellido2] [varchar] (50) NOT NULL,
[email] [varchar] (50) NOT NULL,
[password] [varchar] (50) NOT NULL,
[enabled] [bit] NOT NULL,
[checksum] [varbinary] (150) NOT NULL
)
GO
PRINT N'Creating primary key [PK_user] on [dbo].[user]'
GO
ALTER TABLE [dbo].[user] ADD CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED ([iduser])
GO
PRINT N'Creating [dbo].[ciudad]'
GO
CREATE TABLE [dbo].[ciudad]
(
[idciudad] [int] NOT NULL IDENTITY(1, 1),
[nombre] [varchar] (50) NOT NULL,
[estadoid] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_ciudad] on [dbo].[ciudad]'
GO
ALTER TABLE [dbo].[ciudad] ADD CONSTRAINT [PK_ciudad] PRIMARY KEY CLUSTERED ([idciudad])
GO
PRINT N'Creating [dbo].[adress]'
GO
CREATE TABLE [dbo].[adress]
(
[idadress] [int] NOT NULL IDENTITY(1, 1),
[zipcode] [int] NOT NULL,
[ubicacion] [sys].[geography] NOT NULL,
[calle] [varchar] (50) NOT NULL,
[indicaciones] [varchar] (50) NOT NULL,
[idciudad] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_adress] on [dbo].[adress]'
GO
ALTER TABLE [dbo].[adress] ADD CONSTRAINT [PK_adress] PRIMARY KEY CLUSTERED ([idadress])
GO
PRINT N'Creating [dbo].[areas_region]'
GO
CREATE TABLE [dbo].[areas_region]
(
[idareas_region] [int] NOT NULL IDENTITY(1, 1),
[idregion] [int] NOT NULL,
[idciudad] [int] NULL,
[idestado] [int] NULL,
[idpais] [int] NULL
)
GO
PRINT N'Creating primary key [PK_areas_region] on [dbo].[areas_region]'
GO
ALTER TABLE [dbo].[areas_region] ADD CONSTRAINT [PK_areas_region] PRIMARY KEY CLUSTERED ([idareas_region])
GO
PRINT N'Creating [dbo].[estado]'
GO
CREATE TABLE [dbo].[estado]
(
[idestado] [int] NOT NULL IDENTITY(1, 1),
[nombre] [varchar] (50) NOT NULL,
[idpais] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_estado] on [dbo].[estado]'
GO
ALTER TABLE [dbo].[estado] ADD CONSTRAINT [PK_estado] PRIMARY KEY CLUSTERED ([idestado])
GO
PRINT N'Creating [dbo].[pais]'
GO
CREATE TABLE [dbo].[pais]
(
[idpais] [int] NOT NULL IDENTITY(1, 1),
[ididioma] [int] NOT NULL,
[nombre] [varchar] (50) NOT NULL
)
GO
PRINT N'Creating primary key [PK_pais] on [dbo].[pais]'
GO
ALTER TABLE [dbo].[pais] ADD CONSTRAINT [PK_pais] PRIMARY KEY CLUSTERED ([idpais])
GO
PRINT N'Creating [dbo].[region]'
GO
CREATE TABLE [dbo].[region]
(
[idregion] [int] NOT NULL IDENTITY(1, 1),
[nombre] [varchar] (50) NOT NULL
)
GO
PRINT N'Creating primary key [PK_region] on [dbo].[region]'
GO
ALTER TABLE [dbo].[region] ADD CONSTRAINT [PK_region] PRIMARY KEY CLUSTERED ([idregion])
GO
PRINT N'Creating [dbo].[moneda]'
GO
CREATE TABLE [dbo].[moneda]
(
[idmoneda] [int] NOT NULL IDENTITY(1, 1),
[moneda] [varchar] (20) NOT NULL,
[symbol] [varchar] (50) NOT NULL,
[default] [bit] NOT NULL,
[acronimo] [varchar] (50) NOT NULL
)
GO
PRINT N'Creating primary key [PK_moneda] on [dbo].[moneda]'
GO
ALTER TABLE [dbo].[moneda] ADD CONSTRAINT [PK_moneda] PRIMARY KEY CLUSTERED ([idmoneda])
GO
PRINT N'Creating [dbo].[cambio_moneda]'
GO
CREATE TABLE [dbo].[cambio_moneda]
(
[idcambio_moneda] [int] NOT NULL IDENTITY(1, 1),
[fechaini] [date] NOT NULL,
[fechafin] [date] NOT NULL,
[default] [bit] NOT NULL,
[tipocambio] [decimal] (9, 6) NOT NULL,
[idmoneda] [int] NOT NULL,
[activo] [nchar] (10) NOT NULL
)
GO
PRINT N'Creating primary key [PK_cambio_moneda] on [dbo].[cambio_moneda]'
GO
ALTER TABLE [dbo].[cambio_moneda] ADD CONSTRAINT [PK_cambio_moneda] PRIMARY KEY CLUSTERED ([idcambio_moneda])
GO
PRINT N'Creating [dbo].[cliente]'
GO
CREATE TABLE [dbo].[cliente]
(
[idcliente] [int] NOT NULL IDENTITY(1, 1),
[nombre] [varchar] (50) NOT NULL,
[telefono] [int] NOT NULL,
[email] [varchar] (50) NOT NULL,
[idaddress] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_cliente] on [dbo].[cliente]'
GO
ALTER TABLE [dbo].[cliente] ADD CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED ([idcliente])
GO
PRINT N'Creating [dbo].[cobros]'
GO
CREATE TABLE [dbo].[cobros]
(
[idcobros] [int] NOT NULL IDENTITY(1, 1),
[idproductor] [int] NOT NULL,
[fechacobro] [date] NOT NULL,
[monto] [decimal] (8, 3) NOT NULL,
[fechavencimiento] [date] NOT NULL,
[idmoneda] [int] NOT NULL,
[idcontrato] [int] NOT NULL,
[descuento] [decimal] (8, 3) NOT NULL
)
GO
PRINT N'Creating primary key [PK_cobros] on [dbo].[cobros]'
GO
ALTER TABLE [dbo].[cobros] ADD CONSTRAINT [PK_cobros] PRIMARY KEY CLUSTERED ([idcobros])
GO
PRINT N'Creating [dbo].[contacttypes]'
GO
CREATE TABLE [dbo].[contacttypes]
(
[idcontacttype] [int] NOT NULL IDENTITY(1, 1),
[nombre] [varchar] (50) NOT NULL,
[tipoactor] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_contacttypes] on [dbo].[contacttypes]'
GO
ALTER TABLE [dbo].[contacttypes] ADD CONSTRAINT [PK_contacttypes] PRIMARY KEY CLUSTERED ([idcontacttype])
GO
PRINT N'Creating [dbo].[contactvalue]'
GO
CREATE TABLE [dbo].[contactvalue]
(
[idcontactvalue] [int] NOT NULL IDENTITY(1, 1),
[value] [varchar] (50) NOT NULL,
[posttime] [date] NOT NULL,
[enabled] [bit] NOT NULL,
[actorid] [int] NOT NULL,
[idcontacttype] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_contactvalue] on [dbo].[contactvalue]'
GO
ALTER TABLE [dbo].[contactvalue] ADD CONSTRAINT [PK_contactvalue] PRIMARY KEY CLUSTERED ([idcontactvalue])
GO
PRINT N'Creating [dbo].[puntorecoleccion]'
GO
CREATE TABLE [dbo].[puntorecoleccion]
(
[idpuntorecoleccion] [int] NOT NULL IDENTITY(1, 1),
[nombre] [varchar] (50) NOT NULL,
[idadress] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_puntorecoleccion] on [dbo].[puntorecoleccion]'
GO
ALTER TABLE [dbo].[puntorecoleccion] ADD CONSTRAINT [PK_puntorecoleccion] PRIMARY KEY CLUSTERED ([idpuntorecoleccion])
GO
PRINT N'Creating [dbo].[idioma]'
GO
CREATE TABLE [dbo].[idioma]
(
[ididioma] [int] NOT NULL,
[idioma] [varchar] (20) NOT NULL
)
GO
PRINT N'Creating primary key [PK_idioma] on [dbo].[idioma]'
GO
ALTER TABLE [dbo].[idioma] ADD CONSTRAINT [PK_idioma] PRIMARY KEY CLUSTERED ([ididioma])
GO
PRINT N'Creating [dbo].[cultura]'
GO
CREATE TABLE [dbo].[cultura]
(
[idcultura] [int] NOT NULL,
[nombre] [varchar] (50) NOT NULL,
[ididioma] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_cultura] on [dbo].[cultura]'
GO
ALTER TABLE [dbo].[cultura] ADD CONSTRAINT [PK_cultura] PRIMARY KEY CLUSTERED ([idcultura])
GO
PRINT N'Creating [dbo].[tipodesecho]'
GO
CREATE TABLE [dbo].[tipodesecho]
(
[idtipodesecho] [int] NOT NULL IDENTITY(1, 1),
[nombre] [varchar] (50) NOT NULL,
[reciclable] [bit] NOT NULL
)
GO
PRINT N'Creating primary key [PK_tipodesecho] on [dbo].[tipodesecho]'
GO
ALTER TABLE [dbo].[tipodesecho] ADD CONSTRAINT [PK_tipodesecho] PRIMARY KEY CLUSTERED ([idtipodesecho])
GO
PRINT N'Creating [dbo].[desechos]'
GO
CREATE TABLE [dbo].[desechos]
(
[iddesecho] [int] NOT NULL IDENTITY(1, 1),
[nombre] [varchar] (50) NOT NULL,
[idtipodesecho] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_residuo] on [dbo].[desechos]'
GO
ALTER TABLE [dbo].[desechos] ADD CONSTRAINT [PK_residuo] PRIMARY KEY CLUSTERED ([iddesecho])
GO
PRINT N'Creating [dbo].[evttype]'
GO
CREATE TABLE [dbo].[evttype]
(
[idevttype] [int] NOT NULL IDENTITY(1, 1),
[name] [varchar] (50) NOT NULL
)
GO
PRINT N'Creating primary key [PK_evttype] on [dbo].[evttype]'
GO
ALTER TABLE [dbo].[evttype] ADD CONSTRAINT [PK_evttype] PRIMARY KEY CLUSTERED ([idevttype])
GO
PRINT N'Creating [dbo].[eventlogs]'
GO
CREATE TABLE [dbo].[eventlogs]
(
[eventlogid] [int] NOT NULL IDENTITY(1, 1),
[posttime] [date] NOT NULL,
[computer] [nchar] (10) NOT NULL,
[checksum] [varbinary] (50) NOT NULL,
[description] [varchar] (50) NOT NULL,
[idreference1] [bigint] NOT NULL,
[idreference2] [bigint] NOT NULL,
[value1] [varchar] (80) NOT NULL,
[value2] [varchar] (80) NOT NULL,
[idlevels] [int] NOT NULL,
[idevttype] [int] NOT NULL,
[idobjtype] [int] NOT NULL,
[idsources] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_eventlogs] on [dbo].[eventlogs]'
GO
ALTER TABLE [dbo].[eventlogs] ADD CONSTRAINT [PK_eventlogs] PRIMARY KEY CLUSTERED ([eventlogid])
GO
PRINT N'Creating [dbo].[levels]'
GO
CREATE TABLE [dbo].[levels]
(
[idlevels] [int] NOT NULL IDENTITY(1, 1),
[name] [varchar] (50) NOT NULL
)
GO
PRINT N'Creating primary key [PK_levels] on [dbo].[levels]'
GO
ALTER TABLE [dbo].[levels] ADD CONSTRAINT [PK_levels] PRIMARY KEY CLUSTERED ([idlevels])
GO
PRINT N'Creating [dbo].[objtype]'
GO
CREATE TABLE [dbo].[objtype]
(
[idobjtype] [int] NOT NULL IDENTITY(1, 1),
[name] [varchar] (50) NOT NULL
)
GO
PRINT N'Creating primary key [PK_objtype] on [dbo].[objtype]'
GO
ALTER TABLE [dbo].[objtype] ADD CONSTRAINT [PK_objtype] PRIMARY KEY CLUSTERED ([idobjtype])
GO
PRINT N'Creating [dbo].[sources]'
GO
CREATE TABLE [dbo].[sources]
(
[idsource] [int] NOT NULL IDENTITY(1, 1),
[name] [varchar] (50) NOT NULL
)
GO
PRINT N'Creating primary key [PK_sources] on [dbo].[sources]'
GO
ALTER TABLE [dbo].[sources] ADD CONSTRAINT [PK_sources] PRIMARY KEY CLUSTERED ([idsource])
GO
PRINT N'Creating [dbo].[local]'
GO
CREATE TABLE [dbo].[local]
(
[idlocal] [int] NOT NULL,
[iddireccion] [int] NOT NULL,
[idproductor] [int] NOT NULL,
[nombre] [varchar] (50) NOT NULL,
[balance] [decimal] (8, 3) NOT NULL
)
GO
PRINT N'Creating primary key [PK_local] on [dbo].[local]'
GO
ALTER TABLE [dbo].[local] ADD CONSTRAINT [PK_local] PRIMARY KEY CLUSTERED ([idlocal])
GO
PRINT N'Creating [dbo].[material_producto]'
GO
CREATE TABLE [dbo].[material_producto]
(
[idmaterial_producto] [int] NOT NULL,
[idmaterial] [int] NOT NULL,
[idproducto] [int] NOT NULL,
[idcontrato] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_material_producto] on [dbo].[material_producto]'
GO
ALTER TABLE [dbo].[material_producto] ADD CONSTRAINT [PK_material_producto] PRIMARY KEY CLUSTERED ([idmaterial_producto])
GO
PRINT N'Creating [dbo].[materiales]'
GO
CREATE TABLE [dbo].[materiales]
(
[idmaterial] [int] NOT NULL IDENTITY(1, 1),
[nombre] [varchar] (50) NOT NULL,
[idtipodesecho] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_materiales_1] on [dbo].[materiales]'
GO
ALTER TABLE [dbo].[materiales] ADD CONSTRAINT [PK_materiales_1] PRIMARY KEY CLUSTERED ([idmaterial])
GO
PRINT N'Creating [dbo].[producto]'
GO
CREATE TABLE [dbo].[producto]
(
[idproducto] [int] NOT NULL IDENTITY(1, 1),
[nombre] [varchar] (50) NULL,
[idprecioproducto] [int] NOT NULL,
[costo] [decimal] (8, 3) NOT NULL
)
GO
PRINT N'Creating primary key [PK_producto] on [dbo].[producto]'
GO
ALTER TABLE [dbo].[producto] ADD CONSTRAINT [PK_producto] PRIMARY KEY CLUSTERED ([idproducto])
GO
PRINT N'Creating [dbo].[movimientos_recipiente]'
GO
CREATE TABLE [dbo].[movimientos_recipiente]
(
[idmovimientos_recipiente] [int] NOT NULL IDENTITY(1, 1),
[idresponsable] [int] NULL,
[cantidad] [int] NOT NULL,
[fecha] [date] NOT NULL,
[idtipo_movimiento] [int] NOT NULL,
[idpunto_recoleccion] [int] NULL,
[idproductor] [int] NULL,
[idrecolector] [int] NULL,
[idcamion] [int] NULL,
[idadress] [int] NULL,
[idcontrato] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_movimientos_recipiente] on [dbo].[movimientos_recipiente]'
GO
ALTER TABLE [dbo].[movimientos_recipiente] ADD CONSTRAINT [PK_movimientos_recipiente] PRIMARY KEY CLUSTERED ([idmovimientos_recipiente])
GO
PRINT N'Creating [dbo].[camion]'
GO
CREATE TABLE [dbo].[camion]
(
[idcamion] [int] NOT NULL IDENTITY(1, 1),
[marca] [varchar] (50) NOT NULL,
[modelo] [varchar] (50) NOT NULL,
[placa] [varchar] (50) NOT NULL,
[capacidad] [decimal] (8, 3) NOT NULL,
[enabled] [bit] NOT NULL
)
GO
PRINT N'Creating primary key [PK_camion] on [dbo].[camion]'
GO
ALTER TABLE [dbo].[camion] ADD CONSTRAINT [PK_camion] PRIMARY KEY CLUSTERED ([idcamion])
GO
PRINT N'Creating [dbo].[movimientos_recipiente_recipiente]'
GO
CREATE TABLE [dbo].[movimientos_recipiente_recipiente]
(
[idmovimientos_recipiente_recipiente] [int] NOT NULL IDENTITY(1, 1),
[idmovimientos_recipiente] [int] NOT NULL,
[idrecipiente] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_movimientos_recipiente_recipiente] on [dbo].[movimientos_recipiente_recipiente]'
GO
ALTER TABLE [dbo].[movimientos_recipiente_recipiente] ADD CONSTRAINT [PK_movimientos_recipiente_recipiente] PRIMARY KEY CLUSTERED ([idmovimientos_recipiente_recipiente])
GO
PRINT N'Creating [dbo].[recipiente]'
GO
CREATE TABLE [dbo].[recipiente]
(
[idrecipiente] [int] NOT NULL IDENTITY(1, 1),
[tamanno] [varchar] (50) NOT NULL,
[peso] [decimal] (8, 2) NOT NULL,
[utilizable] [bit] NOT NULL,
[brand] [varchar] (50) NOT NULL,
[model] [varchar] (50) NOT NULL
)
GO
PRINT N'Creating primary key [PK_recipiente] on [dbo].[recipiente]'
GO
ALTER TABLE [dbo].[recipiente] ADD CONSTRAINT [PK_recipiente] PRIMARY KEY CLUSTERED ([idrecipiente])
GO
PRINT N'Creating [dbo].[tipo_movimiento]'
GO
CREATE TABLE [dbo].[tipo_movimiento]
(
[idtipo_movimiento] [int] NOT NULL,
[movimiento] [varchar] (100) NOT NULL
)
GO
PRINT N'Creating primary key [PK_tipo_movimiento] on [dbo].[tipo_movimiento]'
GO
ALTER TABLE [dbo].[tipo_movimiento] ADD CONSTRAINT [PK_tipo_movimiento] PRIMARY KEY CLUSTERED ([idtipo_movimiento])
GO
PRINT N'Creating [dbo].[pagos]'
GO
CREATE TABLE [dbo].[pagos]
(
[idpagos] [int] NOT NULL IDENTITY(1, 1),
[idcobros] [int] NOT NULL,
[fechapago] [date] NOT NULL,
[montopagado] [decimal] (8, 3) NOT NULL,
[idmoneda] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_pagos] on [dbo].[pagos]'
GO
ALTER TABLE [dbo].[pagos] ADD CONSTRAINT [PK_pagos] PRIMARY KEY CLUSTERED ([idpagos])
GO
PRINT N'Creating [dbo].[patrocinios]'
GO
CREATE TABLE [dbo].[patrocinios]
(
[idpatrocinio] [int] NOT NULL,
[idcontrato] [int] NOT NULL,
[idproductor] [int] NULL,
[idtipodesecho] [int] NULL,
[idciudad] [int] NULL,
[idestado] [int] NULL,
[idpais] [int] NULL,
[porcenatje] [decimal] (8, 3) NOT NULL
)
GO
PRINT N'Creating primary key [PK_patrocinios] on [dbo].[patrocinios]'
GO
ALTER TABLE [dbo].[patrocinios] ADD CONSTRAINT [PK_patrocinios] PRIMARY KEY CLUSTERED ([idpatrocinio])
GO
PRINT N'Creating [dbo].[precioproceso_pais]'
GO
CREATE TABLE [dbo].[precioproceso_pais]
(
[idprecioproceso_pais] [int] NOT NULL IDENTITY(1, 1),
[idpais] [int] NOT NULL,
[idestado] [int] NOT NULL,
[idprecio] [int] NOT NULL,
[enabled] [bit] NOT NULL,
[idproceso] [int] NOT NULL,
[computer] [nchar] (30) NOT NULL,
[username] [nchar] (30) NOT NULL,
[checksum] [nchar] (150) NOT NULL,
[fecha] [date] NOT NULL
)
GO
PRINT N'Creating primary key [PK_precioproceso_pais] on [dbo].[precioproceso_pais]'
GO
ALTER TABLE [dbo].[precioproceso_pais] ADD CONSTRAINT [PK_precioproceso_pais] PRIMARY KEY CLUSTERED ([idprecioproceso_pais])
GO
PRINT N'Creating [dbo].[precioproceso]'
GO
CREATE TABLE [dbo].[precioproceso]
(
[idprecioproceso] [int] NOT NULL IDENTITY(1, 1),
[postime] [date] NOT NULL,
[precio] [decimal] (8, 3) NOT NULL,
[enabled] [bit] NOT NULL
)
GO
PRINT N'Creating primary key [PK_precioproceso] on [dbo].[precioproceso]'
GO
ALTER TABLE [dbo].[precioproceso] ADD CONSTRAINT [PK_precioproceso] PRIMARY KEY CLUSTERED ([idprecioproceso])
GO
PRINT N'Creating [dbo].[procesos]'
GO
CREATE TABLE [dbo].[procesos]
(
[idprocesos] [int] NOT NULL IDENTITY(1, 1),
[nombre] [varchar] (50) NOT NULL,
[descripcion] [varchar] (50) NOT NULL,
[status] [nchar] (20) NOT NULL
)
GO
PRINT N'Creating primary key [PK_procesos] on [dbo].[procesos]'
GO
ALTER TABLE [dbo].[procesos] ADD CONSTRAINT [PK_procesos] PRIMARY KEY CLUSTERED ([idprocesos])
GO
PRINT N'Creating [dbo].[procesos_pais]'
GO
CREATE TABLE [dbo].[procesos_pais]
(
[idproceso_pais] [int] NOT NULL IDENTITY(1, 1),
[idpais] [int] NOT NULL,
[idestado] [int] NOT NULL,
[precio] [decimal] (8, 3) NOT NULL,
[enabled] [bit] NOT NULL,
[idproceso] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_procesos_pais] on [dbo].[procesos_pais]'
GO
ALTER TABLE [dbo].[procesos_pais] ADD CONSTRAINT [PK_procesos_pais] PRIMARY KEY CLUSTERED ([idproceso_pais])
GO
PRINT N'Creating [dbo].[precioproducto]'
GO
CREATE TABLE [dbo].[precioproducto]
(
[idprecioproducto] [int] NOT NULL,
[postime] [date] NOT NULL,
[precio] [decimal] (8, 3) NOT NULL,
[enabled] [bit] NOT NULL
)
GO
PRINT N'Creating primary key [PK_precioproducto] on [dbo].[precioproducto]'
GO
ALTER TABLE [dbo].[precioproducto] ADD CONSTRAINT [PK_precioproducto] PRIMARY KEY CLUSTERED ([idprecioproducto])
GO
PRINT N'Creating [dbo].[productor_tipodesecho]'
GO
CREATE TABLE [dbo].[productor_tipodesecho]
(
[idproductor_tipodesecho] [int] NOT NULL IDENTITY(1, 1),
[idproductor] [int] NOT NULL,
[idtipodesecho] [int] NULL
)
GO
PRINT N'Creating primary key [PK_productor_tipodesecho] on [dbo].[productor_tipodesecho]'
GO
ALTER TABLE [dbo].[productor_tipodesecho] ADD CONSTRAINT [PK_productor_tipodesecho] PRIMARY KEY CLUSTERED ([idproductor_tipodesecho])
GO
PRINT N'Creating [dbo].[productos_venta]'
GO
CREATE TABLE [dbo].[productos_venta]
(
[idproductos_venta] [int] NOT NULL IDENTITY(1, 1),
[idproducto] [int] NOT NULL,
[idventas] [int] NOT NULL,
[cantidad] [int] NOT NULL,
[precio] [decimal] (8, 3) NOT NULL
)
GO
PRINT N'Creating primary key [PK_productos_venta] on [dbo].[productos_venta]'
GO
ALTER TABLE [dbo].[productos_venta] ADD CONSTRAINT [PK_productos_venta] PRIMARY KEY CLUSTERED ([idproductos_venta])
GO
PRINT N'Creating [dbo].[Ventas]'
GO
CREATE TABLE [dbo].[Ventas]
(
[idventas] [int] NOT NULL IDENTITY(1, 1),
[monto] [decimal] (8, 3) NOT NULL,
[vuelto] [decimal] (8, 3) NOT NULL,
[fechaventa] [date] NOT NULL,
[tipopago] [int] NOT NULL,
[idcliente] [int] NOT NULL,
[iduser] [int] NOT NULL,
[computer] [nchar] (30) NOT NULL,
[checksum] [varbinary] (150) NOT NULL
)
GO
PRINT N'Creating primary key [PK_Ventas] on [dbo].[Ventas]'
GO
ALTER TABLE [dbo].[Ventas] ADD CONSTRAINT [PK_Ventas] PRIMARY KEY CLUSTERED ([idventas])
GO
PRINT N'Creating [dbo].[recipiente_tipodesecho]'
GO
CREATE TABLE [dbo].[recipiente_tipodesecho]
(
[idrecpiente_tipodesecho] [int] NOT NULL IDENTITY(1, 1),
[idrecipiente] [int] NOT NULL,
[idtipodesecho] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_recipiente_tipodesecho] on [dbo].[recipiente_tipodesecho]'
GO
ALTER TABLE [dbo].[recipiente_tipodesecho] ADD CONSTRAINT [PK_recipiente_tipodesecho] PRIMARY KEY CLUSTERED ([idrecpiente_tipodesecho])
GO
PRINT N'Creating [dbo].[recipientes_recoleccion]'
GO
CREATE TABLE [dbo].[recipientes_recoleccion]
(
[idrecipientes_recoleccion] [int] NOT NULL IDENTITY(1, 1),
[idrecolecciondesechos] [int] NOT NULL,
[idrecipiente] [int] NOT NULL,
[pesoporrepiente] [decimal] (8, 3) NULL
)
GO
PRINT N'Creating primary key [PK_recipientes_recoleccion] on [dbo].[recipientes_recoleccion]'
GO
ALTER TABLE [dbo].[recipientes_recoleccion] ADD CONSTRAINT [PK_recipientes_recoleccion] PRIMARY KEY CLUSTERED ([idrecipientes_recoleccion])
GO
PRINT N'Creating [dbo].[termino_contrato]'
GO
CREATE TABLE [dbo].[termino_contrato]
(
[idtermino_contrato] [int] NOT NULL,
[idtermino] [int] NOT NULL,
[idcontrato] [int] NOT NULL,
[value] [nchar] (10) NOT NULL
)
GO
PRINT N'Creating primary key [PK_termino_contrato] on [dbo].[termino_contrato]'
GO
ALTER TABLE [dbo].[termino_contrato] ADD CONSTRAINT [PK_termino_contrato] PRIMARY KEY CLUSTERED ([idtermino_contrato])
GO
PRINT N'Creating [dbo].[terminos]'
GO
CREATE TABLE [dbo].[terminos]
(
[idtermino] [int] NOT NULL IDENTITY(1, 1),
[nombre] [varchar] (50) NOT NULL,
[descipcion] [varchar] (50) NOT NULL
)
GO
PRINT N'Creating primary key [PK_terminos] on [dbo].[terminos]'
GO
ALTER TABLE [dbo].[terminos] ADD CONSTRAINT [PK_terminos] PRIMARY KEY CLUSTERED ([idtermino])
GO
PRINT N'Creating [dbo].[tipodesecho_contrato]'
GO
CREATE TABLE [dbo].[tipodesecho_contrato]
(
[idtipodesecho_contrato] [int] NOT NULL IDENTITY(1, 1),
[idtipodesecho] [int] NOT NULL,
[idcontrato] [int] NOT NULL,
[cantidadrecipientes] [int] NOT NULL,
[pesototal] [decimal] (8, 3) NOT NULL
)
GO
PRINT N'Creating primary key [PK_tipodesecho_contrato] on [dbo].[tipodesecho_contrato]'
GO
ALTER TABLE [dbo].[tipodesecho_contrato] ADD CONSTRAINT [PK_tipodesecho_contrato] PRIMARY KEY CLUSTERED ([idtipodesecho_contrato])
GO
PRINT N'Creating [dbo].[tipodesecho_procesos]'
GO
CREATE TABLE [dbo].[tipodesecho_procesos]
(
[idtipodesecho_procesos] [int] NOT NULL IDENTITY(1, 1),
[idproceso] [int] NOT NULL,
[idtipodesecho] [int] NOT NULL,
[enabled] [bit] NOT NULL
)
GO
PRINT N'Creating primary key [PK_tipodesecho_procesos] on [dbo].[tipodesecho_procesos]'
GO
ALTER TABLE [dbo].[tipodesecho_procesos] ADD CONSTRAINT [PK_tipodesecho_procesos] PRIMARY KEY CLUSTERED ([idtipodesecho_procesos])
GO
PRINT N'Creating [dbo].[traduccion]'
GO
CREATE TABLE [dbo].[traduccion]
(
[idtraduccion] [int] NOT NULL IDENTITY(1, 1),
[label] [varchar] (50) NOT NULL,
[idreference] [bigint] NOT NULL,
[idobjtype] [int] NOT NULL,
[postime] [date] NOT NULL,
[ididioma] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_traduccion] on [dbo].[traduccion]'
GO
ALTER TABLE [dbo].[traduccion] ADD CONSTRAINT [PK_traduccion] PRIMARY KEY CLUSTERED ([idtraduccion])
GO
PRINT N'Creating [dbo].[ProductosVenta]'
GO
CREATE VIEW [dbo].[ProductosVenta] WITH schemabinding AS 
SELECT productos_venta.idventas, producto.nombre AS producto, productos_venta.cantidad, cliente.nombre AS cliente, [user].nombre AS usuario
FROM dbo.Ventas INNER JOIN
     dbo.[user] ON Ventas.iduser = [user].iduser INNER JOIN
     dbo.cliente ON Ventas.idcliente = cliente.idcliente INNER JOIN
     dbo.productos_venta ON Ventas.idventas = productos_venta.idventas INNER JOIN
     dbo.producto ON productos_venta.idproducto = producto.idproducto
WHERE Ventas.idventas > 68
GO
PRINT N'Creating index [idx_ProductosVenta] on [dbo].[ProductosVenta]'
GO
CREATE UNIQUE CLUSTERED INDEX [idx_ProductosVenta] ON [dbo].[ProductosVenta] ([idventas])
GO
PRINT N'Creating [dbo].[productor_cicloderecoleccion]'
GO
CREATE TABLE [dbo].[productor_cicloderecoleccion]
(
[idproductor] [int] NULL,
[idciclorecoleecion] [int] NULL,
[idproductor_ciclorecoleccion] [int] NULL
)
GO
PRINT N'Adding foreign keys to [dbo].[productos_venta]'
GO
ALTER TABLE [dbo].[productos_venta] ADD CONSTRAINT [FK_productos_venta_Ventas] FOREIGN KEY ([idventas]) REFERENCES [dbo].[Ventas] ([idventas])
GO
ALTER TABLE [dbo].[productos_venta] ADD CONSTRAINT [FK_productos_venta_producto] FOREIGN KEY ([idproducto]) REFERENCES [dbo].[producto] ([idproducto])
GO
PRINT N'Adding foreign keys to [dbo].[Ventas]'
GO
ALTER TABLE [dbo].[Ventas] ADD CONSTRAINT [FK_Ventas_cliente] FOREIGN KEY ([idcliente]) REFERENCES [dbo].[cliente] ([idcliente])
GO
ALTER TABLE [dbo].[Ventas] ADD CONSTRAINT [FK_Ventas_user] FOREIGN KEY ([iduser]) REFERENCES [dbo].[user] ([iduser])
GO
PRINT N'Adding foreign keys to [dbo].[actores_contrato]'
GO
ALTER TABLE [dbo].[actores_contrato] ADD CONSTRAINT [FK_actores_contrato_contrato] FOREIGN KEY ([idcontrato]) REFERENCES [dbo].[contrato] ([idcontrato])
GO
ALTER TABLE [dbo].[actores_contrato] ADD CONSTRAINT [FK_actores_contrato_productor] FOREIGN KEY ([idproductor]) REFERENCES [dbo].[productor] ([idproductor])
GO
ALTER TABLE [dbo].[actores_contrato] ADD CONSTRAINT [FK_actores_contrato_recolector] FOREIGN KEY ([idrecolector]) REFERENCES [dbo].[recolector] ([idrecolector])
GO
ALTER TABLE [dbo].[actores_contrato] ADD CONSTRAINT [FK_actores_contrato_user] FOREIGN KEY ([iduser]) REFERENCES [dbo].[user] ([iduser])
GO
PRINT N'Adding foreign keys to [dbo].[cliente]'
GO
ALTER TABLE [dbo].[cliente] ADD CONSTRAINT [FK_cliente_adress] FOREIGN KEY ([idaddress]) REFERENCES [dbo].[adress] ([idadress])
GO
PRINT N'Adding foreign keys to [dbo].[local]'
GO
ALTER TABLE [dbo].[local] ADD CONSTRAINT [FK_local_adress] FOREIGN KEY ([iddireccion]) REFERENCES [dbo].[adress] ([idadress])
GO
ALTER TABLE [dbo].[local] ADD CONSTRAINT [FK_local_productor] FOREIGN KEY ([idproductor]) REFERENCES [dbo].[productor] ([idproductor])
GO
PRINT N'Adding foreign keys to [dbo].[movimientos_recipiente]'
GO
ALTER TABLE [dbo].[movimientos_recipiente] ADD CONSTRAINT [FK_movimientos_recipiente_adress] FOREIGN KEY ([idadress]) REFERENCES [dbo].[adress] ([idadress])
GO
ALTER TABLE [dbo].[movimientos_recipiente] ADD CONSTRAINT [FK_movimientos_recipiente_camion] FOREIGN KEY ([idcamion]) REFERENCES [dbo].[camion] ([idcamion])
GO
ALTER TABLE [dbo].[movimientos_recipiente] ADD CONSTRAINT [FK_movimientos_recipiente_contrato] FOREIGN KEY ([idcontrato]) REFERENCES [dbo].[contrato] ([idcontrato])
GO
ALTER TABLE [dbo].[movimientos_recipiente] ADD CONSTRAINT [FK_movimientos_recipiente_user1] FOREIGN KEY ([idresponsable]) REFERENCES [dbo].[user] ([iduser])
GO
ALTER TABLE [dbo].[movimientos_recipiente] ADD CONSTRAINT [FK_movimientos_recipiente_tipo_movimiento] FOREIGN KEY ([idtipo_movimiento]) REFERENCES [dbo].[tipo_movimiento] ([idtipo_movimiento])
GO
ALTER TABLE [dbo].[movimientos_recipiente] ADD CONSTRAINT [FK_movimientos_recipiente_puntorecoleccion] FOREIGN KEY ([idpunto_recoleccion]) REFERENCES [dbo].[puntorecoleccion] ([idpuntorecoleccion])
GO
ALTER TABLE [dbo].[movimientos_recipiente] ADD CONSTRAINT [FK_movimientos_recipiente_productor] FOREIGN KEY ([idproductor]) REFERENCES [dbo].[productor] ([idproductor])
GO
ALTER TABLE [dbo].[movimientos_recipiente] ADD CONSTRAINT [FK_movimientos_recipiente_recolector] FOREIGN KEY ([idrecolector]) REFERENCES [dbo].[recolector] ([idrecolector])
GO
PRINT N'Adding foreign keys to [dbo].[puntorecoleccion]'
GO
ALTER TABLE [dbo].[puntorecoleccion] ADD CONSTRAINT [FK_puntorecoleccion_adress] FOREIGN KEY ([idadress]) REFERENCES [dbo].[adress] ([idadress])
GO
PRINT N'Adding foreign keys to [dbo].[recolector]'
GO
ALTER TABLE [dbo].[recolector] ADD CONSTRAINT [FK_recolector_adress] FOREIGN KEY ([idadress]) REFERENCES [dbo].[adress] ([idadress])
GO
PRINT N'Adding foreign keys to [dbo].[adress]'
GO
ALTER TABLE [dbo].[adress] ADD CONSTRAINT [FK_adress_ciudad] FOREIGN KEY ([idciudad]) REFERENCES [dbo].[ciudad] ([idciudad])
GO
PRINT N'Adding foreign keys to [dbo].[areas_region]'
GO
ALTER TABLE [dbo].[areas_region] ADD CONSTRAINT [FK_areas_region_region] FOREIGN KEY ([idregion]) REFERENCES [dbo].[region] ([idregion])
GO
ALTER TABLE [dbo].[areas_region] ADD CONSTRAINT [FK_areas_region_ciudad] FOREIGN KEY ([idciudad]) REFERENCES [dbo].[ciudad] ([idciudad])
GO
ALTER TABLE [dbo].[areas_region] ADD CONSTRAINT [FK_areas_region_estado] FOREIGN KEY ([idestado]) REFERENCES [dbo].[estado] ([idestado])
GO
ALTER TABLE [dbo].[areas_region] ADD CONSTRAINT [FK_areas_region_pais] FOREIGN KEY ([idpais]) REFERENCES [dbo].[pais] ([idpais])
GO
PRINT N'Adding foreign keys to [dbo].[cambio_moneda]'
GO
ALTER TABLE [dbo].[cambio_moneda] ADD CONSTRAINT [FK_cambio_moneda_moneda] FOREIGN KEY ([idmoneda]) REFERENCES [dbo].[moneda] ([idmoneda])
GO
PRINT N'Adding foreign keys to [dbo].[patrocinios]'
GO
ALTER TABLE [dbo].[patrocinios] ADD CONSTRAINT [FK_patrocinios_ciudad] FOREIGN KEY ([idciudad]) REFERENCES [dbo].[ciudad] ([idciudad])
GO
ALTER TABLE [dbo].[patrocinios] ADD CONSTRAINT [FK_patrocinios_contrato] FOREIGN KEY ([idcontrato]) REFERENCES [dbo].[contrato] ([idcontrato])
GO
ALTER TABLE [dbo].[patrocinios] ADD CONSTRAINT [FK_patrocinios_estado] FOREIGN KEY ([idestado]) REFERENCES [dbo].[estado] ([idestado])
GO
ALTER TABLE [dbo].[patrocinios] ADD CONSTRAINT [FK_patrocinios_pais] FOREIGN KEY ([idpais]) REFERENCES [dbo].[pais] ([idpais])
GO
ALTER TABLE [dbo].[patrocinios] ADD CONSTRAINT [FK_patrocinios_productor] FOREIGN KEY ([idproductor]) REFERENCES [dbo].[productor] ([idproductor])
GO
ALTER TABLE [dbo].[patrocinios] ADD CONSTRAINT [FK_patrocinios_tipodesecho] FOREIGN KEY ([idtipodesecho]) REFERENCES [dbo].[tipodesecho] ([idtipodesecho])
GO
PRINT N'Adding foreign keys to [dbo].[ciudad]'
GO
ALTER TABLE [dbo].[ciudad] ADD CONSTRAINT [FK_ciudad_estado] FOREIGN KEY ([estadoid]) REFERENCES [dbo].[estado] ([idestado])
GO
PRINT N'Adding foreign keys to [dbo].[pagos]'
GO
ALTER TABLE [dbo].[pagos] ADD CONSTRAINT [FK_pagos_cobros] FOREIGN KEY ([idcobros]) REFERENCES [dbo].[cobros] ([idcobros])
GO
ALTER TABLE [dbo].[pagos] ADD CONSTRAINT [FK_pagos_moneda] FOREIGN KEY ([idmoneda]) REFERENCES [dbo].[moneda] ([idmoneda])
GO
PRINT N'Adding foreign keys to [dbo].[cobros]'
GO
ALTER TABLE [dbo].[cobros] ADD CONSTRAINT [FK_cobros_productor] FOREIGN KEY ([idproductor]) REFERENCES [dbo].[productor] ([idproductor])
GO
ALTER TABLE [dbo].[cobros] ADD CONSTRAINT [FK_cobros_moneda] FOREIGN KEY ([idmoneda]) REFERENCES [dbo].[moneda] ([idmoneda])
GO
ALTER TABLE [dbo].[cobros] ADD CONSTRAINT [FK_cobros_contrato] FOREIGN KEY ([idcontrato]) REFERENCES [dbo].[contrato] ([idcontrato])
GO
PRINT N'Adding foreign keys to [dbo].[contactvalue]'
GO
ALTER TABLE [dbo].[contactvalue] ADD CONSTRAINT [FK_contactvalue_contacttypes] FOREIGN KEY ([idcontacttype]) REFERENCES [dbo].[contacttypes] ([idcontacttype])
GO
ALTER TABLE [dbo].[contactvalue] ADD CONSTRAINT [FK_contactvalue_productor] FOREIGN KEY ([actorid]) REFERENCES [dbo].[productor] ([idproductor])
GO
ALTER TABLE [dbo].[contactvalue] ADD CONSTRAINT [FK_contactvalue_puntorecoleccion] FOREIGN KEY ([actorid]) REFERENCES [dbo].[puntorecoleccion] ([idpuntorecoleccion])
GO
ALTER TABLE [dbo].[contactvalue] ADD CONSTRAINT [FK_contactvalue_recolector] FOREIGN KEY ([actorid]) REFERENCES [dbo].[recolector] ([idrecolector])
GO
PRINT N'Adding foreign keys to [dbo].[material_producto]'
GO
ALTER TABLE [dbo].[material_producto] ADD CONSTRAINT [FK_material_producto_contrato] FOREIGN KEY ([idcontrato]) REFERENCES [dbo].[contrato] ([idcontrato])
GO
ALTER TABLE [dbo].[material_producto] ADD CONSTRAINT [FK_material_producto_materiales] FOREIGN KEY ([idmaterial]) REFERENCES [dbo].[materiales] ([idmaterial])
GO
ALTER TABLE [dbo].[material_producto] ADD CONSTRAINT [FK_material_producto_producto] FOREIGN KEY ([idproducto]) REFERENCES [dbo].[producto] ([idproducto])
GO
PRINT N'Adding foreign keys to [dbo].[termino_contrato]'
GO
ALTER TABLE [dbo].[termino_contrato] ADD CONSTRAINT [FK_termino_contrato_contrato] FOREIGN KEY ([idcontrato]) REFERENCES [dbo].[contrato] ([idcontrato])
GO
ALTER TABLE [dbo].[termino_contrato] ADD CONSTRAINT [FK_termino_contrato_terminos] FOREIGN KEY ([idtermino]) REFERENCES [dbo].[terminos] ([idtermino])
GO
PRINT N'Adding foreign keys to [dbo].[tipodesecho_contrato]'
GO
ALTER TABLE [dbo].[tipodesecho_contrato] ADD CONSTRAINT [FK_tipodesecho_contrato_contrato] FOREIGN KEY ([idcontrato]) REFERENCES [dbo].[contrato] ([idcontrato])
GO
ALTER TABLE [dbo].[tipodesecho_contrato] ADD CONSTRAINT [FK_tipodesecho_contrato_tipodesecho] FOREIGN KEY ([idtipodesecho]) REFERENCES [dbo].[tipodesecho] ([idtipodesecho])
GO
PRINT N'Adding foreign keys to [dbo].[cultura]'
GO
ALTER TABLE [dbo].[cultura] ADD CONSTRAINT [FK_cultura_idioma] FOREIGN KEY ([ididioma]) REFERENCES [dbo].[idioma] ([ididioma])
GO
PRINT N'Adding foreign keys to [dbo].[desechos]'
GO
ALTER TABLE [dbo].[desechos] ADD CONSTRAINT [FK_desechos_tipodesecho] FOREIGN KEY ([idtipodesecho]) REFERENCES [dbo].[tipodesecho] ([idtipodesecho])
GO
PRINT N'Adding foreign keys to [dbo].[estado]'
GO
ALTER TABLE [dbo].[estado] ADD CONSTRAINT [FK_estado_pais] FOREIGN KEY ([idpais]) REFERENCES [dbo].[pais] ([idpais])
GO
PRINT N'Adding foreign keys to [dbo].[eventlogs]'
GO
ALTER TABLE [dbo].[eventlogs] ADD CONSTRAINT [FK_eventlogs_levels] FOREIGN KEY ([idlevels]) REFERENCES [dbo].[levels] ([idlevels])
GO
ALTER TABLE [dbo].[eventlogs] ADD CONSTRAINT [FK_eventlogs_evttype] FOREIGN KEY ([idevttype]) REFERENCES [dbo].[evttype] ([idevttype])
GO
ALTER TABLE [dbo].[eventlogs] ADD CONSTRAINT [FK_eventlogs_objtype] FOREIGN KEY ([idobjtype]) REFERENCES [dbo].[objtype] ([idobjtype])
GO
ALTER TABLE [dbo].[eventlogs] ADD CONSTRAINT [FK_eventlogs_sources] FOREIGN KEY ([idsources]) REFERENCES [dbo].[sources] ([idsource])
GO
PRINT N'Adding foreign keys to [dbo].[pais]'
GO
ALTER TABLE [dbo].[pais] ADD CONSTRAINT [FK_pais_idioma] FOREIGN KEY ([ididioma]) REFERENCES [dbo].[idioma] ([ididioma])
GO
PRINT N'Adding foreign keys to [dbo].[traduccion]'
GO
ALTER TABLE [dbo].[traduccion] ADD CONSTRAINT [FK_traduccion_idioma] FOREIGN KEY ([ididioma]) REFERENCES [dbo].[idioma] ([ididioma])
GO
ALTER TABLE [dbo].[traduccion] ADD CONSTRAINT [FK_traduccion_objtype] FOREIGN KEY ([idobjtype]) REFERENCES [dbo].[objtype] ([idobjtype])
GO
PRINT N'Adding foreign keys to [dbo].[materiales]'
GO
ALTER TABLE [dbo].[materiales] ADD CONSTRAINT [FK_materiales_tipodesecho] FOREIGN KEY ([idtipodesecho]) REFERENCES [dbo].[tipodesecho] ([idtipodesecho])
GO
PRINT N'Adding foreign keys to [dbo].[movimientos_recipiente_recipiente]'
GO
ALTER TABLE [dbo].[movimientos_recipiente_recipiente] ADD CONSTRAINT [FK_movimientos_recipiente_recipiente_movimientos_recipiente] FOREIGN KEY ([idmovimientos_recipiente]) REFERENCES [dbo].[movimientos_recipiente] ([idmovimientos_recipiente])
GO
ALTER TABLE [dbo].[movimientos_recipiente_recipiente] ADD CONSTRAINT [FK_movimientos_recipiente_recipiente_recipiente] FOREIGN KEY ([idrecipiente]) REFERENCES [dbo].[recipiente] ([idrecipiente])
GO
PRINT N'Adding foreign keys to [dbo].[precioproceso_pais]'
GO
ALTER TABLE [dbo].[precioproceso_pais] ADD CONSTRAINT [FK_precioproceso_pais_pais] FOREIGN KEY ([idpais]) REFERENCES [dbo].[pais] ([idpais])
GO
ALTER TABLE [dbo].[precioproceso_pais] ADD CONSTRAINT [FK_precioproceso_pais_precioproceso] FOREIGN KEY ([idprecio]) REFERENCES [dbo].[precioproceso] ([idprecioproceso])
GO
ALTER TABLE [dbo].[precioproceso_pais] ADD CONSTRAINT [FK_precioproceso_pais_procesos] FOREIGN KEY ([idproceso]) REFERENCES [dbo].[procesos] ([idprocesos])
GO
PRINT N'Adding foreign keys to [dbo].[producto]'
GO
ALTER TABLE [dbo].[producto] ADD CONSTRAINT [FK_producto_precioproducto] FOREIGN KEY ([idprecioproducto]) REFERENCES [dbo].[precioproducto] ([idprecioproducto])
GO
PRINT N'Adding foreign keys to [dbo].[procesos_pais]'
GO
ALTER TABLE [dbo].[procesos_pais] ADD CONSTRAINT [FK_procesos_pais_procesos] FOREIGN KEY ([idproceso]) REFERENCES [dbo].[procesos] ([idprocesos])
GO
PRINT N'Adding foreign keys to [dbo].[tipodesecho_procesos]'
GO
ALTER TABLE [dbo].[tipodesecho_procesos] ADD CONSTRAINT [FK_tipodesecho_procesos_procesos] FOREIGN KEY ([idproceso]) REFERENCES [dbo].[procesos] ([idprocesos])
GO
ALTER TABLE [dbo].[tipodesecho_procesos] ADD CONSTRAINT [FK_tipodesecho_procesos_tipodesecho] FOREIGN KEY ([idtipodesecho]) REFERENCES [dbo].[tipodesecho] ([idtipodesecho])
GO
PRINT N'Adding foreign keys to [dbo].[productor_tipodesecho]'
GO
ALTER TABLE [dbo].[productor_tipodesecho] ADD CONSTRAINT [FK_productor_tipodesecho_productor] FOREIGN KEY ([idproductor]) REFERENCES [dbo].[productor] ([idproductor])
GO
ALTER TABLE [dbo].[productor_tipodesecho] ADD CONSTRAINT [FK_productor_tipodesecho_tipodesecho] FOREIGN KEY ([idtipodesecho]) REFERENCES [dbo].[tipodesecho] ([idtipodesecho])
GO
PRINT N'Adding foreign keys to [dbo].[recipiente_tipodesecho]'
GO
ALTER TABLE [dbo].[recipiente_tipodesecho] ADD CONSTRAINT [FK_recipiente_tipodesecho_recipiente] FOREIGN KEY ([idrecipiente]) REFERENCES [dbo].[recipiente] ([idrecipiente])
GO
ALTER TABLE [dbo].[recipiente_tipodesecho] ADD CONSTRAINT [FK_recipiente_tipodesecho_tipodesecho] FOREIGN KEY ([idtipodesecho]) REFERENCES [dbo].[tipodesecho] ([idtipodesecho])
GO
PRINT N'Adding foreign keys to [dbo].[recipientes_recoleccion]'
GO
ALTER TABLE [dbo].[recipientes_recoleccion] ADD CONSTRAINT [FK_recipientes_recoleccion_recipiente] FOREIGN KEY ([idrecipiente]) REFERENCES [dbo].[recipiente] ([idrecipiente])
GO
PRINT N'Creating extended properties'
GO
EXEC sp_addextendedproperty N'MS_Description', N'1 pago en efectivo. 2. pago por sinpe. 3. pago en tarjeta', 'SCHEMA', N'dbo', 'TABLE', N'Ventas', 'COLUMN', N'tipopago'
GO
EXEC sp_addextendedproperty N'MS_Description', N'0 no 1 si', 'SCHEMA', N'dbo', 'TABLE', N'cambio_moneda', 'COLUMN', N'activo'
GO
EXEC sp_addextendedproperty N'MS_Description', N'1. productor2.recolector3.plantas', 'SCHEMA', N'dbo', 'TABLE', N'contacttypes', 'COLUMN', N'tipoactor'
GO
EXEC sp_addextendedproperty N'MS_Description', N'cada cuantos dias que se recolecta', 'SCHEMA', N'dbo', 'TABLE', N'contrato', 'COLUMN', N'frecuenciarecoleccion'
GO
EXEC sp_addextendedproperty N'MS_Description', N'1-5. Siendo 1 malo y 5 excelente.', 'SCHEMA', N'dbo', 'TABLE', N'movimientos_recipiente', 'COLUMN', N'cantidad'
GO
EXEC sp_addextendedproperty N'MS_Description', N'', 'SCHEMA', N'dbo', 'TABLE', N'producto', 'COLUMN', N'idprecioproducto'
GO
EXEC sp_addextendedproperty N'MS_Description', N'1-100. 1 siendo no tanto impacto ambiental y 100 como impacto muy grande', 'SCHEMA', N'dbo', 'TABLE', N'productor', 'COLUMN', N'numerodecarbo'
GO
EXEC sp_addextendedproperty N'MS_Description', N'siempre en kilogramos', 'SCHEMA', N'dbo', 'TABLE', N'recipiente', 'COLUMN', N'peso'
GO
EXEC sp_addextendedproperty N'MS_Description', N'0. si 1.no', 'SCHEMA', N'dbo', 'TABLE', N'recipiente', 'COLUMN', N'utilizable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'0 no 1 si', 'SCHEMA', N'dbo', 'TABLE', N'tipodesecho', 'COLUMN', N'reciclable'
GO

