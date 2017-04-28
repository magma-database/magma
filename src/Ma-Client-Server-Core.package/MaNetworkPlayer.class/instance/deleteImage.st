private
deleteImage
	MaNotification signal: 'deleting ' , self imageName.
	FileDirectory default
		 deleteFileNamed: self imageName ;
		 deleteFileNamed: self changesName