test MagmaArray
testMagmaArray

	self
		remotePerform: #createMagmaArray in: 'client1' ;
		remotePerform: #verifyMagmaArray in: 'client2' ;
		remotePerform: #changeSome in: 'client1' ;
		remotePerform: #changeOthers in: 'client2' ;
		remotePerform: #changeAtIndex50 in: 'client1' ;
		remotePerform: #tryChangingIndex50 in: 'client2'