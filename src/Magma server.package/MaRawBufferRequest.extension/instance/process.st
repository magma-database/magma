*magma server
process
	"Answer an Array, the first element is the MaObjectBuffer, the second is the MaCommitLogRecord, if available."
	| buffer answer |
	answer := OrderedCollection new.
	buffer := answer add: (self repository filer bufferFor: oid).
	"Also get the referenced buffers, it will be the first thing asked for from this client."
	buffer isPointers ifTrue: 
		[ buffer instVarsDoWithIndex: 
			[ : eachOid : index | 
			(MaOidCalculator isOidForUserObject: eachOid) ifTrue: [ answer add: (self repository filer bufferFor: eachOid) ] ] ].
	^ answer asArray