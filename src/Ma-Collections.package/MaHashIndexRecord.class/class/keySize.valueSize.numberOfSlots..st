creation
keySize: keyBits valueSize: valueBits numberOfSlots: entrySizeInteger

	^ self new
		keySize: keyBits
		valueSize: valueBits
		numberOfSlots: entrySizeInteger ;

		postInitialize ;
		yourself