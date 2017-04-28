SUnit tests
baxInParent: parentRecord for: childRecord

	parentRecord
		byteArrayIndexesFrom: 0
		do:
			[ :bax |
			(parentRecord recordNumberAtByteArrayIndex: bax) = childRecord recordNumber
				ifTrue: [ ^bax ] ].
	self error: 'I am not child of parentRecord'