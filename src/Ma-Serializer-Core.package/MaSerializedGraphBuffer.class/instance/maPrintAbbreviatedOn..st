printing
maPrintAbbreviatedOn: aStream
	super maPrintAbbreviatedOn: aStream.
	byteArray notNil
		ifTrue: [ aStream
				nextPutAll: ' (';
				maPrint: self objectCount;
				nextPutAll: ' objects in ';
				maPrint: self bufferSize humanReadableSIByteSize;
				nextPutAll: ' bytes)' ]