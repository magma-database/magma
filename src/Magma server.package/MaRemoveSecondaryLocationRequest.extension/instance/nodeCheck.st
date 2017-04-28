*magma server
nodeCheck
	self isPrimary ifFalse: 
		[ MagmaUserError signal: 'This request may only be sent to the primary server.' ]