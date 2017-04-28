updating
addLocation: aMagmaRemoteLocation 
	self removeLocation: aMagmaRemoteLocation.
	locations := locations copyWith: aMagmaRemoteLocation