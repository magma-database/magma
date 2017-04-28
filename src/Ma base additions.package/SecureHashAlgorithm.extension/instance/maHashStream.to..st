*ma base additions
maHashStream: aPositionableStream to: endPosition
	"Hash the contents of the given stream from the current position to endPosition using the Secure Hash Algorithm. The SHA algorithm is defined in FIPS PUB 180-1. It is also described on p. 442 of 'Applied Cryptography: Protocols, Algorithms, and Source Code in C' by Bruce Scheier, Wiley, 1996."

	| currentPosition buf bitLength |
	self initializeTotals.
	aPositionableStream atEnd ifTrue: [self error: 'empty stream'].
	endPosition > aPositionableStream size ifTrue: [ self error: 'invalid endPosition' ].
	[ currentPosition := aPositionableStream position.
	currentPosition < endPosition ]
		whileTrue:
			[ buf := aPositionableStream next: (64 min: endPosition-currentPosition).
			(currentPosition < endPosition
			and: [buf size = 64])
				ifTrue: [ self processBuffer: buf ]
				ifFalse: 
					[ bitLength := (endPosition - currentPosition) * 8.
					self processFinalBuffer: buf bitLength: bitLength ] ].
	^ self finalHash