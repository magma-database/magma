*ma-core
exportLinuxScripts: aCollection to: aFileDirectory 
	aCollection do:
		[ : eachSelector | | eachPair |
		eachPair := self perform: eachSelector asSymbol.
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