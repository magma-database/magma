*magma-server
process
	(MaOidCalculator isOidForUserObject: oid) ifFalse: [ MagmaUserError signal: oid asString, ' is not an oid of a persistent user-object.' ].
	repositoryController ensureOpen.
	^ self repository filer bufferFor: oid