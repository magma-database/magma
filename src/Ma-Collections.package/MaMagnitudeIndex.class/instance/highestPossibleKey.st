accessing
highestPossibleKey
	^ highestPossibleKey ifNil: [ highestPossibleKey := (1 bitShift: keySize) - 1 ]