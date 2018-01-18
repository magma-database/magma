*ma-serializer-core
transientOwner
	(self hasProperty: #transientOwner) ifFalse: [ ^ false ].
	^ self valueOfProperty: #transientOwner