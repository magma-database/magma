utilities
create: pathStringOrMagmaLocalLocation root: anObject
	| session location |
	location := pathStringOrMagmaLocalLocation asMagmaLocalLocation.
	self create: location.
	session := MagmaSession openLocal: location.
	session
		connect: (MagmaUser id: 'system create:root:') ;
		commit: [ session root: anObject ] ;
		disconnect ;
		closeRepository