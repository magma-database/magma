*Magma seaside
renderMagmaLocationAttribute: anAttribute on: html 
	| location |
	location := configuration valueForAttribute: anAttribute.
	html div
		id: 'location' ;
		with: 
			[ html table: 
				[ location isLocal 
					ifTrue: 
						[ html tableRow with: 
							[ html tableData: [ html label: 'path:' ].
							html tableData: 
								[ html textInput 
									on: #path
									of: location ] ] ]
					ifFalse: 
						[ html tableRow with: 
							[ html tableData: [ html label: 'host:' ].
							html tableData: 
								[ html textInput 
									on: #host
									of: location ] ].
						html tableRow with: 
							[ html tableData: [ html label: 'port:' ].
							html tableData: 
								[ html textInput
									value: location port ;
									callback: [ : v | location port: v asNumber ] ] ] ] ] ]