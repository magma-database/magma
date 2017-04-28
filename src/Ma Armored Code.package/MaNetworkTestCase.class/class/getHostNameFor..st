accessing
getHostNameFor: playerName 
	^ NetNameResolver localHostName

	"Commenting out this old code to allow for one-click run of network test cases."
	"
	^(self players includesKey: playerName)
		ifTrue:
			[ (self playerNamed: playerName) hostname ]
		ifFalse:
			[ NetNameResolver addressFromString: 
				(FillInTheBlank 
					request: 'Enter the hostname of ', playerName
					initialAnswer: 'localhost') ]"