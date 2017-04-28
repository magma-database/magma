test
orchestraTest: numberOfTasks cores: numberOfCores 
	| orch |
	orch := (MaNetworkOrchestra name: 'orcchestraTest')
		 maxCores: numberOfCores asInteger ;
		 yourself.
	1
		to: numberOfTasks
		do:
			[ : n | orch
				playerNamed: 'player', n asString
				do: [ Smalltalk runAndQuit: [ (Delay forSeconds: (1 to: 10) atRandom) wait ] ] ].
	orch launch.
	orch isConductorImage ifTrue: [ orch waitForTaskComplete ]