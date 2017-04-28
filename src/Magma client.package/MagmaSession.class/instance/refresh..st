private
refresh: anObject
	"Update anObject with the contents of the repository.  Use sparingly and with caution!"

	| readResult graph |
	(self isPersistent: anObject) ifFalse: [ MagmaUserError signal: 'cannot refresh a non-persistent object.' ].
	readResult := self read: (self oidFor: anObject).
	graph := MaSerializedGraphBuffer byteArray: readResult byteArray.
	self refreshObject:
		((MagmaRefreshEvent session: self)
			buffer: graph rootBuffer;
			object: anObject ;
			yourself)