private-samples
samplesOf: attribute
	^ samples collect: [ : e | e perform: attribute ]