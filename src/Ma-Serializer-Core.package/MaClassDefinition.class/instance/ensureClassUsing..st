accessing
ensureClassUsing: aMaObjectSerializer 
	^ self classObject ifNil: [ self createClassUsing: aMaObjectSerializer ]