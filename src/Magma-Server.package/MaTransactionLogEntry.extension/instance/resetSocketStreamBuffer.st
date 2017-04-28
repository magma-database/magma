*magma-server
resetSocketStreamBuffer
	| lifecycle |
	result connection maClientConnection ifNil: [ ^ self ].
	lifecycle := result connection requestLifecycle.
	lifecycle ifNotNil: [ lifecycle critical: [ lifecycle socketStream resetBuffers ] ]