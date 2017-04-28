private
legacyClassMap
	^ ({99 -> MagmaCounter} , super legacyClassMap) sort: [ : a : b | a key < b key ]