*ma-core
maAllInstVarNamesDo: aBlock

	superclass ifNotNil: [ superclass maAllInstVarNamesDo: aBlock ].
	self instVarNames do: aBlock