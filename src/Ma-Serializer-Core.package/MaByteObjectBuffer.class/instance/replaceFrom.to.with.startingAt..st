private
replaceFrom: startInteger to: endInteger with: byteObject startingAt: startingInteger

	byteArray
		replaceFrom: self startPos + self headerSize + startInteger
		to: self startPos + self headerSize + endInteger
		with: byteObject
		startingAt: startingInteger
