serializing
serializeRemovedUsing: aMaObjectSerializer

	| removed |

	self hasRemoved ifFalse: [ ^self ].
	(removed := self removed) copy keysAndValuesDo:
		[ :eachObject :eachHashIndexValues |
		removed
			at: (aMaObjectSerializer oidFor: eachObject)
			put: eachHashIndexValues;
			removeKey: eachObject ]
