private
stronglyReferencePage
	| session |
	session := self session.
	(session notNil and: [ session inTransaction and: [ segment notNil ] ]) ifTrue: [ session stronglyReference: segment objects value ]