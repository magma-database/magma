private
secondarySubmit: aMagmaRepositoryRequest 
	"Submit aMagmaRepositoryRequest to the secondary server and answer the result."
	| didTry |
	didTry := false.
	^ 
	[ self 
		submit: aMagmaRepositoryRequest
		to: secondaryLink ] 
		maOn: MagmaReadServerTooFarBehind
		do: 
			[ : err | 
			(didTry or: [ self isHighlyAvailable not or: [ aMagmaRepositoryRequest canRetry not ] ]) 
				ifTrue: [ err pass ]
				ifFalse: 
					[ 1 second asDelay wait.
					didTry := true.
					err retry ] ]
		on: MagmaWrongServerError
		do: 
			[ : err | 
			(didTry or: [ aMagmaRepositoryRequest canRetry not or: [ allowFailover not ] ]) 
				ifTrue: [ err pass ]
				ifFalse: 
					[ aMagmaRepositoryRequest isDisconnect ifFalse: 
						[ self
							disconnect ;
							secondaryLocation: err correctServer.
						didTry := true.
						err retry ] ] ]