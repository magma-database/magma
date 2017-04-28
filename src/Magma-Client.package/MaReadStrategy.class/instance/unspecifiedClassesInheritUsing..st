private
unspecifiedClassesInheritUsing: aMaClassIdManager 
	"All of the classes explicitly specified for this ReadStrategy have inherited deeper depths of specified superclasses.  Now we want all *subclasses* which were not explicitly specified, to inherit the specified depths of their superclasses."
	aMaClassIdManager classDefinitionsById do: 
		[ : eachDefinitions | 
		eachDefinitions do: 
			[ : eachClassDefinition | 
			depths 
				at: { 
						(eachClassDefinition id).
						(eachClassDefinition version)
					 }
				ifPresent: [ : foundSpec |  ]
				ifAbsent: 
					[ "Look through his superclasses to see whether he should be inheriting"
					eachClassDefinition allSuperclassDefinitions reversed do: 
						[ : eachSuperclassDefinition | 
						depths 
							at: { 
									(eachSuperclassDefinition id).
									(eachSuperclassDefinition version)
								 }
							ifPresent: 
								[ : foundSuperSpec | 
								depths 
									at: { 
											(eachClassDefinition id).
											(eachClassDefinition version)
										 }
									put: (foundSuperSpec isInteger 
											ifTrue: [ foundSuperSpec ]
											ifFalse: [ self instVarMapFor: eachClassDefinition ]).
								eachClassDefinition 
									inheritDeeperDepthsFrom: eachSuperclassDefinition
									using: depths ]
							ifAbsent: [ "do nothing" ] ] ] ] ]