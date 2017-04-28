creation
create: aReadWriteStream keySize: numberOfBitsInteger valueSize: valueSize recordSize: entriesInteger

	^ (self
		newWithKeySize: numberOfBitsInteger
		valueSize: valueSize
		recordSize: entriesInteger)

		create: aReadWriteStream ;
		yourself