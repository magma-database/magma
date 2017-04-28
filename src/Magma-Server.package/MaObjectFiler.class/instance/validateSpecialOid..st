debugging
validateSpecialOid: selectorSymbol 
	((self perform: selectorSymbol) 
		between: FirstUserObjectOid
		and: FirstUserObjectOid + 10000) ifFalse: 
		[ MagmaCorruptionError signal: 'The ' , selectorSymbol , ' does not appear valid' ]