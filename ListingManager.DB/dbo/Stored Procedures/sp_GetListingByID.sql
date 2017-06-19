CREATE PROCEDURE [dbo].[sp_GetListingByID]
	@ListingId int = 0
AS
	SELECT	a.AgentId
			,a.AgentName
			,l.ListingId
			,l.ListingName
			,l.ListingAddress
			,o.OpenHouseId
			,o.OpenHouseBeginDate
			,o.OpenHouseEndDate
	FROM	Agent a (nolock)
	JOIN	Listing l (nolock) on l.AgentId = a.AgentId 
	JOIN	OpenHouse o (nolock) on o.ListingId = l.ListingId
	WHERE	l.ListingId = @ListingId
	ORDER BY l.ListingId, o.OpenHouseId