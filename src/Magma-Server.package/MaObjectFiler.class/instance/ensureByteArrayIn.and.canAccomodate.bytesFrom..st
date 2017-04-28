private
ensureByteArrayIn: aMaObjectBuffer and: aMaSerializedGraphBuffer canAccomodate: anInteger bytesFrom: startPos

	(startPos + anInteger) > aMaObjectBuffer byteArray size
		ifTrue:
			[ | bigByteArray beforeSize afterSize |
			beforeSize := aMaObjectBuffer byteArray size.
			afterSize := (aMaObjectBuffer byteArray size * 2) max: startPos + anInteger.
			bigByteArray := ByteArray new: afterSize.
			bigByteArray
				replaceFrom: 1
				to: beforeSize
				with: aMaSerializedGraphBuffer byteArray
				startingAt: 1.
			aMaObjectBuffer byteArray: bigByteArray.
			aMaSerializedGraphBuffer byteArray: bigByteArray ]