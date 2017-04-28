as yet unclassified
finalizeValues: finiObjects
	"Remove all associations with key == nil and value is in finiObjects.  This method is folded with #rehash for efficiency."

	"sig: this message sent only from WeakRegistry, and there is always key==nil for each finiObjects,
	no point to do anything extra than simple finalizeValues
	"
	^ self finalizeValues