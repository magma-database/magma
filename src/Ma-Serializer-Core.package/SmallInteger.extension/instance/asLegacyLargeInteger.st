*ma-serializer-core
asLegacyLargeInteger
	^ (self
		between: -1073741824
		and: 1073741823)
		ifTrue: [ self ]
		ifFalse:
			[ | number |
			number := Integer
				new: self digitLength
				neg: self negative.
			1
				to: self digitLength
				do:
					[ : n | number
						digitAt: n
						put: (self digitAt: n) ].
			number ]