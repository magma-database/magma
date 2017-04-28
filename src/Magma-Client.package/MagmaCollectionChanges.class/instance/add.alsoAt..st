overriding
add: anObject alsoAt: hashIndexValues 
	| removed |
	((removed := self removed) includesKey: anObject)
		ifTrue: [ removed removeKey: anObject ]
		ifFalse:
			[ self added
				at: anObject
				ifPresent:
					[ : existingHashValues | existingHashValues
						with: hashIndexValues
						do: [ : eachExisting : eachAdditional | eachExisting addAll: eachAdditional ] ]
				ifAbsentPut: [ hashIndexValues ] ]