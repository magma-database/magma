accessing
prerequisitePackageNames
	^ super prerequisitePackageNames , { 
			(MaExceptionHandlingPackageInfo packageName).
			(MaBaseAdditionsPackageInfo packageName).
			'Collections-BTree'.
			(MaObjectSerializationPackageInfo packageName).
			(MaSpecialCollectionsPackageInfo packageName).
			(MaContextualSearchPackageInfo packageName).
			(MaClientServerPackageInfo packageName).
			(MagmaClientPackageInfo packageName)
		 }