*magma server
shouldBeSecondary
	"Never ping anything else when receiving a swap request, if the administrator has the wrong server, the jig is up."
	self isSecondary not ifTrue: 
		[ MagmaWrongServerError new
			correctServer: self node primaryLocation ;
			signal: self printString , ' should be sent to a secondary server of multi-server nodes.' ]