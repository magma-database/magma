event handling
keyStroke: aKeyboardEvent 
	plots do:
		[ : each | (each handlesKeyboard: aKeyboardEvent) ifTrue: [ each doKeyStroke: aKeyboardEvent ] ]