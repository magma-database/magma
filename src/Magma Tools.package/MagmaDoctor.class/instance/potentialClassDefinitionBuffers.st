private
potentialClassDefinitionBuffers
	| potentialAnswers |
	potentialAnswers := OrderedCollection new.
	self filer objectBuffersDo: 
		[ : each | 
		(self looksLikeClassDefinitionBuffer: each) ifTrue: [ potentialAnswers add: each ] ].
	(potentialAnswers collect: [ : e | e classId ]) asSet in: [ : classIds | classIds size = 1 ifTrue: [ classIdOfDictionary := classIds anyOne ] ].
	^ potentialAnswers