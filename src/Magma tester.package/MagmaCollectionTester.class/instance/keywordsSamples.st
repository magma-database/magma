private-samples
keywordsSamples
	^ KeywordsSamples ifNil: 
		[ | cmInstances |
		KeywordsSamples := OrderedCollection new.
		cmInstances := CompiledMethod allInstances readStream.
		[ cmInstances atEnd or: [ KeywordsSamples size >= 1000 ] ] whileFalse: 
			[ | nextInstance |
			nextInstance := cmInstances next.
			nextInstance isInstalled ifTrue:
				[ KeywordsSamples add: nextInstance maSourceString subStrings asSet asArray ] ].
		self assert: KeywordsSamples size = 1000.
		KeywordsSamples ]