*ma-core
colorPixels: aBlock
	"Value aBlock with each point of the receiver.  If aBlock answers a Color, recolor that pixel, otherwise leave it alone."
	self pixelsDo:
		[ : x : y | | point |
		point := x @ y.
		self
			colorAt: point
			put: ((aBlock value: point) ifNil: (self colorAt: point)) ]