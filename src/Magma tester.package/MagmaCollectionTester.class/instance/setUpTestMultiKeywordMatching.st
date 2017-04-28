testMultiKeywordMatching
setUpTestMultiKeywordMatching
	clientSession
		abort ;
		commit: 
			[ | c |
			clientSession root 
				at: #testMultiKeywordMatching
				put: (c := MagmaCollection new
						addIndex: self newKeywordIndex ;
						yourself).
			1 
				to: 1000
				do: [ : n | c add: n asWords subStrings -> n ] ]