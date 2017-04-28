access
string
	^ text ifNil: [ String empty ] ifNotNil: [ text mauiPageString ]