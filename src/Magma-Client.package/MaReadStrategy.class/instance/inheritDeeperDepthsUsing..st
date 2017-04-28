private
inheritDeeperDepthsUsing: aMaClassIdManager 
	"When the user specifies:
		myReadStrategy
			forVariableNamed: 'submorphs'
			onAny: Morph
			readToDepth: 999
	then we need to ensure that any subclasses of Morph also read to 99999 for that variable.  Since each class has its own entire set of depth specs, we update the subclasses with the greater depth between their own and that of all their superclasses."
	depths keysAndValuesDo: 
		[ : eachIdAndVersion : eachDepths | 
		| eachDefinition |
		eachDefinition := aMaClassIdManager 
			definitionForClassId: eachIdAndVersion first
			version: eachIdAndVersion last.
		eachDefinition allSuperclassDefinitionsDo: 
			[ : eachSuperclassDefinition | 
			eachDefinition 
				inheritDeeperDepthsFrom: eachSuperclassDefinition
				using: depths ] ]