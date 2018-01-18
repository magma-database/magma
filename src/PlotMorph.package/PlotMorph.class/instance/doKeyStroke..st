event handling
doKeyStroke: aKeyboardEvent
	aKeyboardEvent keyCharacter caseOf: {
		[ self cycleLensStyleKey ] -> [ self cycleLensStyle: aKeyboardEvent ].
		[ self cycleCrosshairKey ] -> [ self cycleCrosshairStyle: aKeyboardEvent ].
		[ self toggleHelpKey ] -> [ self toggleHelpDisplay ] }
		 otherwise: [  ]