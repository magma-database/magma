accessing
allSuperclassDefinitions
	^ Array streamContents: 
		[ : stream | 
		self allSuperclassDefinitionsDo: [ : each | stream nextPut: each ] ]