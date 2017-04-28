serialization
pathsToNewLinksAndTypes
	| newClasses newLinks |
	newClasses := Set new.
	newLinks := Set new.
	self pathsToNewLinksAndTypesDo:
		[ : eachPath | eachPath isMagmaId
			ifTrue: [ newLinks add: eachPath ]
			ifFalse: [ newClasses add: eachPath ] ]