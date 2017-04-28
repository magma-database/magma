*ma-core
innerSourceString
	^ String streamContents: [ : stream | self printInnerSourceOn: stream ]