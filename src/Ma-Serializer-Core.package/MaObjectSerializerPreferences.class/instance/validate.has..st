validate
validate: className has: selector 
	| inst cls |
	className isSymbol ifFalse: [ MaObjectSerializationUserError signal: 'Specify the class *name*, not the class itself.' ].
	(Smalltalk hasClassNamed: className) ifFalse: [ "No validation needed"
		^ self ].
	"MagmaForwardingProxy cannot understand #perform:, so we special check it by type name."
	className = #MagmaForwardingProxy ifTrue: [ ^ self ].
	inst := (cls:=Smalltalk at: className) someInstance
		ifNil: [ cls basicNew ].
	(inst perform: selector) ifFalse: [ MaObjectSerializationUserError signal: 'Need to implement ' , selector , ' on ' , className ]