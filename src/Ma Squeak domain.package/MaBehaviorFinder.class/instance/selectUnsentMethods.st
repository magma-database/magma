methods
selectUnsentMethods
	"Answer methods which are not sent by any other object in the system."
	self selectMethods: [ : each | (self systemNavigation allCallsOn: each selector) isEmpty ]