signaling
signalCommitAndBegin

	self 
		signal: 'committing transaction and beginning a new one'
		do: [ :session | session commitAndBegin ]