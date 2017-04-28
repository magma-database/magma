private
objectsDo: oneArgBlock 
	self oidsAndObjectsDo: [ : eachOid : eachObject | oneArgBlock value: eachObject ]