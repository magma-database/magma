test rollback recovery
buildIndexedMagmaCollectionFrom: aClass at: aString

	| indexDef mc |
	mc := MagmaCollection new.
	indexDef := self newKeywordIndex.
	mc addIndex: indexDef.
	clientSession commit: [ clientSession root at: aString put: mc ].
	self
		addToMcFrom: aClass
		at: aString