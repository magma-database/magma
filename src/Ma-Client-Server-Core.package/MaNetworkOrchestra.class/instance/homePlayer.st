player access
homePlayer
	"Answer the player which is meant to run in this image memory."
	^ players
		detect: [ : each | each isHome ]
		ifNone: [ nil ]