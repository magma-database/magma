auditorialization
playAuditorialization: aBoolean 
	"Whether or not to play sounds representing request processing."
	(playAuditorialization := aBoolean) = true
		ifTrue: [ soundQueue ifNotNil: [soundQueue play] ]
		ifFalse: [ soundQueue ifNotNil: [soundQueue reset] ]