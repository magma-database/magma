maui support
maChooseNotificationHandlerUsing: aMauiMorph 
	"This method is provided for Maui.  It allows a seamless UI transition for MagmaForwardingProxy's into the UI screens representing the other domain they exist in, so that the proper notificationHandler is set for them (used to intercept MagmaSessionRequests)."
	^ aMauiMorph object magmaSession ifNil: [ self ]