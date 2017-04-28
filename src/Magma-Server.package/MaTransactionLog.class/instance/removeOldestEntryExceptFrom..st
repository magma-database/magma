private
removeOldestEntryExceptFrom: sessionId 
	"Remove the oldest entry, but not the system session, of course."
	^ entries
		detect:
			[ : each | each isSystem not and: [ each id ~= sessionId ] ]
		ifFound:
			[ : foundEntry | entries remove: foundEntry ]
		ifNone: [  ]