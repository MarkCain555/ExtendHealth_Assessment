-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteReservation] 
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @campsite VARCHAR(5)
	DECLARE @campsite_id int
	SELECT @campsite_id = campsite_id FROM reservations WHERE Id = @Id
	SET @campsite = (SELECT name FROM campsites WHERE Id = @campsite_id)

	-- Update the Calendar table with the reserved dates
	IF (@campsite = 'A1')
	BEGIN
		UPDATE dbo.Calendar
			SET A1_res_id = NULL
			WHERE [Date] >= (select min(date_in) from reservations where Id = @id)
			AND [Date] <= (select max(date_out) from reservations where Id = @id)
	END
	ELSE IF (@campsite = 'A2')
	BEGIN
		UPDATE dbo.Calendar
			SET A2_res_id = NULL
			WHERE [Date] >= (select min(date_in) from reservations where Id = @id)
			AND [Date] <= (select max(date_out) from reservations where Id = @id)
	END
	ELSE IF (@campsite = 'A3')
	BEGIN
		UPDATE dbo.Calendar
			SET A3_res_id = NULL
			WHERE [Date] >= (select min(date_in) from reservations where Id = @id)
			AND [Date] <= (select max(date_out) from reservations where Id = @id)
	END
	ELSE IF (@campsite = 'A4')
	BEGIN
		UPDATE dbo.Calendar
			SET A4_res_id = NULL
			WHERE [Date] >= (select min(date_in) from reservations where Id = @id)
			AND [Date] <= (select max(date_out) from reservations where Id = @id)
	END
	ELSE IF (@campsite = 'A5')
	BEGIN
		UPDATE dbo.Calendar
			SET A5_res_id = NULL
			WHERE [Date] >= (select min(date_in) from reservations where Id = @id)
			AND [Date] <= (select max(date_out) from reservations where Id = @id)
	END
	ELSE IF (@campsite = 'B1')
	BEGIN
		UPDATE dbo.Calendar
			SET B1_res_id = NULL
			WHERE [Date] >= (select min(date_in) from reservations where Id = @id)
			AND [Date] <= (select max(date_out) from reservations where Id = @id)
	END
	ELSE IF (@campsite = 'B2')
	BEGIN
		UPDATE dbo.Calendar
			SET B2_res_id = NULL
			WHERE [Date] >= (select min(date_in) from reservations where Id = @id)
			AND [Date] <= (select max(date_out) from reservations where Id = @id)
	END
	ELSE IF (@campsite = 'B3')
	BEGIN
		UPDATE dbo.Calendar
			SET B3_res_id = NULL
			WHERE [Date] >= (select min(date_in) from reservations where Id = @id)
			AND [Date] <= (select max(date_out) from reservations where Id = @id)
	END
	ELSE IF (@campsite = 'B4')
	BEGIN
		UPDATE dbo.Calendar
			SET B4_res_id = NULL
			WHERE [Date] >= (select min(date_in) from reservations where Id = @id)
			AND [Date] <= (select max(date_out) from reservations where Id = @id)
	END
	ELSE IF (@campsite = 'B5')
	BEGIN
		UPDATE dbo.Calendar
			SET B5_res_id = NULL
			WHERE [Date] >= (select min(date_in) from reservations where Id = @id)
			AND [Date] <= (select max(date_out) from reservations where Id = @id)
	END
	ELSE IF (@campsite = 'C1')
	BEGIN
		UPDATE dbo.Calendar
			SET C1_res_id = NULL
			WHERE [Date] >= (select min(date_in) from reservations where Id = @id)
			AND [Date] <= (select max(date_out) from reservations where Id = @id)
	END
	ELSE IF (@campsite = 'C2')
	BEGIN
		UPDATE dbo.Calendar
			SET C2_res_id = NULL
			WHERE [Date] >= (select min(date_in) from reservations where Id = @id)
			AND [Date] <= (select max(date_out) from reservations where Id = @id)
	END
	ELSE IF (@campsite = 'C3')
	BEGIN
		UPDATE dbo.Calendar
			SET C3_res_id = NULL
			WHERE [Date] >= (select min(date_in) from reservations where Id = @id)
			AND [Date] <= (select max(date_out) from reservations where Id = @id)
	END
	ELSE IF (@campsite = 'C4')
	BEGIN
		UPDATE dbo.Calendar
			SET C4_res_id = NULL
			WHERE [Date] >= (select min(date_in) from reservations where Id = @id)
			AND [Date] <= (select max(date_out) from reservations where Id = @id)
	END
	ELSE IF (@campsite = 'C5')
	BEGIN
		UPDATE dbo.Calendar
			SET C5_res_id = NULL
			WHERE [Date] >= (select min(date_in) from reservations where Id = @id)
			AND [Date] <= (select max(date_out) from reservations where Id = @id)
	END

	-- delete statements for procedure here
	DELETE FROM reservations WHERE Id = @Id

END
