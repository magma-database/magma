test changed detection
slyUpdate
	clientSession refresh.
	[ (clientSession root at: #testChangedDetection) name: 'updated-name' ]
		on: MagmaSessionRequest
		do:
			[ : req | req handleAndResumeUsing: clientSession ]