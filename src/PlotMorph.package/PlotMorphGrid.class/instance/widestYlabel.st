accessing
widestYlabel
	^ (yLabels detectMax:
		[ : each | each width ])
		ifNil: [ 0 ]
		ifNotNil: [ : lbl | lbl width ]