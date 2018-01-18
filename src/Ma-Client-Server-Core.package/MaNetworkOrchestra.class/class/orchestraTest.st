linux-scripts
orchestraTest
	^ 'spur mt-spur orchestraTest.st $1 $2' ->
		[ Smalltalk runAndQuit:
			[ : numberOfTasks : numberOfCores | MaNetworkOrchestra
				orchestraTest: numberOfTasks asInteger
				cores: numberOfCores asInteger ] ]