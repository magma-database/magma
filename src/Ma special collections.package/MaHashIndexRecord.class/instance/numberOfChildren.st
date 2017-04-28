accessing
numberOfChildren

	| total |

	total := 0.
	self
		byteArrayIndexesFrom: 0
		do: [ :index | total := total + (self numberOfChildrenAtByteArrayIndex: index) ].
	^total
