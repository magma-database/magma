test MagmaCounter
validateAndDecrementCounter
	| counter |
	clientSession begin.
	counter := self counterFixture.
	self assert: counter value = 45.
	counter decrement: 15.
	self assert: counter value = 30.
	clientSession commit.
	self assert: counter value = 30