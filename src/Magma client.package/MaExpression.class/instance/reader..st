private
reader: aMagmaCollectionReader 
	super reader: aMagmaCollectionReader.
	self terms do: [ : each | each reader: aMagmaCollectionReader ]