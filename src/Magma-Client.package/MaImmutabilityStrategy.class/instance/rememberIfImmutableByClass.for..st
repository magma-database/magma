private
rememberIfImmutableByClass: anObject for: aMaTransaction 
	classes
		at: anObject maOriginalClass
		ifPresent:
			[ : foundCondition | (foundCondition value: anObject) ifTrue:
				[ aMaTransaction remove: anObject.
				immutables
					at: anObject
					put: nil ] ]
		ifAbsent: [  ]