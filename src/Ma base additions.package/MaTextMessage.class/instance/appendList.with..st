private initializing
appendList: aCollection with: aString

	| index |

	aCollection isEmpty ifTrue: [ ^nil ].
	index := 1.
	aCollection do:
		[ :each |
		self append: each.
		aCollection size > 1
			ifTrue:
				[ index < (aCollection size - 1)
					ifTrue:
						[ self append: ', ' ]
					ifFalse:
						[ index = (aCollection size - 1) ifTrue: [ self append: aString ] ] ].
		index := index + 1 ]
