accessing
bufferForOid: oidInteger 
	"Calls bufferFor: in the server."
	^ self secondarySubmit: 
		(MaRawBufferRequest new
			oid: oidInteger ;
			yourself)