summarize
+ aMaStat 
	| n x c s |
	n := self min 
		ifNil: [ aMaStat min ]
		ifNotNil: 
			[ aMaStat min 
				ifNil: [ self min ]
				ifNotNil: [ self min min: aMaStat min ] ].
	x := self max 
		ifNil: [ aMaStat max ]
		ifNotNil: 
			[ aMaStat max 
				ifNil: [ self max ]
				ifNotNil: [ self max max: aMaStat max ] ].
	c := self count 
		ifNil: [ aMaStat count ]
		ifNotNil: 
			[ aMaStat count 
				ifNil: [ self count ]
				ifNotNil: [ self count + aMaStat count ] ].
	s := self sum 
		ifNil: [ aMaStat sum ]
		ifNotNil: 
			[ aMaStat sum 
				ifNil: [ self sum ]
				ifNotNil: [ self sum + aMaStat sum ] ].
	^ self maOriginalClass new 
		setLast: aMaStat last
		min: n
		max: x
		count: c
		sum: s