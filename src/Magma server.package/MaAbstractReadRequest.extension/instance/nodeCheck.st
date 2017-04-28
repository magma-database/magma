*magma server
nodeCheck
	requiredProgress isInteger ifFalse: 
		[ MagmaSoftwareError signal: 'requiredProgress must be an Integer, not a ' , requiredProgress class name ].
	repositoryController commitNumber < requiredProgress ifTrue: [ MagmaReadServerTooFarBehind signal ].
	self shouldBeSecondary