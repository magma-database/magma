accessing
highestPossibleKey

	^ highestPossibleKey ifNil:
		[ highestPossibleKey := (2 raisedTo: keySize) - 1 ]
