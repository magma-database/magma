private
writeHeadingUnderlinesTo: aWriteStream 
	self columns do: 
		[ : each | 
		(each hasHeading and: [ each hasUnderlinedHeading ]) ifTrue: [ aWriteStream nextPutAll: each headingUnderlineValue ] ]