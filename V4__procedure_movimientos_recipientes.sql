CREATE PROCEDURE movimientos_recipientes
    @movimiento movimientos_recipiente_type READONLY,
    @recipientes_movimiento movimientos_recipiente_recipiente_type READONLY
AS 
BEGIN
	
	SET NOCOUNT ON -- no retorne metadatos
	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	DECLARE @InicieTransaccion BIT
    DECLARE @idMovimiento INT;
    SET @CustomError = 2001
	-- declaracion de otras variables

	-- operaciones de select que no tengan que ser bloqueadas
	-- tratar de hacer todo lo posible antes de q inice la transaccion

    IF NOT EXISTS (SELECT * FROM @recipientes_movimiento AS rm -- revisar si los recipientes dados son utilizables
    WHERE NOT EXISTS (SELECT * FROM EsencialVerde.dbo.recipiente AS r WHERE r.idrecipiente = rm.idrecipiente AND r.utilizable = 1 ))
    BEGIN
		RAISERROR('SE ESTA UTILIZANDO UN RECIPIENTE QUE NO ES UTILIZABLE',16, 1)
        RETURN;
    END
    IF NOT EXISTS (SELECT * FROM @movimiento AS m -- revisar si contrato que se esta utilizando esta activo
    WHERE NOT EXISTS (SELECT * FROM EsencialVerde.dbo.contrato AS c WHERE c.idcontrato = m.idcontrato AND c.enabled = 0 ))
    BEGIN
		RAISERROR('EL TIPO DE MOVIMIENTO NO EXISTE',16, 1)
        RETURN;
    END
	
	SET @InicieTransaccion = 0
	IF @@TRANCOUNT=0 BEGIN
		SET @InicieTransaccion = 1
		SET TRANSACTION ISOLATION LEVEL READ COMMITTED
		BEGIN TRANSACTION		
	END
	
	BEGIN TRY
		-- put your code here
        INSERT INTO EsencialVerde.dbo.movimientos_recipiente
        (idresponsable, 
            cantidad, 
            fecha, 
            idtipo_movimiento,
            idpunto_recoleccion,
            idproductor,
            idrecolector,
            idcamion,
            idadress,
            idcontrato)
        SELECT * FROM @movimiento;
        SET @idMovimiento = @@IDENTITY;
		
        INSERT INTO EsencialVerde.dbo.movimientos_recipiente_recipiente
        ( idmovimientos_recipiente,
            idrecipiente
        )
        SELECT @idMovimiento, idrecipiente FROM @recipientes_movimiento;

		IF @InicieTransaccion=1 BEGIN
			COMMIT
		END
	END TRY
	BEGIN CATCH
		SET @ErrorNumber = ERROR_NUMBER()
		SET @ErrorSeverity = ERROR_SEVERITY()
		SET @ErrorState = ERROR_STATE()
		SET @Message = ERROR_MESSAGE()
		IF @InicieTransaccion=1 BEGIN
			ROLLBACK
		END
		RAISERROR('%s - Error Number: %i', @ErrorSeverity, @ErrorState, @Message, @CustomError)
	END CATCH	
END
RETURN 0
GO