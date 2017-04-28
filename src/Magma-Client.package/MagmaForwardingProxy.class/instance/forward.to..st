private
forward: aMessage to: anObject 
	"Intercept any MagmaSessionRequests signaled within the boundaries of anObject's domain and let its own session handle them."
	^ [ aMessage sendTo: anObject ]
		on: MagmaSessionRequest
		do: [ : notification | notification handleAndResumeUsing: self remoteSession ]