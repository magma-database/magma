private
removeServerPackage
	(Smalltalk classNamed: #Author) 
		ifNil: [ Utilities setAuthorInitials: self name ]
		ifNotNilDo: [ : authorClass | authorClass fullName: self name ].
	MaObject class compile: self dontAcceptChangeLogging.
	(MCPackage named: 'Magma server') workingCopy unload.
	MaObject class removeSelector: #acceptsLoggingOfCompilation