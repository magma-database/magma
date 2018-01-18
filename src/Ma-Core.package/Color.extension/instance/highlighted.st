*ma-core
highlighted
	"Answer a color which is a higlighted version of the receiver."
	^ self
		adjustSaturation: 0.10
		brightness:
			(self luminance > 0.5
				ifTrue: [ -0.15 ]
				ifFalse: [ 0.15 ])