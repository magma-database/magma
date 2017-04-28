actions
traceAnyPathTo: oidInteger
	"Answer a collection of MaObjectBuffers representing the path to oidInteger."
	^ self traceAnyWhere: [ : each | each oid = oidInteger ]