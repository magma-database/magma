actions
validateVersion
	"14 requires an upgrade using the Magma upgrader package."
	self version = 14 ifFalse:
		[ | msg |
		msg := 'This database requires Magma version ' , self version printString , '.  You are running version ' , MagmaSession magmaVersion printString.
		({12. 
		13} includes: self version)
			ifTrue: 
			[ "This warning is handled by the MagmaUpgrader, so the user should not see it.  If they do, the message is correct."
			MagmaWarning signal: msg , '  You are not running the Magma Upgrader, so you must select Abandon.' ]
			ifFalse:
				[ ({MagmaSession magmaVersion. 16} includes: self version) ifFalse: [ MagmaUserError signal: msg ] ] ]