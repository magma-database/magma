actions
refresh
	self current ifNotNil: [ self closeCurrent ].
	self reset