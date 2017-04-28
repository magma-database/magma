*magma client
materializedFromMagma: aMagmaMaterializationEvent
	"Sigh.  Instance-based event listeners are required for every instance, so here is an opportunity to register.  Another way to do this is to simply send 
	
	myMagmaSession
		when: #materializedFromMagma 
		send: #yourMaterializationHandlerSelector:  (the arg is a MagmaMaterializationEvent)
		to: yourObject

If you use this method-based approach instead, be sure to call super."

	"do nothing by default."