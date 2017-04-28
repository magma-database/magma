session
findSession
	"If there is already a session in the image for this location, use it, otherwise make a new one."
	^ MagmaSession connectedSessions
		maDetect: [ : each | each location = self ]
		ifFound: [ : foundSession | foundSession ]
		ifNone:
			[ MagmaSession allClientInstances
				maDetect: [ : each | each location = self ]
				ifFound: [ : foundSession | foundSession ]
				ifNone: [ self newSession ] ]