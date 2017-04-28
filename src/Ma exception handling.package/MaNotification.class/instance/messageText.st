as yet unclassified
messageText

	^super messageText ifNil: [ self species name, ' - no detailed message available' ]