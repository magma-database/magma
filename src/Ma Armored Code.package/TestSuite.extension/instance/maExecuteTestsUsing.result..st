*ma armored code
maExecuteTestsUsing: aSymbol result: aResult 
	self tests isEmpty ifTrue: [ ^ self ].
	
	[ | shouldRunTests |
	shouldRunTests := [ self tests anyOne setUpSuite ] 
		on: MaNotification
		do: 
			[ : noti | 
			Transcript
				cr ;
				show: noti messageText.
			noti resume ].
	shouldRunTests ifTrue: 
		[ | durationToRun |
		durationToRun := 
		[ self tests do: 
			[ : each | 
			self changed: each.
			each 
				perform: aSymbol
				with: aResult ] ] durationToRun.
		Transcript
			cr ;
			show: 'Time to run all tests:' , durationToRun asString ] ] ensure: 
		[ [ self tests anyOne tearDownSuite ] 
			on: MaNotification
			do: 
				[ : noti | 
				Transcript
					cr ;
					show: noti messageText.
				noti resume ].
		Transcript
			cr ;
			show: 'Done.' ]