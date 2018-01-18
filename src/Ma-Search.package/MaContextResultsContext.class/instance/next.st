private
next
	"Allow results are being scanned as they are still being populated by the source context."
	[ queue isEmpty and: [ source source isRunning ] ] whileTrue: [ (Delay forSeconds: 1) wait ].
	^ queue isEmpty ifFalse: [ queue next ]