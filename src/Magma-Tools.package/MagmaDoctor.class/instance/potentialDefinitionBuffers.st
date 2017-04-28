private
potentialDefinitionBuffers
	| potentialAnswers |
	potentialAnswers := OrderedCollection new.
	self filer objectBuffersDo: 
		[ : each | 
		(self looksLikeDefinitionBuffer: each) ifTrue: [ potentialAnswers add: each ] ].
	^ potentialAnswers