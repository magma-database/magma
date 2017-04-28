run
prepareStressors: configurations at: aMagmaRemoteLocation andSaveClientStressorAs: newImageName 
	"Create new MagmaStressTestors based on configurations, but save-and-exit the image before flooding the server.  This allows this saved image to simply be started on any machine to add to the server stress."
	| stressors |
	stressors := self 
		createFrom: configurations
		at: aMagmaRemoteLocation.
	self saveAndExitAs: newImageName.
	stressors do: [ : each | [ each floodServerUntil: [ false ] ] fork ]