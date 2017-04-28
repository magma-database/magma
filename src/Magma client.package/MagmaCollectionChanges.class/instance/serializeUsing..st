serializing
serializeUsing: aMaObjectSerializer 
	super serializeUsing: aMaObjectSerializer.
	self
		serializeRemovedUsing: aMaObjectSerializer ;
		serializeChangedIndexValuesUsing: aMaObjectSerializer