*ma armored code
maRunUsing: aSymbol
	| result |
	result := TestResult new.
	[ self 
		perform: aSymbol 
		with: result ] 
			ensure: [self resources do: [:each | each reset ] ].
	^ result