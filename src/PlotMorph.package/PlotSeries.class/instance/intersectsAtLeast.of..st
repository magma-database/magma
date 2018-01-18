testing
intersectsAtLeast: fraction of: aPlotSeries 
	"Answer whether my y-range intersects at least the specified fraction of the greater Y-range of the receiver and aPlotSeries."
	| min1 min2 max1 max2 intersection |
	min1 := aPlotSeries minPoint y.
	max1 := aPlotSeries maxPoint y.
	min2 := self minPoint y.
	max2 := self maxPoint y.
	intersection := (max1 min: max2) - (min1 max: min2).
	^ intersection > (fraction * (aPlotSeries maxPoint y - aPlotSeries minPoint y max: self maxPoint y - self minPoint y))