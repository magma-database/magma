event handling
handleClassRename: aRenamedEvent 
	"aRenamedEvent's item has just been renamed."
	aRenamedEvent isRenamed ifFalse: [ ^ self ].
	"Class name changed, so did hash, so rehash."
	idsByClass rehash.
	inImageDefinitions rehash.
	(self includesIdForClass: aRenamedEvent item) ifFalse: [ ^ self ].
	(self inImageDefinition: aRenamedEvent item) in: [ : renamedClassDefinition | renamedClassDefinition className: aRenamedEvent newName ]