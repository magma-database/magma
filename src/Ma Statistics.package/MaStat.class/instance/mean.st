accessing
mean
	"The average value."
	^ (sum isNil or: [ count isNil ]) 
		ifTrue: [ nil ]
		ifFalse: [ sum / count asFloat roundTo: self class defaultPrecision ]