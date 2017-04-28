overriding
debug
	self tests isEmpty ifTrue: [ ^ self ].
	[ self setUp ]
		on: MaNotification
		do:
			[ : noti | Transcript
				 cr ;
				 show: noti messageText.
			noti resume ].
	[ self orchestra isConductorImage ifTrue:
		[ | durationToRun |
		durationToRun := [ super debug ] durationToRun.
		Transcript
			 cr ;
			 show: 'Time to run all tests:' , durationToRun asString ] ] ensure:
		[ [ self tearDown ]
			on: MaNotification
			do:
				[ : noti | Transcript
					 cr ;
					 show: noti messageText.
				noti resume ].
		Transcript
			 cr ;
			 show: 'Done.' ]