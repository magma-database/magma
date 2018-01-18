*ma-core
maPrintDescription
	super mauiName size < 40 ifTrue: [ ^ super mauiName ].
	^ String streamContents:
		[ : stream |
		self isEmpty ifTrue:
			[ stream maPrint:
				(self class name first isVowel
					ifTrue: [ 'an ' ]
					ifFalse: [ 'a ' ]).
			stream maPrint: 'empty '.
			stream maPrint: self maOriginalClass name ].
		self isEmpty ifFalse:
			[ | lowestCommonSuperclass |
			"		stream maPrint: ' of '."
			stream
				 maPrint: self size ;
				 space.
			lowestCommonSuperclass := self
				inject: self anyOne maOriginalClass
				into:
					[ : common : each | (each maOriginalClass == common or: [ each maOriginalClass inheritsFrom: common ])
						ifTrue: [ common ]
						ifFalse: [ each maOriginalClass maLowestCommonSuperclassWith: common ] ].
			stream
				maPrint: lowestCommonSuperclass name
				pluralizeIf: [ self size > 1 ] ] ]