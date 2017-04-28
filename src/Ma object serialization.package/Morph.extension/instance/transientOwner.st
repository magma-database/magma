*ma object serialization
transientOwner
	(self hasProperty: #transientOwner) ifFalse: [ ^ false ].
	^ self valueOfProperty: #transientOwner