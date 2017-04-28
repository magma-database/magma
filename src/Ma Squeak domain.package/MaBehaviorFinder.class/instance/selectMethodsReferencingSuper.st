methods
selectMethodsReferencingSuper
	"Select methods which send any message to super."
	self selectMethods: [ : each | each sendsToSuper ]