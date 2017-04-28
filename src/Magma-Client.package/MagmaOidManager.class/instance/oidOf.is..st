accessing
oidOf: anObject is: anInteger 
	^ (MaOidCalculator isOidForNewObject: anInteger)
		ifTrue:
			[ newObjects
				at: anInteger
				put: anObject.
			newOids
				at: anObject
				put: anInteger ]
		ifFalse:
			[ super
				oidOf: anObject
				is: anInteger.
			(anObject maIsMutatingProxy and: [ anObject maRealObjectIsReified ]) ifTrue:
				[ oids
					at: anObject realObjectIfMutatingProxy
					put: anInteger ] ]