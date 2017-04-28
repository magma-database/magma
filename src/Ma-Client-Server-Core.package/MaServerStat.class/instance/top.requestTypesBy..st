chart
top: anInteger requestTypesBy: operatorAttribute 
	| top |
	top := self topRequestProcessingTimeHistorysBy: operatorAttribute.
	^ top
		copyFrom: 1
		to: (anInteger min: top size)