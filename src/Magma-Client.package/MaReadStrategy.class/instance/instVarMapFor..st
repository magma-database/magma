private
instVarMapFor: aMaClassDefinition 
	"Answer an Array with an instVarMap of aMaClassDefinition according to user-declared read depths."
	^ (Array new: aMaClassDefinition namedInstSize) in: 
		[ : arr | 
		arr atAllPut: 0.
		depthSpecifications 
			at: aMaClassDefinition classObject
			ifPresent: 
				[ : specifiedDepth | 
				specifiedDepth keysAndValuesDo: 
					[ : eachInstVarName : eachDepth | 
					| instVarIndex |
					instVarIndex := aMaClassDefinition allInstVarNames indexOf: eachInstVarName.
					instVarIndex > 0 ifTrue: 
						[ arr 
							at: instVarIndex
							put: eachDepth ] ].
				arr ]
			ifAbsent: [ arr ] ]