private
otherPlotsDo: aBlock 
	stack ifNotNil:
		[ stack plots do:
			[ : each | each == self ifFalse: [ aBlock value: each ] ] ]