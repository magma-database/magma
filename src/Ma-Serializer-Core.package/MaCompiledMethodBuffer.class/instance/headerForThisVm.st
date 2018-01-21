private
headerForThisVm
	"Header fields and number of bits:
	Cog:							Spur:
	9:  primitive #					15:	numLiterals
	8:  numLiterals					1:
									1:  has primitive
	1:  frameSize					1:  frameSize
	6:  numTemps					6:  numTemps
	4:  numArgs						4:  numArgs"
	| headerVal |
	headerVal := self longAt: self bufferPositionOfMethodHeader.
	^ self spurHeader
		ifTrue:
			[ Smalltalk vm isSpur
				ifTrue: [headerVal]
				ifFalse: 
					[ "Spur-to-Cog header conversion."
					|cogHeader numLits| 
					(numLits:= headerVal bitAnd: 2r111111111111111) > 255 ifTrue: [ MaEnvironmentError signal: 'This image cannot materialize the CompiledMethod from Spur because it has more than 255 literals.' ].
					"Rebuild Cog header starting with high-order bits.  Erase low-order 16 bits by shifting right, then back left only 8 because that's all there is for Cog."
					cogHeader := (headerVal bitShift: -17) bitShift: 8.
					"Add in numLits to properly set the low-order 8 bits."
					cogHeader := cogHeader + numLits.
					"Finally, the 9 low-order bits in Cog are for primitive #.  We don't need to support CM's with primitives right now, so simply shift left."
					cogHeader bitShift: 9 ] ]
		ifFalse:
			[ Smalltalk isRunningSpur
				ifTrue:
					[ "Cog-to-Spur header conversion."
					| spurHeader numLits |
					"Obtain number of literals."
					numLits := (headerVal bitShift: -9) bitAnd: 16rFF.
					"Erase bottom 17 bits.  'has primitive' bit is 0, but we dont care about those right now."
					spurHeader := (headerVal bitShift: -17) bitShift: 17.
					"Bottom 16 bits are 0.  Set bottom 8 with numLits."
					spurHeader := spurHeader + numLits ]
				ifFalse: [ headerVal ] ]