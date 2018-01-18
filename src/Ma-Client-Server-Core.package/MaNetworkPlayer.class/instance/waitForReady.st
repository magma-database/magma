client side
waitForReady
	"After sending #launch, it takes a couple of seconds for the image to launch and the server to start.  Wait here until it's ready."
	[ self isReady ] whileFalse:
		[ MaClientServerNotification signal: 'Waiting for ' , self name , ' player to start.'.
		(Delay forSeconds: 1) wait ]