as yet unclassified
startServerPlayer
	| server testPlayer |
	testPlayer := MaNetworkTestPlayer testCaseClass: self.
	server := MaNetworkRequestServer protocol: testPlayer protocol.
	MagmaCollectionIndex maRecursiveRemove.
	server console: MaTranscriptConsole new.
	server 
		processOn: 1316
		using: [ : req | testPlayer processRequest: req ].
	{  server. testPlayer  } explore