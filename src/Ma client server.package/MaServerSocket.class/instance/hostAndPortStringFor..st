printing
hostAndPortStringFor: aSocket 
	^ 'host: ' , (NetNameResolver stringFromAddress: aSocket remoteAddress) , ' port: ' , aSocket port printString