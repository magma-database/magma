building
mergeSpecificationsFrom: aMaReadStrategy 
	aMaReadStrategy depthSpecifications keysAndValuesDo: 
		[ : eachClass : eachDictionary | 
		self beNew.
		depthSpecifications 
			at: eachClass
			put: eachDictionary ]