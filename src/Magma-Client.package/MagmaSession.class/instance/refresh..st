private
refresh: anObject 
	"Update anObject with the contents of the repository.  Use sparingly and with caution!"
	| readResult graph |
	((serializer hasOidFor: anObject) and: [( MaOidCalculator isOidForUserObject: (serializer oidFor: anObject)) not]) ifTrue: [  MagmaUserError signal: 'cannot refresh a non-persistent object.' ].
	readResult := self read: (self oidFor: anObject).
	graph := MaSerializedGraphBuffer byteArray: readResult byteArray.
	self
		refreshObject:
			((MagmaRefreshEvent session: self)
				 buffer: graph rootBuffer ;
				 object: anObject ;
				 yourself)
		includingLocal: false