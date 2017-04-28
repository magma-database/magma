About:
A MaNetworkOrchestra is an object which lets you divide a large task among multiple CPU cores.  The current running process is forked into into two or more separate image instances running in parallel and working on different parts of the same large task.

Setup:
To use it, create and set up the Orchestra object with the desired number of Players.  Then send #launch to the Orchestra.  For example:

	(MaNetworkOrchestra name: 'one-big-task')
		maxCores: 4 "<--- Keep up to 4 player images running simultaneously." ;
		playerNamed: 'subtask1' playerName doAndQuit: [ "perform subtask1" ] ;
		playerNamed: 'subtask2' playerName doAndQuit: [ "perform subtask2" ] ;
		playerNamed: 'subtask3' playerName doAndQuit: [ "perform subtask3" ] ;
		playerNamed: 'subtask4' playerName doAndQuit: [ "perform subtask4" ] ;
		playerNamed: 'subtask5' playerName doAndQuit: [ "perform subtask5" ] ;
		playerNamed: 'subtask6' playerName doAndQuit: [ "perform subtask6" ] ;
		launch

#launch causes the originating image to be saved under the Orchestra's #name (to preserve the original launching image and assume the role of "conductor") and then proceeds to launch additional copies of itself, one for each Player defined in the Orchestra.  The conductor is then able to send #remotePerform: requests to any player for purposes of initiating the task, reporting status, or shutting down.

The above use convenience method to create a generic Player instance for brevity of the example.  In fact, highly customized Players can be created and added via the #addPlayer: message.  See references to this class for custom examples employed by my test-cases.

Resource Management:
The Orchestra specifies how many players to keep running simultaneously by its #maxCores.  The running conductor pings its players every second.  As player images complete their task and exit the image, the ping fails and a "core" slot frees up in the Orchestra., whereupon it will launch the next defined Player and monitor it.

TestCases as a complex Example:
The Ma-Client-Server-Tester packages themselves serve as another example of using an Orchestra:  to test the CS functionality of this package, we need two client images and one server image for a total of three Player images.  The conductor sends requests to the server image such as "start your server", "shutdown your server" and messages to the clients such as "connect to the server at: port123" or, "send this remotePerform request to the server", etc.