accessing
numberOfChildrenBeforeByteArrayIndex: anInteger

	| total |

	total := 0.
	self
		byteArrayIndexesFrom: 0
		do:
			[ :each |
			each = anInteger ifTrue: [ ^total ].
			total := total + (self numberOfChildrenAtByteArrayIndex: each) ].
	self error: anInteger printString, ' is not a valid byteArrayIndex.'