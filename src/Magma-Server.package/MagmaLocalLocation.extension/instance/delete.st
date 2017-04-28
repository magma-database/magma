*magma-server-actions
delete
	"Delete the files at my location."
	self isMagmaRepository 
		ifTrue: 
			[ MagmaDeleteWarning signal: 'The Magma database at ' , self pathName , ' is about to be deleted.'.
			self directory recursiveDelete ]
		ifFalse: 
			[ MagmaNotification signal: 'There is no Magma repository at ' , self pathName ]