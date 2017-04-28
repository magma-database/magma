test immutable strategy
setupTestImmutabilityStrategy
	| sess |
	sess := self class magmaServerLocation newSession.
	sess connectAs: 'testImmutabilityStrategyByReference'.
	sess commit:
		[ sess root
			at: #testImmutabilityStrategyByReference
			put: {'immutable: no proxy' -> 'an immutable string'. 
				'immutable: proxy' ->
					(MagmaPerson new
						 name: 'immutable b-day' ;
						 birthday: (DateAndTime year: 2004 month: 2 day: 29 hour: 13 minute: 33 second: 0 offset: 2 hours) asDate ;
						 yourself).
				'arvo'->'alina'} ].
	sess disconnect