*magma client
maIsChangedFrom: aMaVariableObjectBuffer using: aMaObjectSerializer

	| oidSet |
	aMaVariableObjectBuffer objectInstSize ~= self size ifTrue: [ ^ true ].
	oidSet := Set new: aMaVariableObjectBuffer objectInstSize.
	aMaVariableObjectBuffer instVarsDoWithIndex: [ : eachOid : x | oidSet add: eachOid ].
	self do: [ :each | (oidSet includes: (aMaObjectSerializer oidFor: each)) ifFalse: [ ^ true ] ].
	^ false