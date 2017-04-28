test changed detection
setupChangedDetection
	clientSession commit:
		[ clientSession root
			at: #testChangedDetection
			put: (MagmaPerson new name: 'original-name') ]