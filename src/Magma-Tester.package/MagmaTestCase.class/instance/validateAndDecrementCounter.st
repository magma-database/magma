test MagmaCounter
validateAndDecrementCounter
	| counter |
	clientSession begin.
	counter := self counterFixture.
	self
		 assert: counter value = 45 ;
		 assert: counter delta = 0.
	counter
		 decrement: 15 ;
		 assert: counter delta = -15 ;
		 assert: counter value = 30.
	clientSession commit.
	self
		 assert: counter value = 30 ;
		 assert: counter delta = 0