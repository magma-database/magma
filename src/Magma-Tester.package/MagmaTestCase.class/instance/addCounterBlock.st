test blocks
addCounterBlock
	| block |
	block := self counterBlock.
	self assert: block value = 1.
	clientSession commit:
		[ clientSession root
			at: #testCounterBlock
			put: block ].
	self assert: block value = 2.
	self assert: block value = 3.
	"Since it is persistent, aborting at this point should revert the count!"
	clientSession abort.
	self assert: block value = 2