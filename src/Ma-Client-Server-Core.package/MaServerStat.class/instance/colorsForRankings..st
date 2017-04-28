private-chart
colorsForRankings: anInteger 
	^ (Color wheel: anInteger * (4 / 3) rounded)
		copyFrom: 1
		to: anInteger