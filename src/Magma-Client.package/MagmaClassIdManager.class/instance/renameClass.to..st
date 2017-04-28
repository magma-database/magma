event handling
renameClass: aClass to: newName 
	"Class name changed, so did hash, so rehash."
	idsByClass rehash.
	inImageDefinitions rehash.
	(self includesIdForClass: aClass) ifFalse: [ ^ self ].
	(self inImageDefinition: aClass) in:
		[ : renamedClassDefinition | renamedClassDefinition beKnownAs: newName ].
	(self classDefinitions at: (self idForClass: aClass)) do:
		[ : each | each beKnownAs: newName ]