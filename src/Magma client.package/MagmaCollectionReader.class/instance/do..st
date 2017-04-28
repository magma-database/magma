enumerating
do: oneArgBlock 
	| index |
	index := 0.
	
	[ oneArgBlock value: 
		(self 
			at: (index := index + 1)
			ifAbsent: [ ^ self ]) ] repeat