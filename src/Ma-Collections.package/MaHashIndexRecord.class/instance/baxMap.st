debugging
baxMap

	| map |

	map := OrderedCollection new.
	self
		byteArrayIndexesFrom: 0
		do: [ :each | map add: (self slotIndexForBax: each) -> each ].
	^map asArray
