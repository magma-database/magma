private
requestUserFor: aMagmaSession

	^ (self session: aMagmaSession)
		messageText: 'Supply a userId for ', aMagmaSession linkInformation ;
		signal