fixtures
focusOn: fixtureSelector 
	(fixture keys copyWithout: fixtureSelector) do:
		[ : each | session stubOut: (fixture at: each) ].
	Smalltalk garbageCollect.
	session finalizeOids.
	(self perform: fixtureSelector) realObjectIfMutatingProxy "ensure proxy-materialized."