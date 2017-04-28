as yet unclassified
finalizeValues: forceRehash 
	"remove all nil keys and rehash the receiver afterwards if forceRehash is true or if it needs resized."
	1
		to: array size
		do:
			[ : i | | each next |
			each := array at: i.
			[ each notNil and: [ each key isNil ] ] whileTrue:
				[ tally := tally - 1.
				each := each next ].
			array
				at: i
				put: each.
			each ifNotNil:
				[ next := each next.
				[ next notNil ] whileTrue:
					[ next key
						ifNil:
							[ tally := tally - 1.
							each next: next next ]
						ifNotNil: [ each := next ].
					next := next next ] ] ].
	self checkForUnderflow: forceRehash