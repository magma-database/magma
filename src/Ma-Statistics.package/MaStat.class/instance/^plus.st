summarize
+ aMaStat 
	^ min
		ifNil: [ aMaStat ]
		ifNotNil:
			[ aMaStat min
				ifNil: [ self ]
				ifNotNil: [ self copy merge: aMaStat ] ]