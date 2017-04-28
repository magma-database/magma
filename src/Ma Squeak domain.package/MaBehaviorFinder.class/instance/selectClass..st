classes
selectClass: aClass 
	"Select all methods in the receiver which exist in an aClass"
	self selectMethods: [ : each | each actualClass == aClass ]