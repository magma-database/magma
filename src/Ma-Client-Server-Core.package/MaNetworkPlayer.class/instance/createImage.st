private
createImage
	self deleteImage.
	MaNotification signal: 'copying ' , (FileDirectory default localNameFor: Smalltalk imageName) , ' to ' , self imageName.
	FileDirectory default
		
		putFile: Smalltalk imageEntry readStream
		named: self imageName ;
		
		putFile: Smalltalk changesEntry readStream
		named: self changesName