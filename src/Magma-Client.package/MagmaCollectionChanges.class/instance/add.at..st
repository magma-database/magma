overriding
add: anObject at: hashIndexValuesOrArrayIndex

	| removed |

	((removed := self removed) includesKey: anObject)
		ifTrue:
			[ removed removeKey: anObject ]
		ifFalse:
			[ self added
				at: anObject
				put: hashIndexValuesOrArrayIndex ]
