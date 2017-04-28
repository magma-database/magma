private
reader: aMagmaCollectionReader 
	reader := aMagmaCollectionReader.
	self terms do: [ : each | each reader: aMagmaCollectionReader ]