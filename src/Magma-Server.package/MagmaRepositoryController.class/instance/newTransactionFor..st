private
newTransactionFor: sessionId 
	preferences isReadOnly ifTrue: 
		[ MagmaUserError signal: 'This repository is set to read-only, commits are prohibited.' ].
	self restoreMode ifTrue: 
		[ MagmaUserError signal: 'Transactions are prohibited because this repository is in restore mode.' ].
	^ repository newTransactionFor: sessionId