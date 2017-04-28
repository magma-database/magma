private
rowSpecificationFor: anObject 
	^ rowSpecifications 
		at: anObject maOriginalClass
		ifAbsentPut: [ self defaultRowSpecificationFor: anObject ]