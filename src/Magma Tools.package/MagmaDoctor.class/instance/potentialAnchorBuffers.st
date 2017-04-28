private
potentialAnchorBuffers
	| potentialAnswers |
	potentialAnswers := OrderedCollection new.
	self filer objectBuffersDo: 
		[ : each | 
		(self looksLikeAnchorBuffer: each) ifTrue: [ potentialAnswers add: each ] ].
	^ potentialAnswers