*ma-core
erasePixels: aBlock 
	self colorPixels:
		[ : each | (aBlock value: (self form colorAt: each)) ifTrue: [ Color transparent ] ]