as yet unclassified
oidOf: anObject is: anInteger

	^(MaOidCalculator isOidForNewObject: anInteger)
		ifTrue:
			[ newObjects 
				at: anInteger 
				put: anObject.
			newOids
				at: anObject
				put: anInteger ]
		ifFalse:
			[ "removeKey: is very slow, that's the whole point of newObejcts and newOids.  They're a dangerous hack to avoid removeKey."
			super
				oidOf: anObject
				is: anInteger ]