private
convertSpecificationsToIdsUsing: aMaClassIdManager 
	"Convert the classes in the receiver to classId's, since that is what the server goes by."
	| specifiedClassNames |
	specifiedClassNames := (depthSpecifications keys collect: [ : each | each name ]) asSet.
	aMaClassIdManager classDefinitionsById do: 
		[ : eachDefinitions | 
		eachDefinitions do: 
			[ : eachDefinition | 
			(specifiedClassNames includes: eachDefinition name) ifTrue: 
				[ | depthSpec |
				depthSpec := depthSpecifications at: eachDefinition classObject.
				self beNew.
				depths 
					at: {  (eachDefinition id). (eachDefinition version)  }
					put: 
						(depthSpec isInteger 
							ifTrue: [ depthSpec ]
							ifFalse: [ self instVarMapFor: eachDefinition ]) ] ] ]