*ma object serialization
transientOwner: aBoolean 
	aBoolean
		ifTrue:
			[ self
				setProperty: #transientOwner
				toValue: aBoolean ]
		ifFalse:
			[ self
				removePropertyAt: #transientOwner
				ifAbsent: [ "don't worry, be happy" ] ]