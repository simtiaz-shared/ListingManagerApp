CREATE PROCEDURE [dbo].[sp_GetListings]
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
	ORDER BY l.ListingId, o.OpenHouseId