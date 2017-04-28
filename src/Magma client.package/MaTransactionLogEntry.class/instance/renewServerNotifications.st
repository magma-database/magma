actions
renewServerNotifications

	| answer |
	answer := serverNotifications.
	serverNotifications notEmpty ifTrue: [ self initializeServerNotifications ].
	^ answer