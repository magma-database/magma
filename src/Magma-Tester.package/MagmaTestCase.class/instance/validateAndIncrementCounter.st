test MagmaCounter
validateAndIncrementCounter
	| counter |
	clientSession begin.
	counter := self counterFixture.
	self
		 assert: counter value = 10 ;
		 assert: counter delta = 0.
	counter increment: 35.
	self
		 assert: counter value = 45 ;
		 assert: counter delta = 35.
	clientSession commitAndBegin.
	self
		 assert: counter value = 45 ;
		 assert: counter delta = 0