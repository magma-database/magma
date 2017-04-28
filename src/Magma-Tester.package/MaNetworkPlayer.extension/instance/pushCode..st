*magma-tester
pushCode: aPositionableStream 
	^ self
		remotePerform: #loadCodeFrom:
		with: aPositionableStream