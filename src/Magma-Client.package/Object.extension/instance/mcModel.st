*magma-client
mcModel
	^ self isInMagma ifTrue: [ self magmaSession mcModel ]