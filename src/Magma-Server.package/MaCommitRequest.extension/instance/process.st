*magma-server
process
	| nodeUpdates answer |
	answer := 
	[ self repository 
		submitAll: package
		for: sessionId
		beginAnother: beginAnother ] 
		on: MagmaNodeUpdate
		do: 
			[ : update | 
			nodeUpdates := nodeUpdates ifNil: [ OrderedCollection new ].
			nodeUpdates add: update.
			update resume ].
	nodeUpdates ifNotNil: 
		[ "this commit refreshes my sessions view"
		self session commit: [ nodeUpdates do: [ : each | each applyTo: repositoryController node ] ] ].
	^ answer