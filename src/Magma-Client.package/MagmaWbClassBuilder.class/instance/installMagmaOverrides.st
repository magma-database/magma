as yet unclassified
installMagmaOverrides
	class
		compileSilently:
'maOriginalClass
	^ self class superclass'
		classified: 'accessing'.
	class
		compileSilently:
'xxxClass
	^ self class superclass'
		classified: 'accessing'.
	class class
		compileSilently:
'theNonWriteBarrierClass
	^ self superclass'
		classified: 'accessing'.