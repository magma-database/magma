code base
mapLegacyInstancesOf: oldClassName to: newClass 
	"If you renamed a class while not connected to the repository, use this method to migrate the persistent version in the repository to the new name and structure.  newClass must be present in the system.  Make a connection to the repository but send this message before accessing the root."
	| oldDefs |
	oldDefs := self definition classDefinitions
		detect:
			[ : eachDefinitions | eachDefinitions anySatisfy:
				[ : eachDefinition | eachDefinition isKnownAs: oldClassName ] ]
		ifNone: [ MagmaUserError signal: 'No old class named ' , oldClassName ].
	(serializer classIdManager hasClassDefinitionFor: newClass) ifTrue: [ MagmaUserError signal: 'This operation cannot be performed because ' , newClass name , ' is already established.' ].
	self commit:
		[ oldDefs do:
			[ : each | each beKnownAs: newClass name ] ]