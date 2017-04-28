*magma client
maIsChangedFrom: aMaVariableObjectBuffer using: aMaObjectSerializer 
	"I am variable."

	aMaVariableObjectBuffer isPointers 
		ifFalse: 
			[MagmaSoftwareError signal: self maOriginalClass name 
						, ' should implement maIsChangedFrom:using:.'].
	1 to: self maInstSize
		do: 
			[:index | 
			(index > self maOriginalClass instSize 
				or: [(self maIsTransient: index) not]) 
					ifTrue: 
						[(aMaObjectSerializer oidFor: (self instVarAt: index)) 
							~= (aMaVariableObjectBuffer maInstVarAt: index) ifTrue: [^true]]].
	^false