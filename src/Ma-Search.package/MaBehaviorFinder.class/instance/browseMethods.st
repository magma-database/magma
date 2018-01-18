actions
browseMethods
	"Open a methods browser on my methods."
	self systemNavigation
	 	browseMessageList: (self sortedMethods)
		name: 'methods found'