historys
topRequestProcessingTimeHistorysBy: operatorSymbol 
	^ requestProcessingTimeHistorys asArray sort:
		[ : a : b | (a perform: operatorSymbol) > (b perform: operatorSymbol) ]