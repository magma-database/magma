*ma-core
stScriptNames
	^ Array streamContents:
		[ : stream | self linuxScriptSelectors do:
			[ : each | (self perform: each) value innerSourceString ~= 'nil' ifTrue: [ stream nextPut: each , '.st' ] ] ]