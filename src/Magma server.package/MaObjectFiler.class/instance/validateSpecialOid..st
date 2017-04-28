debugging
validateSpecialOid: selectorSymbol 
	((self perform: selectorSymbol) 
		between: MaOidCalculator firstUserObjectOid
		and: MaOidCalculator firstUserObjectOid + 10000) ifFalse: 
		[ MagmaCorruptionError signal: 'The ' , selectorSymbol , ' does not appear valid' ]