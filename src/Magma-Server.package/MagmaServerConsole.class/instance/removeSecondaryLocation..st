high-availability
removeSecondaryLocation: aMagmaRemoteLocation 
	MagmaNodeUpdate new
		remove: aMagmaRemoteLocation ;
		processUsing: self