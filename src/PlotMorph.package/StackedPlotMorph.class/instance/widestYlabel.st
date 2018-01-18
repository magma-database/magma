geometry
widestYlabel
	| max | max:=nil.
	plots do:
		[ : each | max := max
			ifNil: [ each grid widestYlabel ]
			ifNotNil: [ max max: each grid widestYlabel ] ].
	^ max