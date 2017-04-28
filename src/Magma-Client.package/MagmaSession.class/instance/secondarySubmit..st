private
secondarySubmit: aMagmaRepositoryRequest 
	"Submit aMagmaRepositoryRequest to the secondary server and answer the result."
	^ [ aMagmaRepositoryRequest requiresConnection ifTrue: [ self ensureConnected ].
	self
		submit: aMagmaRepositoryRequest
		to: secondaryLink ]
		maOn: MagmaReadServerTooFarBehind
		do:
			[ : err | self isHighlyAvailable
				ifTrue:
					[ 1 second asDelay wait.
					err retry ]
				ifFalse: [ err pass ] ]
		on: MagmaWrongServerError
		do:
			[ : err | allowFailover
				ifTrue:
					[ MagmaNotification signal: err asString , ' switching to ' , err correctServer asString.
					self
						 disconnect ;
						 secondaryLocation: err correctServer.
					err retry ]
				ifFalse:
					[ MagmaNotification signal: err asString.
					err pass ] ]