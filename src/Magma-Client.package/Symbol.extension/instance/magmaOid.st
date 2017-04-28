*magma-client
magmaOid
	| sessions |
	sessions := MagmaSession connectedSessions select:
		[ : eachSession | eachSession isPersistent: self ].
	^ sessions size > 1
		ifTrue: [ MagmaUserError signal: self printString , ' is persistent in more than one connected Magma repository, therefore its #magmaOid would be ambiguous.  Please change the code to ask the correct Session instance, #oidFor: ' , self printString ]
		ifFalse:
			[ sessions isEmpty ifFalse: [ sessions anyOne oidFor: self ] ]