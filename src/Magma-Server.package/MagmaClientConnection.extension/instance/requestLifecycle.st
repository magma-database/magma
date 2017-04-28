*magma-server
requestLifecycle
	^ maClientConnection ifNotNil: [ maClientConnection lifecycle ]