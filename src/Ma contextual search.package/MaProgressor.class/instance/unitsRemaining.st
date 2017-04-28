accessing
unitsRemaining
	^ self knowsTaskSize 
		ifTrue: [ self taskSize - self unitsCompleted ]
		ifFalse: 
			[ "Don't signal an error for progress notification.  Just omit the information if it can't be provided."
			" MauiUserError signalDoc: (MauiPage streamContents: 
					[ : stream | 
					stream
						nextPut: self ;
						nextPutAll: ' does not know its taskSize, so unitsRemaining cannot be computed.' ]) "
			1 ]