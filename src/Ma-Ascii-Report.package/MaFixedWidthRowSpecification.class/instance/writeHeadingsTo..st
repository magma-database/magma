private
writeHeadingsTo: aWriteStream 
	self columns do: [ : each | each hasHeading ifTrue: [ aWriteStream nextPutAll: each headingValue ] ]