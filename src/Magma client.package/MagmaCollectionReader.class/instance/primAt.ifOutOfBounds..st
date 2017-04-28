private
primAt: indexInteger ifOutOfBounds: aBlock 
	"Interrogates the committed and uncommitted contents of the underlying collection."
	^ indexInteger < 1 
		ifTrue: aBlock
		ifFalse: 
			[ (self isLoaded and: [ segment includesIndex: indexInteger ]) 
				ifTrue: 
					[ segment 
						at: indexInteger
						ifAbsent: aBlock ]
				ifFalse: 
					[ self 
						loadFromIndex: indexInteger
						pageSize: pageSize.
					(segment notNil and: [ segment includesIndex: indexInteger ]) 
						ifTrue: 
							[ segment 
								at: indexInteger
								ifAbsent: aBlock ]
						ifFalse: aBlock ] ]