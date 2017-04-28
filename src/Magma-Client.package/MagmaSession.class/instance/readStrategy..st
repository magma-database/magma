performance
readStrategy: aMaReadStrategy 
	"Once the readStrategy is set, aMaReadStrategy is converted to use class ids.."
	aMaReadStrategy isBasic ifTrue: 
		[ "basic read-strategies are not allowed because they circumvent the systemReadStrategy in the server."
		MagmaUserError signal: 'Basic read-strategies are not allowed, use a MaReadStrategy.' ].
	guard critical: 
		[ readStrategy := aMaReadStrategy.
		self prepareReadStrategy ]