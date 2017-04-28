client-requests
readAnchorFor: sessionId using: aMaReadStrategy

	| anchorOid |
	^ MaOidCalculator oidForNil = (anchorOid := filer anchorOid)
		ifTrue:
			[ (self serverSerializer serializeGraph: MaRootAnchor new) trimmedByteArray ]
		ifFalse:
			[ self
				read: anchorOid
				for: sessionId
				using: aMaReadStrategy ]