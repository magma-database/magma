private
systemChanged: anEvent 
	anEvent itemKind = #method ifTrue:
		[ (anEvent isRemoved and: [ class includesSelector: anEvent itemSelector ]) ifTrue: [ class removeSelector: anEvent itemSelector ].
		self checkOverrideOf: anEvent itemSelector ].
	anEvent itemKind = #class ifTrue:
		[ anEvent isModified ifTrue:
			[ self checkClassFormat: anEvent.
			self rebuildMethods ] ]