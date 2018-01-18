*ma-core
pixelsDo: aBlock 
	0
		to: self width
		do:
			[ : eachCol | 0
				to: self height
				do:
					[ : eachRow | aBlock
						value: eachCol
						value: eachRow ] ]