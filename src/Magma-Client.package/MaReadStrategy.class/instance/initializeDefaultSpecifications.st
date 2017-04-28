private
initializeDefaultSpecifications
	depthSpecifications := Dictionary new.
	self
		
		onAny: MaRootAnchor
		readToDepth: 1 ;
		
		onAny: Collection
		readToDepth: 1 ;
		
		onAny: Timespan
		readToDepth: 1 ;
		
		onAny: DateAndTime
		readToDepth: 1 ;
		
		onAny: Rectangle
		readToDepth: 1 ;
		
		forVariableNamed: 'next'
		onAny: MaAssociation
		readToDepth: 1 ;
		
		forVariablesNamed: #('package' 'info' 'dependencies' )
		onAny: MCVersion
		readToDepth: 1 ;
		
		forVariablesNamed: #('name' 'author' )
		onAny: MCVersionInfo
		readToDepth: 1 ;
		
		onAny: MCDefinition
		readToDepth: 1 ;
		
		onAny: SOLHashTable
		readToDepth: 1 ;
		
		forVariableNamed: 'pointers'
		onAny: SOLHashSegment
		readToDepth: 1 ;
		
		forVariableNamed: 'selector'
		onAny: MessageSend
		readToDepth: 1 ;
		
		forVariableNamed: 'arguments'
		onAny: MessageSend
		readToDepth: 1.
	{MethodContext. 
	BlockContext. 
	BlockClosure} do:
		[ : each | self
			onAny: each
			readToDepth: 1 ].
	"Try to avoid regular Dictionary's full of proxies."
	#('key' 'value' ) do:
		[ : each | self
			forVariableNamed: each
			onAny: Association
			readToDepth: 1 ].
	self
		forVariablesNamed: (MagmaRepositoryDefinition allInstVarNames copyWithoutAll: #('codeBase' 'attributes' ))
		onAny: MagmaRepositoryDefinition
		readToDepth: 99.
	#(#MagmaLocation #MagmaId #MagmaNode #MagmaCollection #MagmaCollectionReader #MagmaPreallocatedDictionary #MaClassDefinition #Project #Color #Duration #Point #Time #TimeZone #Form #BitMap #FileDirectory #DiskProxy #CompiledMethod #MaClassReference #ScaledDecimal #Fraction #LargePositiveInteger #FillStyle ) do:
		[ : each | (self maOriginalClass environment hasClassNamed: each) ifTrue:
			[ self
				onAny: (self maOriginalClass environment classNamed: each)
				readToDepth: 99 ] ]