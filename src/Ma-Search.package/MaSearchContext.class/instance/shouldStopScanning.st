scanning
shouldStopScanning
	scanProcess waitForResume.
	^ scanProcess shouldStop or:
		[ self atEnd or:
			[ timer expired or:
				[ | maxResults |
				maxResults := self preferred: #maximumScanResults.
				maxResults > 0 and: [ self size >= maxResults ] ] ] ]