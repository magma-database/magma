performance
immutabilityStrategy
	^ immutabilityStrategy ifNil: [ MaImmutabilityStrategy new ]