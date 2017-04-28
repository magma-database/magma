private
normalizeOverlappingValues
	"We don't do this because this is how we do keyword searches:
		myCollection where: [ :rdr | (rdr read: #keywords at: 'term1') | (rdr read: #keywords at: 'term2')]"