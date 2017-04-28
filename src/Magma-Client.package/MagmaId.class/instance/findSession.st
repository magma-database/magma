session
findSession
	"Look in this image for a session with this MagmaId.  If it exists, answer it, else find new session to my primaryLocation."
	^ MagmaSession connectedSessions
		detect:
			[ : each | each magmaId = self ]
		ifNone:
			[ MagmaSession allClientInstances
				detect: [ : each | each magmaId = self ]
				ifNone:
					[ | foundSession |
					self location ifNil: [ MagmaEnvironmentError signal: 'No location specified for remote repository.' ].
					foundSession := self location findSession.
					(foundSession magmaId notNil and: [ foundSession magmaId ~= self ]) ifTrue: [ MagmaEnvironmentError signal: self name , ' is no longer at ' , self location asString ].
					foundSession ] ]