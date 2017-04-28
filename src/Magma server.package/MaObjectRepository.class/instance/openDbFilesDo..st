recovery
openDbFilesDo: twoArgBlock 
	"Value twoArgBlock with each database file and its fileId."
	filer filesDo: twoArgBlock.
	largeCollectionManagers do: [ : each | each filesDo: twoArgBlock ]