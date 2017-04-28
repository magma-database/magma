accessing
prerequisitePackageNames
	^ super prerequisitePackageNames , { 
			(MaExceptionHandlingPackageInfo packageName).
			(MaBaseAdditionsPackageInfo packageName).
			(MaObjectSerializationPackageInfo packageName).
			(MaClientServerPackageInfo packageName).
			(MaArmoredCodePackageInfo packageName).
			(MaSpecialCollectionsPackageInfo packageName).
			(MagmaClientPackageInfo packageName).
			(MagmaServerPackageInfo packageName).
			(MaObjectSerializationTesterPackageInfo packageName).
			(MaSpecialCollectionsPackageInfo packageName).
			'Ma special collections tester'
		 }