accessing
sessionId: aUuid 
	self requiresConnection ifTrue: [ aUuid ifNil: [ MagmaSoftwareError signal ] ].
	sessionId := aUuid