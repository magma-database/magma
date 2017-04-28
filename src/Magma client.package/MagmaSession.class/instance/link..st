private
link: aMaServerLink 
	primaryLink := secondaryLink := aMaServerLink.
	primaryLink stat: self statistics.
	secondaryLink stat: self statistics.
	self timeoutSeconds: (MagmaPreferences debug 
			ifTrue: 
				[ "2 days"
				172800 ]
			ifFalse: [ 30 ])