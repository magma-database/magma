building
refreshInImageDefinition: aClass 
	"Whenever the user recompiles a class in the image (e.g., during development)."
	({Object. 
	ProtoObject} includes: aClass) ifTrue:
		[ (self hasClassDefinitionFor: aClass) ifTrue:
			[ inImageDefinitions
				at: aClass
				ifAbsentPut: [ "We should only ever have one definition of Object or ProtoObject."
					(self classDefinitionsForClass: aClass) last ].
			^ self"performance" ] ].
	aClass withAllSubclassesDo:
		[ : eachClass | | knownDefinitions | (eachClass = aClass or: [ self includesIdForClass: eachClass ]) ifTrue:
			[ knownDefinitions := (self hasClassDefinitionFor: eachClass)
				ifTrue: [ self classDefinitionsForClass: eachClass ]
				ifFalse: [ Array empty ].
			inImageDefinitions
				at: eachClass
				put:
					(knownDefinitions
						maDetect: [ : each | each notNil and: [ each hasSameDefinitionAs: eachClass ] ]
						ifFound:
							[ : foundDef | "In the rare case, where a classdef was materialized but not defined in the image, so it was added to definitions only.  Now we're defining it so we need to be sure we set up its mappings."
							self
								idOfClass: eachClass
								is: foundDef id.
							foundDef ]
						ifNone: [ self newDefinitionNamed: eachClass name ]) ] ]