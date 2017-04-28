private
materializeObjectsIn: aMaCollectionSegment 
	self statistics clientSideMcPageReadsTimeHistory addValue: (Time millisecondsToRun: 
			[ aMaCollectionSegment objects doWithIndex: 
				[ : eachHashAndBuffer : index | 
				eachHashAndBuffer isVariableBinding 
					ifTrue: 
						[ aMaCollectionSegment objects 
							at: index
							put: eachHashAndBuffer key -> (self materializeObject: eachHashAndBuffer value) ]
					ifFalse: 
						[ "For member-index access, we only need the object buffers, there are no associated hashes, and I decided an ugly type-check was better than wasting bandwidth."
						aMaCollectionSegment objects 
							at: index
							put: (self materializeObject: eachHashAndBuffer) ] ] ])