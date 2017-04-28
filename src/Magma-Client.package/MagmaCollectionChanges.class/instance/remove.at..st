removed
remove: anObject at: hashIndexesCollection

	| added |

	((added := self added) includesKey: anObject)
		ifTrue:
			[ added removeKey: anObject ]
		ifFalse:
			[ self removed
				at: anObject
				put: hashIndexesCollection ]
