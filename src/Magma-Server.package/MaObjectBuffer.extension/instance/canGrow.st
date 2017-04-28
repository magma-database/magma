*magma-server
canGrow
	"Answer whether my buffer can grow.  3=MaFixedObjectBuffer, 2=MaVariableObjectBuffer, 5=MaStorageObjectBuffer."
	^ self type = 3 or: [ self type = 2 or: [ self type = 5 ] ]