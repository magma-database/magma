private
checkOverrideOf: aSymbol 
	| fields |
	fields := self fieldsWrittenToBySelector: aSymbol.
	fields isEmpty
		ifTrue:
			[ (class includesSelector: aSymbol) ifTrue: [ class removeSelector: aSymbol ] ]
		ifFalse:
			[ fields =
				(fieldsCache
					at: aSymbol
					ifAbsent: [  ]) ifFalse:
				[ self
					installOverrideOf: aSymbol
					fields: fields ] ]