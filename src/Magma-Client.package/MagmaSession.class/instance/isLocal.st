connections
isLocal
	^ primaryLink isLocal and: [ primaryLink == secondaryLink ]