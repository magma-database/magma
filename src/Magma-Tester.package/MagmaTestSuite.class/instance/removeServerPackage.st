setup-teardown
removeServerPackage
	Utilities setAuthorInitials: self class name.
	MaObject class compile: self dontAcceptChangeLogging.
	(MCPackage named: 'Magma-Server') workingCopy unload.
	MaObject class removeSelector: #acceptsLoggingOfCompilation.
	self assert: (Smalltalk hasClassNamed: #MagmaServerConsole) not