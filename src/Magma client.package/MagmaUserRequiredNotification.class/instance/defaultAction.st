as yet unclassified
defaultAction
	"The user did not listen for this notification.  For now, bail them out by offering them an opportunity to create one on the fly."
	self resume: (session user ifNil: 
			[ SmalltalkImage current maIsHeadless 
				ifTrue: [ 'unnamed' ]
				ifFalse: 
					[ MagmaUser id: (FillInTheBlank request: 'Enter a name to connect under.') ] ])