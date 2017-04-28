admin
rawBuffersFor: oidInteger 
	"Answer the MaObjectBuffer for oidInteger, along with other buffers it may reference."
	"Calls bufferFor:."
	^ self secondarySubmit: (MaRawBufferRequest new
			oid: oidInteger ;
			yourself)