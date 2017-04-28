event handling
handleClassRename: aRenamedEvent 
	"aRenamedEvent's item has just been renamed."
	aRenamedEvent isRenamed ifFalse: [ ^ self ].
	self
		renameClass: aRenamedEvent item
		to: aRenamedEvent newName