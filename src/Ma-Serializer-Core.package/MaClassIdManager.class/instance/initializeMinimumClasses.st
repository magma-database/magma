private
initializeMinimumClasses
	| legacyDefinitions minimumClassDefs |
	legacyDefinitions := OrderedCollection new.
	(Smalltalk classNamed: #HashedCollection)
		ifNil: [ Array empty ]
		ifNotNil: [ :cls | 
			legacyDefinitions
				add:
					((self newDefinitionNamed: cls name)
						id: 90;
						yourself) ].
	minimumClasses := self class minimumClasses.
	"For compatibility with serialized objects created by older Squeak versions, force specific classes from older Squeak versions to their legacy id's. In 3.9, id 115 was the first user class-id, but as-of 4.1, the hierarchy changed and HashedCollection is extra and would try to occupy 115!  Therefore, make HashedCollection 90. Set the first user classId up to 1000 so this won't happen again!"
	self legacyClassMap
		do: [ :each | 
			legacyDefinitions
				add:
					((self newDefinitionNamed: each value name)
						id: each key;
						yourself) ].
	"Reserve those legacy id's first."
	minimumClassDefs := legacyDefinitions
		collect: [ :each | self primAddClassDefinition: each ].
	nextClassId := 1000.
	"Now add them using the normal API so that their superlcass defs will get defined too."
	minimumClassDefs do: [ :each | self addClassDefinition: each ].
	"Finally, make sure any that were added as minimumClasses since those legacy ones are also included."
	minimumClasses
		do: [ :each | 
			(self hasClassDefinitionFor: each)
				ifFalse: [ self addNewClass: each ] ]