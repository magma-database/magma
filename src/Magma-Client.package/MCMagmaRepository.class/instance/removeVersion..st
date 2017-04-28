accessing
removeVersion: aMCVersionOrConfiguration 
	^ self mcModel ifNotNil:
		[ : mcmodel | mcmodel removeVersion: aMCVersionOrConfiguration ]