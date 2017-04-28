*magma client
maRefreshTo: aMaVariableBuffer using: aMagmaSession 
	"I am variable."
	self maOriginalClass isBytes 
		ifTrue: 
			[self 
				replaceFrom: 1
				to: self size
				with: aMaVariableBuffer asByteArray
				startingAt: 1]
		ifFalse: 
			[ "I am pointers or words."
			aMaVariableBuffer instVarsDoWithIndex: 
				[ : eachOid : eachIndex | 
				(self maIsTransient: eachIndex) 
					ifFalse: 
						[ self 
							instVarAt: eachIndex
							put: (aMagmaSession serializer objectWithOid: eachOid) ] ] ]