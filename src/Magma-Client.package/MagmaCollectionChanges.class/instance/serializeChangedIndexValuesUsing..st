serializing
serializeChangedIndexValuesUsing: aMaObjectSerializer

	self changedKeySpecificationsDo: [ :eachSpec | eachSpec serializeUsing: aMaObjectSerializer ]