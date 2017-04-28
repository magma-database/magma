access
classDefinitionFor: classIdInteger version: versionInteger 
	^ 
	[ self classIdManager 
		definitionForClassId: classIdInteger
		version: versionInteger ] 
		on: Error
		do: 
			[ : err | 
			(MaClassDefinition className: '(id=' , classIdInteger printString , ', v=' , versionInteger printString , ') unknown')
				id: classIdInteger ;
				version: versionInteger ;
				yourself ]