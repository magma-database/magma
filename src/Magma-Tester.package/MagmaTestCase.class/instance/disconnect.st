client
disconnect

	clientSession ifNotNil: [ clientSession disconnect ].
	^nil