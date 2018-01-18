classes
addClassesNamed: aString 
	"Add any classes known in the image whose names include aString anywhere."
	self systemNavigation allBehaviorsDo: 
		[ : each | 
		(each name 
			includesSubstring: aString
			caseSensitive: self isCaseSensitive) ifTrue: [ self addClass: each ] ]