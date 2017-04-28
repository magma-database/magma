status
waitForTaskComplete
	"First, we can simply wait for the launchProcess to terminate."
	[ launchProcess notNil and: [ launchProcess isTerminated not ] ] whileTrue: [ (Delay forSeconds: 1) wait ].
	"Now wait for remaining players to finish up."
	self waitForAllPlayersUnready