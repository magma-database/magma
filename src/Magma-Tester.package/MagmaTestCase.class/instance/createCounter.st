test MagmaCounter
createCounter
	clientSession commit:
		[ clientSession root
			at: 'testMagmaCounter'
			put:
				(MagmaCounter new
					 increment: 10 ;
					 yourself).
		self
			 assert: self counterFixture value = 10 ;
			 assert: self counterFixture delta = 10 ].
	self
		 assert: self counterFixture value = 10 ;
		 assert: self counterFixture delta = 0