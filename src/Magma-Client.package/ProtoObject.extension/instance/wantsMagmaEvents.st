*magma-client
wantsMagmaEvents
	"If true, this object will listen to #magmaAboutToRefresh events from the event-listener mechanism (see Object 'events' method category).  After overriding with true in your class, you may then use #when:send:to: to direct the events to your purpose.  For example:
	
	self when: #magmaAboutToRefresh send: #doSomething to: anyObject
	self when: #magmaRefreshed send: #changed to: self
	self when: #materializedFromMagma send: #upgrade: to: self  (arg is a MagmaMaterializationEvent)"

	^ false