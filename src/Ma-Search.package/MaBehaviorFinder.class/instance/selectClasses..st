classes
selectClasses: aBlock 
	"Filter out all methods in the receiver that don't belong to one of the classes whose names contain  classNameArgumentSubstring."
	self selectMethods: [ : each | aBlock value: each actualClass ]