api
do: aBlock 
	| stdOut stdErr |
	self ensureStartedUp.
	stdOut := StandardFileStream stdout.
	stdErr := StandardFileStream stderr.
	[ [aBlock valueWithAllArguments: self args ] on: ProgressInitiationException do: [ : pie | pie defaultAction ] ]
		on: Notification , Warning
		do:
			[ : noti | stdOut
				 nextPutAll: DateAndTime now asString ;
				 space ;
				 nextPutAll: noti description ;
				 perform: MultiByteFileStream lineEndDefault.
			noti resume ]
		on: SyntaxErrorNotification
		do:
			[ : err | stdOut
				 nextPutAll: err errorCode ;
				 perform: MultiByteFileStream lineEndDefault.
			self haltOrQuit ]
		on: Error
		do:
			[ : err | err isMaUserError ifFalse:
				[ stdErr nextPutAll:
					(err signalerContext longStack
						copyReplaceAll: Character cr asString
						with: (String perform: MultiByteFileStream lineEndDefault)) ].
			stdErr
				 nextPutAll: 'ERROR:  ' ;
				 nextPutAll: DateAndTime now asString ;
				 space ;
				 perform: MultiByteFileStream lineEndDefault ;
				 nextPutAll: err description ;
				 perform: MultiByteFileStream lineEndDefault.
			self haltOrQuit ]