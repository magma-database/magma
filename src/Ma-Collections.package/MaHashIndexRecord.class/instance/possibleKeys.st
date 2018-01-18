debugging
possibleKeys

	| answer |

	answer := WriteStream on: (String new: numberOfSlots * 2).
	0
		to: numberOfSlots - 1
		do:
			[ : index |  | low high |
			low := self lowestKeyAtIndex: index.
			high := self highestKeyAtIndex: index.
			answer nextPutAll: ' | '.
			low = high
				ifTrue:
					[ answer maPrint: low ]
				ifFalse:
					[ answer
						maPrint: low;
						maPrint: '..';
						maPrint: high ] ].
	^ answer contents