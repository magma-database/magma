*ma-core
validateIsKindOf: aClassOrClasses ifNotSignal: userErrorClass 
	(self isKindOf: aClassOrClasses) ifFalse:
		[ userErrorClass signalPage:
			(MauiPage streamContents:
				[ : stream | stream
					 maPrint: 'This message accepts a ' ;
					 maPrint: aClassOrClasses asString ]) ]