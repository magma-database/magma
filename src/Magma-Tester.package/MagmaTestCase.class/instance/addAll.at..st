private
addAll: aCollection at: aString 
	self 
		remotePerform: #addAllToLocalCollection:at:
		withArguments: {  aCollection. aString  }
		in: 'client1'.
	^ self 
		remotePerform: #addAllToLargeCollection:at:
		withArguments: {  aCollection. aString  }
		in: 'client2'