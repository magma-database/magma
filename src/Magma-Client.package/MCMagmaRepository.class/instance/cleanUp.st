private
cleanUp
	session ifNotNil:
		[ session disconnectAndClose.
		session := nil ]