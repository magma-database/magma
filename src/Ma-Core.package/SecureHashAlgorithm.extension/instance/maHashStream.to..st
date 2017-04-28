*ma-core
maHashStream: aPositionableStream to: endPosition
	"Hash the contents of the given stream from the current position to endPosition using the Secure Hash Algorithm. The SHA algorithm is defined in FIPS PUB 180-1. It is also described on p. 442 of 'Applied Cryptography: Protocols, Algorithms, and Source Code in C' by Bruce Scheier, Wiley, 1996."
	"SecureHashAlgorithm new hashStream: (ReadStream on: 'foo')"

	| startPosition buf bitLength |
	self initializeTotals.

	"(SecureHashAlgorithm new hashMessage: '') radix: 16 	
	=> 'DA39A3EE5E6B4B0D3255BFEF95601890AFD80709'"
	aPositionableStream position >= endPosition ifTrue: [self processFinalBuffer: #() bitLength: 0].

	startPosition := aPositionableStream position.
	[aPositionableStream position >= endPosition] whileFalse: [
		buf := aPositionableStream next: (64 min: (endPosition-aPositionableStream position)).
		((aPositionableStream position >= endPosition) not and: [buf size = 64])
			ifTrue: [self processBuffer: buf]
			ifFalse: [
				bitLength := ((aPositionableStream position min: endPosition) - startPosition) * 8.
				self processFinalBuffer: buf bitLength: bitLength]].

	^ self finalHash
