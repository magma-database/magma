*ma base additions
smalltalkToWords
	"smalltalkString may be a Smalltalk class name, method name, or a parameter name (aString or smalltalkString).
	
	'MauiUserStrategy' answers 'Maui User Strategy'
	'smalltalkToWords:' answers 'Smalltalk To Words:'
	'aString' answers 'A String'
	'aMaObjectSerializer' answers 'A Ma Object Serializer'
	'aMagmaSession' answers 'A Magma Session'
	'A typical overridden name:' answers 'A typical overridden name:'"
	| smalltalkStream words |
	smalltalkStream := self readStream.
	words := String streamContents: 
		[ : stream | 
		[ smalltalkStream atEnd ] whileFalse: 
			[ (smalltalkStream peek isUppercase and: [ stream isEmpty not and: [ stream last ~= Character space ] ]) ifTrue: [ stream space ].
			stream isEmpty 
				ifTrue: [ stream nextPut: smalltalkStream next asUppercase ]
				ifFalse: [ stream nextPut: smalltalkStream next ] ] ].
	^ words