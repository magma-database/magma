accessing
preferred: attributeSymbol

	^(preferences perform: attributeSymbol)
		ifNil: [ MaContextPreferences global perform: attributeSymbol ]