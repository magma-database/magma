add / remove
removeAll: aCollection 
	aCollection do: [ : each | self remove: each ].
	^ aCollection