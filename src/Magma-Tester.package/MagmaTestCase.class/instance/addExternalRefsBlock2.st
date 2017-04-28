test blocks
addExternalRefsBlock2
	| block |
	block := [ : arg | blockTestFixture := arg.
	self blockTestFixture first ].
"	self assert: (block value: {'world'}) = 'world'.
	self assert: blockTestFixture first = 'world'.
"	clientSession commit:
		[ clientSession root
			at: #testExternalRefsBlock2
			put: block ]