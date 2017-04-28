private
calculatedCheckSum

	^ ReusableSha 
		maHashMessage: byteArray
		from: 1
		to: self physicalSize - self checkSumSize