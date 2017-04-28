private
submit: aMagmaRepositoryRequest 
	"Submit aMagmaRepositoryRequest and answer the result.  This is a core method."
	| didTry |
	didTry := false.
	^ 
	[ self 
		submit: aMagmaRepositoryRequest
		to: primaryLink ] 
		on: MagmaWrongServerError
		do: 
			[ : err | 
			didTry 
				ifTrue: [ err pass ]
				ifFalse: 
					[ aMagmaRepositoryRequest isDisconnect ifFalse: 
						[ self
							disconnect ;
							primaryLocation: err correctServer.
						didTry := true.
						err retry ] ] ]