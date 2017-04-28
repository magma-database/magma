testing
isLoading
	^ loadProcess notNil and:
		[ loadProcess everStarted and: [ loadProcess isTerminated not ] ]