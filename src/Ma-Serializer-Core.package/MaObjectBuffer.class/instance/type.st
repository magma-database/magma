access
type
	"Answer the type of buffer this is.
		1=MaByteObjectBuffer
		2=MaVariableObjectBuffer
		3=MaFixedObjectBuffer
		4=MaVariableWordBuffer 
		5=MaStorageObjectBuffer
		6=MaCompiledMethodBuffer 
		7=MaContextMethodBuffer"
	^ self controlFields bitAnd: 2r00001111