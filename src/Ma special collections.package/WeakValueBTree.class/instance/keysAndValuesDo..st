enumerating
keysAndValuesDo: aBlock
	super keysAndValuesDo:
		[ : eachKey : eachValue |
		aBlock
			value: eachKey
			value: (eachValue at: 1) ]