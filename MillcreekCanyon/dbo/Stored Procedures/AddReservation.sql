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
	DECLARE @id int
	DECLARE @campsite VARCHAR(5)
	SET @campsite = (SELECT name FROM campsites WHERE Id = @campsite_id)
	
    -- Insert statements for procedure here
	INSERT INTO reservations (date_in, date_out, made_by, reserved_by, campsite_id, number_of_guests)
		VALUES(@date_in, @date_out, @made_by, @reserved_by, @campsite_id, @number_of_guests)

	SELECT @id = SCOPE_IDENTITY()
	
	-- Update the Calendar table with the reserved dates
	IF (@campsite = 'A1')
	BEGIN
		UPDATE dbo.Calendar
			SET A1_res_id = @id
			WHERE [Date] >= (select min(date_in) from reservations where Id = @id)
			AND [Date] <= (select max(date_out) from reservations where Id = @id)
	END
	ELSE IF (@campsite = 'A2')
	BEGIN
		UPDATE dbo.Calendar
			SET A2_res_id = @id
			WHERE [Date] >= (select min(date_in) from reservations where Id = @id)
			AND [Date] <= (select max(date_out) from reservations where Id = @id)
	END
	ELSE IF (@campsite = 'A3')
	BEGIN
		UPDATE dbo.Calendar
			SET A3_res_id = @id
			WHERE [Date] >= (select min(date_in) from reservations where Id = @id)
			AND [Date] <= (select max(date_out) from reservations where Id = @id)
	END
	ELSE IF (@campsite = 'A4')
	BEGIN
		UPDATE dbo.Calendar
			SET A4_res_id = @id
			WHERE [Date] >= (select min(date_in) from reservations where Id = @id)
			AND [Date] <= (select max(date_out) from reservations where Id = @id)
	END
	ELSE IF (@campsite = 'A5')
	BEGIN
		UPDATE dbo.Calendar
			SET A5_res_id = @id
			WHERE [Date] >= (select min(date_in) from reservations where Id = @id)
			AND [Date] <= (select max(date_out) from reservations where Id = @id)
	END
	ELSE IF (@campsite = 'B1')
	BEGIN
		UPDATE dbo.Calendar
			SET B1_res_id = @id
			WHERE [Date] >= (select min(date_in) from reservations where Id = @id)
			AND [Date] <= (select max(date_out) from reservations where Id = @id)
	END
	ELSE IF (@campsite = 'B2')
	BEGIN
		UPDATE dbo.Calendar
			SET B2_res_id = @id
			WHERE [Date] >= (select min(date_in) from reservations where Id = @id)
			AND [Date] <= (select max(date_out) from reservations where Id = @id)
	END
	ELSE IF (@campsite = 'B3')
	BEGIN
		UPDATE dbo.Calendar
			SET B3_res_id = @id
			WHERE [Date] >= (select min(date_in) from reservations where Id = @id)
			AND [Date] <= (select max(date_out) from reservations where Id = @id)
	END
	ELSE IF (@campsite = 'B4')
	BEGIN
		UPDATE dbo.Calendar
			SET B4_res_id = @id
			WHERE [Date] >= (select min(date_in) from reservations where Id = @id)
			AND [Date] <= (select max(date_out) from reservations where Id = @id)
	END
	ELSE IF (@campsite = 'B5')
	BEGIN
		UPDATE dbo.Calendar
			SET B5_res_id = @id
			WHERE [Date] >= (select min(date_in) from reservations where Id = @id)
			AND [Date] <= (select max(date_out) from reservations where Id = @id)
	END
	ELSE IF (@campsite = 'C1')
	BEGIN
		UPDATE dbo.Calendar
			SET C1_res_id = @id
			WHERE [Date] >= (select min(date_in) from reservations where Id = @id)
			AND [Date] <= (select max(date_out) from reservations where Id = @id)
	END
	ELSE IF (@campsite = 'C2')
	BEGIN
		UPDATE dbo.Calendar
			SET C2_res_id = @id
			WHERE [Date] >= (select min(date_in) from reservations where Id = @id)
			AND [Date] <= (select max(date_out) from reservations where Id = @id)
	END
	ELSE IF (@campsite = 'C3')
	BEGIN
		UPDATE dbo.Calendar
			SET C3_res_id = @id
			WHERE [Date] >= (select min(date_in) from reservations where Id = @id)
			AND [Date] <= (select max(date_out) from reservations where Id = @id)
	END
	ELSE IF (@campsite = 'C4')
	BEGIN
		UPDATE dbo.Calendar
			SET C4_res_id = @id
			WHERE [Date] >= (select min(date_in) from reservations where Id = @id)
			AND [Date] <= (select max(date_out) from reservations where Id = @id)
	END
	ELSE IF (@campsite = 'C5')
	BEGIN
		UPDATE dbo.Calendar
			SET C5_res_id = @id
			WHERE [Date] >= (select min(date_in) from reservations where Id = @id)
			AND [Date] <= (select max(date_out) from reservations where Id = @id)
	END
END
