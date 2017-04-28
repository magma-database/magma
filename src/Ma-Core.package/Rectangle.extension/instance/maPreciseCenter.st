*ma-core
maPreciseCenter
	"Same as #center, but usable for Rectangles specified by Floating points, in that it does not truncate to an Integer as #center does."
	^self topLeft + self bottomRight / 2