accessing
selectedPoints
	^ leftSelectedX
		ifNil: [ Array empty ]
		ifNotNil:
			[ | answer |
			answer := OrderedCollection new.
			series do:
				[ : eachSeries | eachSeries points do:
					[ : eachPlotPoint | ((eachPlotPoint x
						between: leftSelectedX
						and: rightSelectedX) and: [ (answer includes: eachPlotPoint) not ]) ifTrue: [ answer add: eachPlotPoint ] ] ].
			answer ]