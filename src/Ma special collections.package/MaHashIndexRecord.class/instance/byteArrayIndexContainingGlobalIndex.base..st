accessing
byteArrayIndexContainingGlobalIndex: anInteger base: baseInteger
	"baseInteger is 0-based."

	| count |

	count := baseInteger.
	self
		byteArrayIndexesFrom: 0
		do:
			[ :each |
			count := count + (self numberOfChildrenAtByteArrayIndex: each).
			count >= anInteger ifTrue: [ ^each ] ].
	^nil