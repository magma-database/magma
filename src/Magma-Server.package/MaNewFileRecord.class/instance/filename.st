accessing
filename
	^ (byteArray
		copyFrom: self headerSize+1
		to: self checkSumPosition-1) asString