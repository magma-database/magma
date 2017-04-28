private
startFor: testCaseClass 
	"Start the server for this player."
	| server testPlayer |
	testPlayer := MaNetworkTestPlayer testCaseClass: testCaseClass.
	server := MaNetworkRequestServer protocol: testPlayer protocol.
	server console: MaTranscriptConsole new.
	server 
		processOn: link port
		using: [ : req | testPlayer processRequest: req ].
	testCaseClass testPlayer: 
		(testPlayer
			server: server ;
			yourself)