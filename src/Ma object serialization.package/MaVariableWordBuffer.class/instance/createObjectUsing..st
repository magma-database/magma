accessing
createObjectUsing: aMaObjectSerializer
	| answer |
	answer := (self ensureClassUsing: aMaObjectSerializer) basicNew: self objectInstSize.
	1 to: self objectInstSize do:
		[ : x |
		answer
			basicAt: x
			put: (self wordAt: x) ].
	^ answer