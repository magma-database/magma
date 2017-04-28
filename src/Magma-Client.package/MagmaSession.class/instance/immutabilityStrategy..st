performance
immutabilityStrategy: aMaImmutabilityStrategy 
	"Capture some of the immutables"
	self addSystemImmutablesTo: aMaImmutabilityStrategy.
	serializer
		initializeImmutabilityStrategy: aMaImmutabilityStrategy
		using: transaction.
	immutabilityStrategy := aMaImmutabilityStrategy