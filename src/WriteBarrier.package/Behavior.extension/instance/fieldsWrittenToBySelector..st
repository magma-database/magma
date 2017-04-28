*writebarrier
fieldsWrittenToBySelector: aSymbol
	| cm |
	cm := self lookupSelector: aSymbol.
	^ cm ifNil: [#()] ifNotNil: [(1 to: self instSize) select: [:i | cm writesField: i]]