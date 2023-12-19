create database Cesar 

use Cesar 

go


CREATE TABLE Encuesta
(
   ParticipanteID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    Edad INT CHECK (Edad BETWEEN 18 AND 50) NOT NULL,
    CorreoElectronico NVARCHAR(100) CHECK (CorreoElectronico LIKE '%@%' AND CorreoElectronico LIKE '%.%') NOT NULL,
    PartidoPolitico NVARCHAR(50) CHECK (PartidoPolitico IN ('PLN', 'PUSC', 'PAC')) NOT NULL
)

Go
CREATE TABLE Registro (
    EncuestaID INT PRIMARY KEY IDENTITY(1,1),
    ParticipanteID INT FOREIGN KEY REFERENCES Encuesta(ParticipanteID),
    CONSTRAINT FK_Encuestas_Participantes FOREIGN KEY (ParticipanteID) REFERENCES Encuesta(ParticipanteID)
)
GO
create PROCEDURE AgregarEncuesta
    @Nombre NVARCHAR(100),
    @Edad INT,
    @CorreoElectronico NVARCHAR(100),
    @PartidoPolitico NVARCHAR(50)
AS
BEGIN
    DECLARE @ParticipanteID INT;

    -- Agregar participante
    INSERT INTO Encuesta(Nombre, Edad, CorreoElectronico, PartidoPolitico)
    VALUES (@Nombre, @Edad, @CorreoElectronico, @PartidoPolitico);

    -- Obtener el ID del participante agregado
    SET @ParticipanteID = SCOPE_IDENTITY();

    -- Agregar encuesta asociada al participante
    INSERT INTO Encuesta(ParticipanteID)
    VALUES (@ParticipanteID);
END;
GO

-- Crear procedimiento almacenado para obtener un reporte de todas las encuestas
CREATE PROCEDURE ObtenerReporteEncuestas
AS
BEGIN
    SELECT
        R.EncuestaID,
        P.Nombre AS NombreParticipante,
        P.Edad,
        P.CorreoElectronico,
        P.PartidoPolitico
    FROM Registro R
    JOIN Encuesta P ON R.ParticipanteID = P.ParticipanteID;
END;
GO
