api
do: aBlock 
	self ensureStartedUp.
	[ [ aBlock valueWithAllArguments: Smalltalk arguments ]
		on: ProgressInitiationException
		do:
			[ : pie | "Don't want to log this notification."
			pie defaultAction ] ]
		on: Notification , Warning
		do:
			[ : noti | StandardFileStream stdout
				nextPutAll: DateAndTime now asString ;
				space ;
				nextPutAll: noti description ;
				cr ;
				flush.
			noti resume ]
		on: SyntaxErrorNotification
		do:
			[ : err | StandardFileStream stdout
				nextPutAll: err errorCode ;
				cr ;
				flush.
			self haltOrQuit ]
		on: Error
		do:
			[ : err | err printVerboseOn: StandardFileStream stderr.
			self haltOrQuit.
			err isResumable ifTrue: [ err resume ] ]