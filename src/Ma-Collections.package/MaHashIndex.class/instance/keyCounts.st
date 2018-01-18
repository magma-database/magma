analyzing
keyCounts
	"Answer a Bag of the keys of the receiver."
	| counts c |
	counts := Bag new.
	c := 0.
	'enumerating ' , self filename 
		displayProgressFrom: 0
		to: self size
		during: 
			[ : bar | 
			self 
				entriesFrom: 0
				do: 
					[ : rec : bax : lvl | 
					bar value: (c := c + 1).
					counts add: (rec keyAtByteArrayIndex: bax) ]
				until: [ : rec : bax : lvl | false ] ].
	^ counts