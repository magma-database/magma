private
populateHeaderFor: anObject using: aMaObjectSerializer 
	"physicalSize was already set in ensureSpaceFor:, no need to calculate it again."
	self
		oid: (aMaObjectSerializer oidFor: anObject) ;
		type: self bufferType ;
		bpMapIndex: aMaObjectSerializer bpMapIndex ;
		classId: (aMaObjectSerializer classIdManager 
				idForClass: anObject maSerializationClass
				ifAbsent: 
					[ (aMaObjectSerializer classIdManager addNewClass: anObject maSerializationClass) id ])