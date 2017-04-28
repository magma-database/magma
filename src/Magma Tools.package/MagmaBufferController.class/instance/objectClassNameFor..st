access
objectClassNameFor: classIdInteger 
	^ (self classIdManager 
		classDefinitionsForId: classIdInteger
		ifAbsent: [ ^ (classIdInteger , ' - unknown classId') asString ]) last name