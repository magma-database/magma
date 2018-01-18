initialize-release
initialize
	super initialize.
	players := OrderedCollection new.
	firstPort := 44441.
	guard := Mutex new.
	prepareImageSelector := #createImage.
	onePlayerImage := true.
	self maxCores: 4