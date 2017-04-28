updating
primaryLocation: aMagmaLocation 
	(locations notEmpty and: [ locations first = aMagmaLocation ]) ifTrue: [ ^ self ].
	locations := locations copyWithout: aMagmaLocation.
	"Local connections are used only exclusively."
	locations := aMagmaLocation isLocal 
		ifTrue: 
			[ {  aMagmaLocation  } ]
		ifFalse: 
			[ {  aMagmaLocation  } , (locations reject: [ : each | each isLocal ]) ]