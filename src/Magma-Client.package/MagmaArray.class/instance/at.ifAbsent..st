accessing
at: anInteger ifAbsent: aBlock 
	^ changes
		at: anInteger
		ifAbsent:
			[ (self isLoaded and: [ segment includesIndex: anInteger ])
				ifTrue:
					[ segment
						at: anInteger
						ifAbsent: aBlock ]
				ifFalse:
					[ | size |
					size := self lastKnownSize.
					self isNewCollection
						ifTrue:
							[ anInteger < size
								ifTrue: [ nil ]
								ifFalse: aBlock ]
						ifFalse:
							[ self loadFromIndex: anInteger.
							(segment includesIndex: anInteger)
								ifTrue:
									[ segment
										at: anInteger
										ifAbsent: aBlock ]
								ifFalse:
									[ anInteger < size
										ifTrue: [ nil ]
										ifFalse: aBlock ] ] ] ]