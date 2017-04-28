initialize
initialize
	super initialize.
	openStreams := OrderedCollection new.
	guard := Mutex new