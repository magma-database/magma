*ma base additions
maFindEntriesMatching: substring 
	"Traverse my directory and answer an OrderedCollection of DirectoryEntry's whose names contain substring."
	"This method focuses on user-convenience; eschewing complex wild-card matching in favor of 'type-and-go'.  But without punishing engineers who still want to use wild-card matching."
	| usePatternMatch |
	usePatternMatch := substring includesAnyOf: #($* $# ).
	^ self maFindEntries: 
		[ : path | 
		path last name in: 
			[ : theName | 
			usePatternMatch 
				ifTrue: [ substring match: theName ]
				ifFalse: 
					[ theName 
						includesSubstring: substring
						caseSensitive: false ] ] ]