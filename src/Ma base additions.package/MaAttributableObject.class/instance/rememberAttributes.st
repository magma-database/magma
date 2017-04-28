remember/restore
rememberAttributes
	"Remember my current attributes as an attribute called, #priorAttributes."
	| priorAttributes |
	(self attributeNamed: #priorAttributes) ifNotNil: [ MaUserError signal: 'priorAttributes already present' ].
	priorAttributes := attributes.
	attributes := attributes copy.
	self 
		attributeNamed: #priorAttributes
		put: priorAttributes