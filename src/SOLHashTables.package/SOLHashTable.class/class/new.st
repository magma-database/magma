create
new
	^ self
		loadFactor: self defaultLoadFactor
		segBits: self defaultSegBits
		keyBits: 28