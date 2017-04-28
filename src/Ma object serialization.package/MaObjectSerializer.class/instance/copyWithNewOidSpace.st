copying
copyWithNewOidSpace
	"Answer a new instance of the me that shares my class-ids, but not the oids."
	
	^ self copyWithNewBuffer
		postCopyWithNewOidSpace ;
		yourself