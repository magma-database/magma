accessing
definitionByteArray
	| oid |
	^ MaOidCalculator oidForNil = (oid := filer definitionOid)
		ifTrue:
			[ (self serverSerializer serializeGraph: repositoryController definition) trimmedByteArray ]
		ifFalse:
			[ self
				byteArrayAt: oid
				using: systemReadStrategy ]