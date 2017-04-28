test MagmaCounter
validateAndIncrementCounter
	| counter |
	clientSession begin.
	counter := self counterFixture.
	self assert: counter value = 10.
	counter increment: 35.
	self assert: counter value = 45.
	clientSession commitAndBegin