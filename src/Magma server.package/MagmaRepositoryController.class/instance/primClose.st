private
primClose
	self requestCritical:
		[ session ifNotNil:
			[ session disconnect.
			session linksDo:
				[ : each | each localRequestServer shutdown ] ].
		self serverStatistics release.
		repository close.
		self removeOpenIndicator ]