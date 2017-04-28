private
validateCanAdd: oidInteger at: keyInteger

	keyInteger > self highestPossibleKey ifTrue:
		[ MaHashIndexUserError signal: keyInteger printString, ' is larger than the highestPossibleKey.' ]