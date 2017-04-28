*magma-client
maIsChangedFrom: aMaVariableObjectBuffer using: aMaObjectSerializer

	| logicalInstSize oidDict |
	logicalInstSize := aMaVariableObjectBuffer objectInstSize.
	self size*2 = logicalInstSize ifFalse: [ ^ true ].
	oidDict := Dictionary new: logicalInstSize / 2.
	1 to: logicalInstSize by: 2 do:
		[ :index | 
		oidDict 
			at: (aMaVariableObjectBuffer maInstVarAt: index)
			put: (aMaVariableObjectBuffer maInstVarAt: index+1) ].
	self keysAndValuesDo:
		[ : eachKey : eachValue |
		oidDict
			at: (aMaObjectSerializer oidFor: eachKey)
			ifPresent:
				[ : valueOid |
				valueOid = (aMaObjectSerializer oidFor: eachValue) ifFalse: [ ^true ] ]
			ifAbsent: [ ^ true ] ].
	^ false