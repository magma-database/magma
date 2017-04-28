scanning
shouldStopScanning
	scanProcess waitForResume.
	^ scanProcess shouldStop or: 
		[ self atEnd or: 
			[ timer expired or: [ self size >= (self preferred: #maximumScanResults) ] ] ]