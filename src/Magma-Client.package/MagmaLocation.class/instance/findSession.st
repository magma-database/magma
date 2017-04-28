session
findSession
	"If there is already a session in the image for this location, use it, otherwise make a new one."
	^ MagmaSession connectedSessions
		detect: [ : each | each location = self ]
		ifNone:
			[ MagmaSession allClientInstances
				detect: [ : each | each location = self ]
				ifNone: [ self newSession ] ]