*magma-client
inheritDeeperDepthsFrom: superMaClassDefinition using: depthsDictionary 
	"Look in depthsDictionary for a depthSpec (anInteger or Array of Integers) for superMaClassDefinition.  If has been specified,  answer an enhanced 'spec' that is the deeper between it and the depth-spec for me."
	superMaClassDefinition allInstVarNames withIndexDo: 
		[ : each : index | 
		depthsDictionary 
			at: { 
					(superMaClassDefinition id).
					(superMaClassDefinition version)
				 }
			ifPresent: 
				[ : superSpec | 
				| mySpec superDepth |
				superDepth := superSpec isInteger 
					ifTrue: [ superSpec ]
					ifFalse: [ superSpec at: index ].
				mySpec := depthsDictionary at: {  id. version  }.
				mySpec isInteger 
					ifTrue: 
						[ depthsDictionary 
							at: {  id. version  }
							put: (mySpec max: superDepth) ]
					ifFalse: 
						[ mySpec 
							at: index
							put: ((mySpec at: index) max: superDepth) ] ]
			ifAbsent: 
				[ "No spec for this superclass, nothing to inherit."
				 ] ]