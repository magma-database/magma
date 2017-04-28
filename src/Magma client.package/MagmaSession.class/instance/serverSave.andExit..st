accessing
serverSave: saveOption andExit: exitOption 
	"Tell the server to save and exit the image.  This is used for headless operation when the World menu cannot otherwise be obtained."
	self ensureIsAdminSession.
	^ 
	[ self submit: (MaSaveAndExitImageRequest new
			save: saveOption ;
			exit: exitOption ;
			yourself) ] 
		on: NetworkError
		do: 
			[ : err | 
			"we may expect a network error, because we just told it to shutdown."
			false ]