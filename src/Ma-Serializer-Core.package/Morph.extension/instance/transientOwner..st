*ma-serializer-core
transientOwner: aBoolean 
	aBoolean
		ifTrue:
			[ self
				setProperty: #transientOwner
				toValue: aBoolean ]
		ifFalse: [ self removeProperty: #transientOwner ]