private
link: aMaServerLink 
	primaryLink := secondaryLink := aMaServerLink.
	primaryLink stat: self statistics.
	secondaryLink stat: self statistics