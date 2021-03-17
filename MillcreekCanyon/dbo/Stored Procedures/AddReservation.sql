-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddReservation] 
	-- Add the parameters for the stored procedure here
	@date_in DATETIME2,
	@date_out	DATETIME2,
	@made_by VARCHAR(100),
	@reserved_by VARCHAR(100),
	@campsite_id INT,
	@number_of_guests INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO reservations (date_in, date_out, made_by, reserved_by, campsite_id, number_of_guests)
		VALUES(@date_in, @date_out, @made_by, @reserved_by, @campsite_id, @number_of_guests)

END
