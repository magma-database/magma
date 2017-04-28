private
rememberImmutableReferencesFrom: anObject bySpecFor: aMaTransaction
	specs
		at: anObject maOriginalClass
		ifPresent:
			[ : foundSpec | foundSpec keysAndValuesDo:
				[ : eachVarName : eachBlock | (eachBlock value: anObject) ifTrue:
					[ | immutable |
					immutable := anObject instVarNamed: eachVarName.
					immutable maIsMutatingProxy ifTrue:
						[ immutable := immutable maRealObjectIsReified ifTrue: [ immutable realObjectIfMutatingProxy ] ].
					immutable ifNotNil:
						[ aMaTransaction remove: immutable.
						immutables
							at: immutable
							put: nil ] ] ] ]
		ifAbsent: [  ]