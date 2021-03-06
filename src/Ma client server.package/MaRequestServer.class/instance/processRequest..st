private
processRequest: aMaClientServerRequest 
	"Here's your request object, do something with it and answer any object, though for remote connections only, every class throughout the entire request and responses graph must be part of your #protocol."
	| answer |
	console noteAboutToProcessRequest: aMaClientServerRequest.
	answer := 
	[ aMaClientServerRequest = self connectionRequest 
		ifTrue: [ self connectionInfo ]
		ifFalse: [ processor value: aMaClientServerRequest ] ] 
		on: MaNotification
		do: 
			[ : noti | 
			console note: noti messageText.
			noti resume ].
	console noteRequestProcessed: aMaClientServerRequest.
	^ answer