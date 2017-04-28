accessing
linkToReplace: aMaNetworkServerLink 
	^ oldLink = aMaNetworkServerLink
		ifTrue: [ newLink ]
		ifFalse: [ oldLink ]