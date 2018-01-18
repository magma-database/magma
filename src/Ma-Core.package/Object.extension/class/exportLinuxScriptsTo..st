*ma-core
exportLinuxScriptsTo: aFileDirectory 
	self linuxScriptSelectors do:
		[ : eachSelector | | eachPair |
		eachPair := self perform: eachSelector.
		aFileDirectory
			fileNamed: eachSelector
			do:
				[ : stream | stream
					 truncate: 0 ;
					 lineEndConvention: #lf ;
					 nextPutAll: eachPair key ].
		eachPair value innerSourceString = 'nil' ifFalse:
			[ aFileDirectory
				fileNamed: eachSelector , '.st'
				do:
					[ : stream | stream
						 truncate: 0 ;
						 lineEndConvention: #lf ;
						 nextPutAll: eachPair value innerSourceString ] ] ].
	self exportSqueakConfTo: aFileDirectory