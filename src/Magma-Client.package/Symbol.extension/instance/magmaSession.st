*magma-client
magmaSession
	| sessions |
	sessions := MagmaSession connectedSessions select:
		[ : eachSession | eachSession isPersistent: self ].
	^ sessions size > 1
		ifTrue: [ MagmaUserError signal: self printString , ' is persistent in more than one connected Magma repository, therefore its #magmaSession would be ambiguous.  Please change the code to use the correct Session instance.' ]
		ifFalse:
			[ sessions isEmpty ifFalse: [ sessions anyOne ] ]