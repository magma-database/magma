validate
validate: className has: selector 
	(Smalltalk hasClassNamed: className) ifFalse: [ "No validation needed"
		^ self ].
	"MagmaForwardingProxy cannot understand #perform:, so we special check it by type name."
	className = #MagmaForwardingProxy ifTrue: [ ^ self ].
	((Smalltalk at: className) basicNew perform: selector) ifFalse: [ MaObjectSerializationUserError signal: 'Need to implement ' , selector , ' on ' , className ]