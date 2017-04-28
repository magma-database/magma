private
write: anObject to: aWriteStream 
	self columns do: [ : eachColumn | aWriteStream nextPutAll: (eachColumn value: anObject) ]