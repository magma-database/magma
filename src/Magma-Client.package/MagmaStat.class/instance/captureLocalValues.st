private
captureLocalValues
	deltaCount isZero ifFalse:
		[ self
			
			attributeNamed: #deltaCountBeforeRefresh
			put: deltaCount ;
			
			attributeNamed: #deltaSumBeforeRefresh
			put: deltaSum ]