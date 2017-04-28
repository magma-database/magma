maui support
send: aMessage to: anObject 
	"Allow me to be used as a MauiNotificationHandler."
	"We have time here to make sure the receiver is the proper one to be handling the MagmaSessionRequests for anObject.  Do it just to be extra conservative."
	| handlingSession |
	handlingSession := anObject quickMagmaSession ifNil: [ self ].
	^ [ aMessage sentTo: anObject ] 
		on: MagmaSessionRequest
		do: [ : req | req handleAndResumeUsing: handlingSession ]