links
hasCanonicalizedMagmaId: aMagmaId 
	"If aMagmaId is already present in one of my other links, use it instead."
	^ aMagmaId = self magmaId or: [ self links anySatisfy: [ : each | each = aMagmaId ] ]