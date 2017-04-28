accessing
sessionClass

	^ self class environment at: #LavaSession ifAbsent: [MagmaSession]
