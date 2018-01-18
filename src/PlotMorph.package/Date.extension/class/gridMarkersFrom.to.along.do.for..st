*plotmorph
gridMarkersFrom: minJulianDayNumber to: maxJulianDayNumber along: xOrY do: oneArgBlock for: aPlotMorph 
	| closestDesiredSpacing totalDays |
	closestDesiredSpacing := 25.
	totalDays := maxJulianDayNumber - minJulianDayNumber.
	"Find the finest-grain we can without spacing closer than 25 pixels."
	(totalDays isZero or: [ (aPlotMorph drawBounds width / totalDays) > closestDesiredSpacing ])
		ifTrue:
			[ minJulianDayNumber
				to: maxJulianDayNumber
				do: oneArgBlock ]
		ifFalse:
			[ | pixelsPerWeek |
			pixelsPerWeek := aPlotMorph drawBounds width / (totalDays / 7).
			pixelsPerWeek > closestDesiredSpacing
				ifTrue:
					[ minJulianDayNumber
						to: maxJulianDayNumber
						do:
							[ : dayNumber | (Date julianDayNumber: dayNumber) weekdayIndex = 1 ifTrue: [ oneArgBlock value: dayNumber ] ] ]
				ifFalse:
					[ | pixelsPerMonth |
					pixelsPerMonth := aPlotMorph drawBounds width / (totalDays / 30).
					pixelsPerMonth > closestDesiredSpacing
						ifTrue:
							[ minJulianDayNumber
								to: maxJulianDayNumber
								do:
									[ : dayNumber | (Date julianDayNumber: dayNumber) dayOfMonth = 1 ifTrue: [ oneArgBlock value: dayNumber ] ] ]
						ifFalse:
							[ | pixelsPerYear |
							pixelsPerYear := aPlotMorph drawBounds width / (totalDays / 365).
							pixelsPerYear > closestDesiredSpacing ifTrue:
								[ minJulianDayNumber
									to: maxJulianDayNumber
									do:
										[ : dayNumber | (Date julianDayNumber: dayNumber) dayOfYear = 1 ifTrue: [ oneArgBlock value: dayNumber ] ] ] ] ] ]