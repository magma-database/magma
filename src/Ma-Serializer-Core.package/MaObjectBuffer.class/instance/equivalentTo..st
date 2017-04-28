testing
equivalentTo: aMaObjectBuffer 
	self type = aMaObjectBuffer type ifFalse: [ ^ false ].
	self oid = aMaObjectBuffer oid ifFalse: [ ^ false ].
	self classId = aMaObjectBuffer classId ifFalse: [ ^ false ].
	self objectInstSize = aMaObjectBuffer objectInstSize ifFalse: [ ^ false ].
	self instVarsDoWithIndex:
		[ : eachRef : n | eachRef = (aMaObjectBuffer maInstVarAt: n) ifFalse: [ ^ false ] ].
	^ true