*ma object serialization
maStreamVariablyInto: aMaVariableObjectBuffer for: aMaObjectSerializer
	"If a GC has happened since we set aMaVariableObjectBuffer's logicalSize then, upon materialization, it may try to load with 'garbage' oids because we load up to the number of logicalSize instVars (and the buffer would have garbage at those places).  Therefore, reset the logicalSize after populating."
	super
		maStreamVariablyInto: aMaVariableObjectBuffer
		for: aMaObjectSerializer.
	aMaVariableObjectBuffer physicalSize: (aMaVariableObjectBuffer physicalSizeFor: self)