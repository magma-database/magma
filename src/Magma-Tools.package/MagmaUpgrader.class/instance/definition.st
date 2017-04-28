accessing
definition
	"Answer the repository definition."
	^ definition ifNil: [ definition := self session definition ]