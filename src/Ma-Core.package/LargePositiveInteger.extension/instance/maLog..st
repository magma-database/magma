*ma-core
maLog: anInteger 
	"Answer the log base aNumber of the receiver."
	^ (self log: anInteger) in:
		[ : firstAttempt | firstAttempt = Float infinity
			ifTrue:
				[ | m |
				"Search for it."
				m := 1023.
				(anInteger raisedTo: m) > self
					ifTrue:
						[ [ (anInteger raisedTo: m) < self ] whileFalse: [ m := m - 1 ].
						(m - 1) asFloat ]
					ifFalse:
						[ [ (anInteger raisedTo: m) > self ] whileFalse: [ m := m + 1 ].
						(m - 1) asFloat ] ]
			ifFalse: [ firstAttempt ] ]