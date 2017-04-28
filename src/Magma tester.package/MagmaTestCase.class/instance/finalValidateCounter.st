test MagmaCounter
finalValidateCounter
	| counter |
	(counter := self counterFixture) increment: 5.
	self assert: counter value = 50.  "shared 0, delta 5"
	clientSession commit.
	"but client1 had decremented by 15, now we can see that."
	self assert: counter value = 35