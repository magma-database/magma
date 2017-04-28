*ma base additions
maFirstCommentOrNilAt: selector
	"A much more-convenient method than firstCommentAt:, which requires you to specify the exact class, a problem when the method is implemented in the superclass methodDict."

	| string |
	^(string := self maFirstCommentAt: selector) isEmpty
		ifTrue: [ nil ]
		ifFalse: [ string ]