private
createRepositoryAt: aMagmaLocalLocation 
	| anchor |
	self initializeSession.
	self session initializeDefinition.
	self session definition addMinimumClassesForOdbmsUsing: self serverSerializer.
	localLocation := aMagmaLocalLocation.
	self
		repository: (MaObjectRepository 
				create: localLocation directory
				controller: self) ;
		connect ;
		forceWrite: (anchor := MaRootAnchor new
				definition: self definition ;
				yourself).
	repository filer
		anchorOid: (self session oidFor: anchor) ;
		classDefinitionsOid: (self session oidFor: self definition classDefinitions) ;
		definitionOid: (self session oidFor: self definition).
	self close