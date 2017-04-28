initialize
addMinimumClassesForOdbmsUsing: aMaObjectSerializer 
	"When a MagmaRepository is initially created, it has no notion of MagmaLocations.  Only when it is initially deployed as a server will an instance of MagmaRemoteLocation be added to the MagmaNode, thereby causing those classes to be in the class-definitions.	But, if a new repository is created, then attempt to set the node, the required order of the special-oid processing, that the #refreshNode must occur before #refreshClassDefinitions, resulting in a 'class-definition not found' error will occur.	Therefore, the following ensures the necessary classes are part of the class-definitions, making this a non-issue."
	aMaObjectSerializer classIdManager in: 
		[ : classIdManager | 
		{  MaServerLocation  } , MagmaLocation withAllSubclasses asArray do: 
			[ : each | 
			(classIdManager includesIdForClass: each) ifFalse: [ classIdManager addNewClass: each ] ].
		self classDefinitions: classIdManager classDefinitionsById ]