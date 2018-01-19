start / stop
shutdown
	controller ifNotNil: 
		[ controller requestCritical: 
			[ self isSecondary ifTrue: 
				[ self node primarySession ifNotNil: 
					[ : sess | 
					[ sess removeWarmBackup: self thisLocation ] 
						on: NetworkError
						do: 
							[ : err | 
							"don't worry about it"
							 ] ] ].
			server ifNotNil: [ server shutdown ].
			self node ifNotNil: [ : node | node sessions do: [ : each | each disconnect ] ].
			self statistics ifNotNil: [ : stat | stat release ] ] ]