debugging
testMaterialize: anObject

	| s1 graphBuffer |
	self halt.
	s1 := self new.
	graphBuffer := s1 serializeGraph: anObject.
	^ self new
		classDefinitionsByteArray: s1 classDefinitionsByteArray ;
		materializeGraph: graphBuffer byteArray copy