private
submit: aMagmaRepositoryRequest 
	"Submit aMagmaRepositoryRequest and answer the result.  This is a core method."
	^ [ self
		submit: aMagmaRepositoryRequest
		to: primaryLink ]
		on: MagmaWrongServerError
		do:
			[ : err | allowFailover
				ifTrue:
					[ MagmaNotification signal: err asString , ' switching to ' , err correctServer asString.
					self
						 disconnect ;
						 primaryLocation: err correctServer.
					err retry ]
				ifFalse:
					[ MagmaNotification signal: err asString.
					err pass ] ]